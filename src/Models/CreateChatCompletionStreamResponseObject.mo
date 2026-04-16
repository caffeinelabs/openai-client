/// The object type, which is always `chat.completion.chunk`.

// CreateChatCompletionStreamResponseObject.mo
/// Enum values: #chat_completion_chunk

module {
    // User-facing type: type-safe variants for application code
    public type CreateChatCompletionStreamResponseObject = {
        #chat_completion_chunk;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionStreamResponseObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionStreamResponseObject) : JSON =
            switch (value) {
                case (#chat_completion_chunk) "chat.completion.chunk";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionStreamResponseObject =
            switch (json) {
                case "chat.completion.chunk" ?#chat_completion_chunk;
                case _ null;
            };
    }
}
