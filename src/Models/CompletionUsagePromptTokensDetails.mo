/// Breakdown of tokens used in the prompt.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CompletionUsagePromptTokensDetails.mo

module {
    public type CompletionUsagePromptTokensDetails = {
        /// Audio input tokens present in the prompt.
        audio_tokens : ?Int;
        /// Cached tokens present in the prompt.
        cached_tokens : ?Int;
    };

    public module JSON {
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
};
