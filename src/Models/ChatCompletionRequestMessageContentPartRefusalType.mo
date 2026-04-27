/// The type of the content part.

// ChatCompletionRequestMessageContentPartRefusalType.mo
/// Enum values: #refusal

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartRefusalType = {
        #refusal;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartRefusalType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartRefusalType) : JSON =
            switch (value) {
                case (#refusal) "refusal";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartRefusalType =
            switch (json) {
                case "refusal" ?#refusal;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestMessageContentPartRefusalType) : ?Text = null;
    }
}
