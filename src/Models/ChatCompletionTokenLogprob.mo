
import { type ChatCompletionTokenLogprobTopLogprobsInner; JSON = ChatCompletionTokenLogprobTopLogprobsInner } "./ChatCompletionTokenLogprobTopLogprobsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionTokenLogprob.mo

module {
    /// The required-fields slice of ChatCompletionTokenLogprob — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
        /// List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
        top_logprobs : [ChatCompletionTokenLogprobTopLogprobsInner];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionTokenLogprob as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        bytes : ?[Int];
    };

    public type ChatCompletionTokenLogprob = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionTokenLogprob from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionTokenLogprob.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionTokenLogprob {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionTokenLogprob else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionTokenLogprob) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("token", #Text(value.token)));
            List.add(buf, ("logprob", #Float(value.logprob)));
            switch (value.bytes) {
                case (?v__) List.add(buf, ("bytes", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            List.add(buf, ("top_logprobs", #Array(Array.map<ChatCompletionTokenLogprobTopLogprobsInner, Candid.Candid>(value.top_logprobs, ChatCompletionTokenLogprobTopLogprobsInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionTokenLogprob =
            switch (candid) {
                case (#Record(fields)) {
                    let ?token_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token") else return null;
                    let ?token = ((switch (token_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?logprob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprob") else return null;
                    let ?logprob = ((switch (logprob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let bytes : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let ?i__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?top_logprobs_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_logprobs") else return null;
                    let ?top_logprobs = ((switch (top_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprobTopLogprobsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprobTopLogprobsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        token;
                        logprob;
                        bytes;
                        top_logprobs;
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
