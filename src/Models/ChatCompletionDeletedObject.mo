/// The type of object being deleted.

// ChatCompletionDeletedObject.mo
/// Enum values: #chat_completion_deleted

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionDeletedObject = {
        #chat_completion_deleted;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionDeletedObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionDeletedObject) : JSON =
            switch (value) {
                case (#chat_completion_deleted) "chat.completion.deleted";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionDeletedObject =
            switch (json) {
                case "chat.completion.deleted" ?#chat_completion_deleted;
                case _ null;
            };
    }
}
