/// The object type, which is always `chat.completion`.

// CreateChatCompletionResponseObject.mo
/// Enum values: #chat_completion

module {
    // User-facing type: type-safe variants for application code
    public type CreateChatCompletionResponseObject = {
        #chat_completion;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionResponseObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionResponseObject) : JSON =
            switch (value) {
                case (#chat_completion) "chat.completion";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionResponseObject =
            switch (json) {
                case "chat.completion" ?#chat_completion;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateChatCompletionResponseObject) : ?Text = null;
    }
}
