/// Usage statistics for the completion request.

import { type CompletionUsageCompletionTokensDetails; JSON = CompletionUsageCompletionTokensDetails } "./CompletionUsageCompletionTokensDetails";

import { type CompletionUsagePromptTokensDetails; JSON = CompletionUsagePromptTokensDetails } "./CompletionUsagePromptTokensDetails";

// CompletionUsage.mo

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CompletionUsage type
        public type JSON = {
            completion_tokens : Int;
            prompt_tokens : Int;
            total_tokens : Int;
            completion_tokens_details : ?CompletionUsageCompletionTokensDetails;
            prompt_tokens_details : ?CompletionUsagePromptTokensDetails;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CompletionUsage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CompletionUsage = ?json;
    }
}
