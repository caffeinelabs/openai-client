
import { type ChatCompletionDeletedObject; JSON = ChatCompletionDeletedObject } "./ChatCompletionDeletedObject";

// ChatCompletionDeleted.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionDeleted = {
        object_ : ChatCompletionDeletedObject;
        /// The ID of the chat completion that was deleted.
        id : Text;
        /// Whether the chat completion was deleted.
        deleted : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionDeleted type
        public type JSON = {
            object_ : ChatCompletionDeletedObject.JSON;
            id : Text;
            deleted : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionDeleted) : JSON = { value with
            object_ = ChatCompletionDeletedObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionDeleted {
            let ?object_ = ChatCompletionDeletedObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };
    }
}
