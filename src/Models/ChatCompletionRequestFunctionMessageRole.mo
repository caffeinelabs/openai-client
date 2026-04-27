/// The role of the messages author, in this case `function`.

// ChatCompletionRequestFunctionMessageRole.mo
/// Enum values: #function

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestFunctionMessageRole = {
        #function;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestFunctionMessageRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestFunctionMessageRole) : JSON =
            switch (value) {
                case (#function) "function";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestFunctionMessageRole =
            switch (json) {
                case "function" ?#function;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestFunctionMessageRole) : ?Text = null;
    }
}
