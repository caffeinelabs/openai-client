
import { type ChatCompletionRequestToolMessageContent; JSON = ChatCompletionRequestToolMessageContent } "./ChatCompletionRequestToolMessageContent";

import { type ChatCompletionRequestToolMessageRole; JSON = ChatCompletionRequestToolMessageRole } "./ChatCompletionRequestToolMessageRole";

// ChatCompletionRequestToolMessage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestToolMessage = {
        role : ChatCompletionRequestToolMessageRole;
        content : ChatCompletionRequestToolMessageContent;
        /// Tool call that this message is responding to.
        tool_call_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestToolMessage type
        public type JSON = {
            role : ChatCompletionRequestToolMessageRole.JSON;
            content : ChatCompletionRequestToolMessageContent;
            tool_call_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestToolMessage) : JSON = { value with
            role = ChatCompletionRequestToolMessageRole.toJSON(value.role);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestToolMessage {
            let ?role = ChatCompletionRequestToolMessageRole.fromJSON(json.role) else return null;
            ?{ json with
                role;
            }
        };
    }
}
