/// The type of the tool. Currently, only `function` is supported.

// ChatCompletionMessageToolCallType.mo
/// Enum values: #function

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionMessageToolCallType = {
        #function;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionMessageToolCallType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionMessageToolCallType) : JSON =
            switch (value) {
                case (#function) "function";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionMessageToolCallType =
            switch (json) {
                case "function" ?#function;
                case _ null;
            };
    }
}
