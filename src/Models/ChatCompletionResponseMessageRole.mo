/// The role of the author of this message.

// ChatCompletionResponseMessageRole.mo
/// Enum values: #assistant

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionResponseMessageRole = {
        #assistant;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionResponseMessageRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionResponseMessageRole) : JSON =
            switch (value) {
                case (#assistant) "assistant";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionResponseMessageRole =
            switch (json) {
                case "assistant" ?#assistant;
                case _ null;
            };
    }
}
