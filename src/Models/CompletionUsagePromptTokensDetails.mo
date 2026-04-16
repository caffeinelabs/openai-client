/// Breakdown of tokens used in the prompt.

// CompletionUsagePromptTokensDetails.mo

module {
    // User-facing type: what application code uses
    public type CompletionUsagePromptTokensDetails = {
        /// Audio input tokens present in the prompt.
        audio_tokens : ?Int;
        /// Cached tokens present in the prompt.
        cached_tokens : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CompletionUsagePromptTokensDetails type
        public type JSON = {
            audio_tokens : ?Int;
            cached_tokens : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CompletionUsagePromptTokensDetails) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CompletionUsagePromptTokensDetails = ?json;
    }
}
