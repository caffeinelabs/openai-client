/// The usage information for the request.

// CreateEmbeddingResponseUsage.mo

module {
    // User-facing type: what application code uses
    public type CreateEmbeddingResponseUsage = {
        /// The number of tokens used by the prompt.
        prompt_tokens : Int;
        /// The total number of tokens used by the request.
        total_tokens : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingResponseUsage type
        public type JSON = {
            prompt_tokens : Int;
            total_tokens : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingResponseUsage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingResponseUsage = ?json;
    }
}
