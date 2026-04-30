
import { type CreateCompletionResponseChoicesInnerFinishReason; JSON = CreateCompletionResponseChoicesInnerFinishReason } "./CreateCompletionResponseChoicesInnerFinishReason";

import { type CreateCompletionResponseChoicesInnerLogprobs; JSON = CreateCompletionResponseChoicesInnerLogprobs } "./CreateCompletionResponseChoicesInnerLogprobs";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateCompletionResponseChoicesInner.mo

module {
    /// The required-fields slice of CreateCompletionResponseChoicesInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        finish_reason : CreateCompletionResponseChoicesInnerFinishReason;
        index : Int;
        text_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateCompletionResponseChoicesInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        logprobs : ?CreateCompletionResponseChoicesInnerLogprobs;
    };

    public type CreateCompletionResponseChoicesInner = Required and Optional;

    public module JSON {
        // `init` constructs a CreateCompletionResponseChoicesInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateCompletionResponseChoicesInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateCompletionResponseChoicesInner {
            let ?res = from_candid(to_candid(required)) : ?CreateCompletionResponseChoicesInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateCompletionResponseChoicesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("finish_reason", CreateCompletionResponseChoicesInnerFinishReason.toCandidValue(value.finish_reason)));
            List.add(buf, ("index", #Int(value.index)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", CreateCompletionResponseChoicesInnerLogprobs.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseChoicesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?finish_reason_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finish_reason") else return null;
                    let ?finish_reason = (CreateCompletionResponseChoicesInnerFinishReason.fromCandidValue(finish_reason_field.1)) else return null;
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let logprobs : ?CreateCompletionResponseChoicesInnerLogprobs = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) (CreateCompletionResponseChoicesInnerLogprobs.fromCandidValue(logprobs_field.1));
                        case null null;
                    };
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        finish_reason;
                        index;
                        logprobs;
                        text_;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
