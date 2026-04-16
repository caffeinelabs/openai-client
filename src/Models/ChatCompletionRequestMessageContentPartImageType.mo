/// The type of the content part.

// ChatCompletionRequestMessageContentPartImageType.mo
/// Enum values: #image_url

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartImageType = {
        #image_url;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartImageType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartImageType) : JSON =
            switch (value) {
                case (#image_url) "image_url";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartImageType =
            switch (json) {
                case "image_url" ?#image_url;
                case _ null;
            };
    }
}
