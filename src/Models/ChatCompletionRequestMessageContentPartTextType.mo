/// The type of the content part.

// ChatCompletionRequestMessageContentPartTextType.mo
/// Enum values: #text_

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartTextType = {
        #text_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartTextType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartTextType) : JSON =
            switch (value) {
                case (#text_) "text";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartTextType =
            switch (json) {
                case "text" ?#text_;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestMessageContentPartTextType) : ?Text = null;
    }
}
