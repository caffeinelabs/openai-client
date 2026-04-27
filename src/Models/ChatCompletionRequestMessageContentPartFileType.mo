/// The type of the content part. Always `file`.

// ChatCompletionRequestMessageContentPartFileType.mo
/// Enum values: #file

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartFileType = {
        #file;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartFileType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartFileType) : JSON =
            switch (value) {
                case (#file) "file";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartFileType =
            switch (json) {
                case "file" ?#file;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestMessageContentPartFileType) : ?Text = null;
    }
}
