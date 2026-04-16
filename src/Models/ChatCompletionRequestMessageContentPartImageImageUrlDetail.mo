/// Specifies the detail level of the image. Learn more in the [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).

// ChatCompletionRequestMessageContentPartImageImageUrlDetail.mo
/// Enum values: #auto, #low, #high

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartImageImageUrlDetail = {
        #auto;
        #low;
        #high;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartImageImageUrlDetail type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartImageImageUrlDetail) : JSON =
            switch (value) {
                case (#auto) "auto";
                case (#low) "low";
                case (#high) "high";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail =
            switch (json) {
                case "auto" ?#auto;
                case "low" ?#low;
                case "high" ?#high;
                case _ null;
            };
    }
}
