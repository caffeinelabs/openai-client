/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, `developer` messages replace the previous `system` messages. 

import { type ChatCompletionRequestDeveloperMessageContent; JSON = ChatCompletionRequestDeveloperMessageContent } "./ChatCompletionRequestDeveloperMessageContent";

import { type ChatCompletionRequestDeveloperMessageRole; JSON = ChatCompletionRequestDeveloperMessageRole } "./ChatCompletionRequestDeveloperMessageRole";

// ChatCompletionRequestDeveloperMessage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestDeveloperMessage = {
        content : ChatCompletionRequestDeveloperMessageContent;
        role : ChatCompletionRequestDeveloperMessageRole;
        /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestDeveloperMessage type
        public type JSON = {
            content : ChatCompletionRequestDeveloperMessageContent;
            role : ChatCompletionRequestDeveloperMessageRole.JSON;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestDeveloperMessage) : JSON = { value with
            role = ChatCompletionRequestDeveloperMessageRole.toJSON(value.role);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestDeveloperMessage {
            let ?role = ChatCompletionRequestDeveloperMessageRole.fromJSON(json.role) else return null;
            ?{ json with
                role;
            }
        };
    }
}
