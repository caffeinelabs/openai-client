/// Breakdown of tokens used in the prompt.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CompletionUsagePromptTokensDetails.mo

module {
    /// The required-fields slice of CompletionUsagePromptTokensDetails — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CompletionUsagePromptTokensDetails as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        audio_tokens : ?Int;
        cached_tokens : ?Int;
    };

    public type CompletionUsagePromptTokensDetails = Required and Optional;

    public module JSON {
        // `init` constructs a CompletionUsagePromptTokensDetails from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CompletionUsagePromptTokensDetails.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CompletionUsagePromptTokensDetails {
            let ?res = from_candid(to_candid(required)) : ?CompletionUsagePromptTokensDetails else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CompletionUsagePromptTokensDetails) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.audio_tokens) {
                case (?v__) List.add(buf, ("audio_tokens", #Int(v__)));
                case null ();
            };
            switch (value.cached_tokens) {
                case (?v__) List.add(buf, ("cached_tokens", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CompletionUsagePromptTokensDetails =
            switch (candid) {
                case (#Record(fields)) {
                    let audio_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audio_tokens")) {
                        case (?audio_tokens_field) ((switch (audio_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let cached_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cached_tokens")) {
                        case (?cached_tokens_field) ((switch (cached_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        audio_tokens;
                        cached_tokens;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
