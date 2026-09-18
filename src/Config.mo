// Config.mo — shared configuration types and default config for OpenAI API

import Text "mo:core/Text";
import Array "mo:core/Array";
import List "mo:core/List";
import Nat "mo:core/Nat";
import Iter "mo:core/Iter";

module {
    public type Auth = {
        #bearer : Text;
        #apiKey : Text;
        #basicAuth : { user : Text; password : Text };
    };

    /// Management-canister interface for HTTP outcalls, declared once per client
    /// instead of once per API module. Also the single place where the toolchain
    /// split lives: dfx imports IDL-style snake_case names, icp-cli imports
    /// `mo:ic/Types`, and a plain build declares the types itself.
    public module _Ic {
        // Based on https://github.com/dfinity/interface-spec/blob/master/spec/ic.did
        public type HttpHeader = {
            name : Text;
            value : Text;
        };

        public type HttpMethod = {
            #get;
            #head;
            #post;
            #put;    // Non-replicated only (is_replicated forced to ?false in generated code)
            #delete; // Non-replicated only (is_replicated forced to ?false in generated code)
            #patch;  // Non-replicated only; NOT idempotent in general (RFC 5789) — merge bodies only
        };

        public type HttpRequestArgs = {
            url : Text;
            max_response_bytes : ?Nat64;
            method : HttpMethod;
            headers : [HttpHeader];
            body : ?Blob;
            transform : ?{
                function : shared query ({ response : HttpRequestResult; context : Blob }) -> async HttpRequestResult;
                context : Blob;
            };
            is_replicated : ?Bool;
        };

        public type HttpRequestResult = {
            status : Nat;
            headers : [HttpHeader];
            body : Blob;
        };

        public let http_request = (actor "aaaaa-aa" : actor { http_request : (HttpRequestArgs) -> async HttpRequestResult }).http_request;
    };

    public type Config = {
        baseUrl : Text;
        auth : ?Auth;
        max_response_bytes : ?Nat64;
        transform : ?{
            function : shared query ({ response : _Ic.HttpRequestResult; context : Blob }) -> async _Ic.HttpRequestResult;
            context : Blob;
        };
        is_replicated : ?Bool;
        cycles : Nat;
    };

    /// Default configuration for OpenAI API.
    /// Customize with record update syntax:
    ///   { defaultConfig with auth = ?#bearer "my-token" }
    ///
    /// `is_replicated` below is ?false (generator option `isReplicated`).
    /// `?false` has one node perform each outcall: required for anything not
    /// idempotent, since a replicated outcall repeats the request once per replica
    /// (~13 duplicate sends, and the credential leaves every node). `?true`/`null`
    /// have every replica call and their responses must agree byte-for-byte, which
    /// only works for deterministic bodies — a per-request id or timestamp fails
    /// consensus. Override per call site with record update if a particular
    /// endpoint wants the other mode.
    public let defaultConfig : Config = {
        baseUrl = "https://api.openai.com/v1";
        auth = null;
        max_response_bytes = null;
        transform = null;
        is_replicated = ?false;
        cycles = 30_000_000_000;
    };

    /// Internal client helpers (URL encoding, …), namespaced away from the
    /// public config surface above. `_`-prefixed so an API module that imports
    /// it but happens to need no encoding doesn't trip an unused-field warning.
    public module _Helpers {
        /// Uniform reject text for every failure path in the generated API modules:
        /// `HTTP <status>: <reason>`, with `body[<n>B]=<first 100 chars>`
        /// spliced in because this client was generated with `diagnostics`.
        /// Factored out so the wording lives in one place instead of being inlined at
        /// every decode step of every method.
        public func rejectMessage(status : Nat, body : Blob, reason : Text) : Text =
            "HTTP " # Nat.toText(status) # " body[" # Nat.toText(body.size()) # "B]=" #
            (switch (Text.decodeUtf8(body)) {
                case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t);
                case null "(undecodable)";
            }) # ": " # reason;

        // RFC 3986 unreserved set: A-Z a-z 0-9 - _ . ~
        func safeChar(c : Char) : Bool =
            (c >= 'A' and c <= 'Z') or (c >= 'a' and c <= 'z') or
            (c >= '0' and c <= '9') or c == '-' or c == '_' or c == '.' or c == '~';

        func safeByte(b : Nat8) : Bool =
            (b >= 0x41 and b <= 0x5A) or (b >= 0x61 and b <= 0x7A) or
            (b >= 0x30 and b <= 0x39) or b == 0x2D or b == 0x5F or b == 0x2E or b == 0x7E;

        // one uppercase hex digit (0-15) as its ASCII byte
        func hex(n : Nat8) : Nat8 = if (n < 10) 0x30 + n else 0x37 + n;

        /// Percent-encode a string as a URI component (RFC 3986): unreserved
        /// characters pass through, everything else is %XX-encoded from its
        /// UTF-8 bytes. Fast path: an all-unreserved string is returned as-is
        /// with no allocation.
        public func encodeComponent(s : Text) : Text {
            var needs = false;
            label scan for (c in s.chars()) {
                if (not safeChar c) { needs := true; break scan };
            };
            if (not needs) return s;
            let out = List.empty<Nat8>();
            for (b in (Text.encodeUtf8 s).values()) {
                if (safeByte b) List.add(out, b)
                else {
                    List.add(out, 0x25 : Nat8); // '%'
                    List.add(out, hex(b >> 4));
                    List.add(out, hex(b & 0x0F));
                };
            };
            switch (Text.decodeUtf8(Array.toBlob(List.toArray(out)))) {
                case (?t) t;
                case null s; // unreachable: output is ASCII
            };
        };
    };
}
