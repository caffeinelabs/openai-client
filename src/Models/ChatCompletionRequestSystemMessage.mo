/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, use `developer` messages for this purpose instead. 

import { type ChatCompletionRequestSystemMessageContent; JSON = ChatCompletionRequestSystemMessageContent } "./ChatCompletionRequestSystemMessageContent";

import { type ChatCompletionRequestSystemMessageRole; JSON = ChatCompletionRequestSystemMessageRole } "./ChatCompletionRequestSystemMessageRole";

// ChatCompletionRequestSystemMessage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestSystemMessage = {
        content : ChatCompletionRequestSystemMessageContent;
        role : ChatCompletionRequestSystemMessageRole;
        /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestSystemMessage type
        public type JSON = {
            content : ChatCompletionRequestSystemMessageContent;
            role : ChatCompletionRequestSystemMessageRole.JSON;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestSystemMessage) : JSON = { value with
            role = ChatCompletionRequestSystemMessageRole.toJSON(value.role);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestSystemMessage {
            let ?role = ChatCompletionRequestSystemMessageRole.fromJSON(json.role) else return null;
            ?{ json with
                role;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestSystemMessage) : ?Text = null;
    }
}
