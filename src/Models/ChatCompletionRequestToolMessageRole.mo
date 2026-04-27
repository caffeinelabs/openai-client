/// The role of the messages author, in this case `tool`.

// ChatCompletionRequestToolMessageRole.mo
/// Enum values: #tool

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestToolMessageRole = {
        #tool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestToolMessageRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestToolMessageRole) : JSON =
            switch (value) {
                case (#tool) "tool";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestToolMessageRole =
            switch (json) {
                case "tool" ?#tool;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestToolMessageRole) : ?Text = null;
    }
}
