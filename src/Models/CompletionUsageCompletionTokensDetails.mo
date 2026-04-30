/// Breakdown of tokens used in a completion.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CompletionUsageCompletionTokensDetails.mo

module {
    /// The required-fields slice of CompletionUsageCompletionTokensDetails — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CompletionUsageCompletionTokensDetails as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        accepted_prediction_tokens : ?Int;
        audio_tokens : ?Int;
        reasoning_tokens : ?Int;
        rejected_prediction_tokens : ?Int;
    };

    public type CompletionUsageCompletionTokensDetails = Required and Optional;

    public module JSON {
        // `init` constructs a CompletionUsageCompletionTokensDetails from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CompletionUsageCompletionTokensDetails.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CompletionUsageCompletionTokensDetails {
            let ?res = from_candid(to_candid(required)) : ?CompletionUsageCompletionTokensDetails else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CompletionUsageCompletionTokensDetails) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.accepted_prediction_tokens) {
                case (?v__) List.add(buf, ("accepted_prediction_tokens", #Int(v__)));
                case null ();
            };
            switch (value.audio_tokens) {
                case (?v__) List.add(buf, ("audio_tokens", #Int(v__)));
                case null ();
            };
            switch (value.reasoning_tokens) {
                case (?v__) List.add(buf, ("reasoning_tokens", #Int(v__)));
                case null ();
            };
            switch (value.rejected_prediction_tokens) {
                case (?v__) List.add(buf, ("rejected_prediction_tokens", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CompletionUsageCompletionTokensDetails =
            switch (candid) {
                case (#Record(fields)) {
                    let accepted_prediction_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "accepted_prediction_tokens")) {
                        case (?accepted_prediction_tokens_field) ((switch (accepted_prediction_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let audio_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audio_tokens")) {
                        case (?audio_tokens_field) ((switch (audio_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let reasoning_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reasoning_tokens")) {
                        case (?reasoning_tokens_field) ((switch (reasoning_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let rejected_prediction_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "rejected_prediction_tokens")) {
                        case (?rejected_prediction_tokens_field) ((switch (rejected_prediction_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        accepted_prediction_tokens;
                        audio_tokens;
                        reasoning_tokens;
                        rejected_prediction_tokens;
                    };
                };
                case _ null;
            };
    };
};
