/// Usage statistics for the completion request.

import { type CompletionUsageCompletionTokensDetails; JSON = CompletionUsageCompletionTokensDetails } "./CompletionUsageCompletionTokensDetails";

import { type CompletionUsagePromptTokensDetails; JSON = CompletionUsagePromptTokensDetails } "./CompletionUsagePromptTokensDetails";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CompletionUsage.mo

module {
    public type CompletionUsage = {
        /// Number of tokens in the generated completion.
        completion_tokens : Int;
        /// Number of tokens in the prompt.
        prompt_tokens : Int;
        /// Total number of tokens used in the request (prompt + completion).
        total_tokens : Int;
        completion_tokens_details : ?CompletionUsageCompletionTokensDetails;
        prompt_tokens_details : ?CompletionUsagePromptTokensDetails;
    };

    public module JSON {
        public func toCandidValue(value : CompletionUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("completion_tokens", #Int(value.completion_tokens)));
            List.add(buf, ("prompt_tokens", #Int(value.prompt_tokens)));
            List.add(buf, ("total_tokens", #Int(value.total_tokens)));
            switch (value.completion_tokens_details) {
                case (?v__) List.add(buf, ("completion_tokens_details", CompletionUsageCompletionTokensDetails.toCandidValue(v__)));
                case null ();
            };
            switch (value.prompt_tokens_details) {
                case (?v__) List.add(buf, ("prompt_tokens_details", CompletionUsagePromptTokensDetails.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CompletionUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?completion_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "completion_tokens") else return null;
                    let ?completion_tokens = ((switch (completion_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?prompt_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prompt_tokens") else return null;
                    let ?prompt_tokens = ((switch (prompt_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?total_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_tokens") else return null;
                    let ?total_tokens = ((switch (total_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let completion_tokens_details : ?CompletionUsageCompletionTokensDetails = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "completion_tokens_details")) {
                        case (?completion_tokens_details_field) (CompletionUsageCompletionTokensDetails.fromCandidValue(completion_tokens_details_field.1));
                        case null null;
                    };
                    let prompt_tokens_details : ?CompletionUsagePromptTokensDetails = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prompt_tokens_details")) {
                        case (?prompt_tokens_details_field) (CompletionUsagePromptTokensDetails.fromCandidValue(prompt_tokens_details_field.1));
                        case null null;
                    };
                    ?{
                        completion_tokens;
                        prompt_tokens;
                        total_tokens;
                        completion_tokens_details;
                        prompt_tokens_details;
                    };
                };
                case _ null;
            };
    };
};
