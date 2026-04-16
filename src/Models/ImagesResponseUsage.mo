/// For `gpt-image-1` only, the token usage information for the image generation. 

import { type ImagesResponseUsageInputTokensDetails; JSON = ImagesResponseUsageInputTokensDetails } "./ImagesResponseUsageInputTokensDetails";

// ImagesResponseUsage.mo

module {
    // User-facing type: what application code uses
    public type ImagesResponseUsage = {
        /// The total number of tokens (images and text) used for the image generation.
        total_tokens : Int;
        /// The number of tokens (images and text) in the input prompt.
        input_tokens : Int;
        /// The number of image tokens in the output image.
        output_tokens : Int;
        input_tokens_details : ImagesResponseUsageInputTokensDetails;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ImagesResponseUsage type
        public type JSON = {
            total_tokens : Int;
            input_tokens : Int;
            output_tokens : Int;
            input_tokens_details : ImagesResponseUsageInputTokensDetails;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ImagesResponseUsage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ImagesResponseUsage = ?json;
    }
}
