/// The input tokens detailed information for the image generation.

// ImagesResponseUsageInputTokensDetails.mo

module {
    // User-facing type: what application code uses
    public type ImagesResponseUsageInputTokensDetails = {
        /// The number of text tokens in the input prompt.
        text_tokens : Int;
        /// The number of image tokens in the input prompt.
        image_tokens : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ImagesResponseUsageInputTokensDetails type
        public type JSON = {
            text_tokens : Int;
            image_tokens : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ImagesResponseUsageInputTokensDetails) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ImagesResponseUsageInputTokensDetails = ?json;
    }
}
