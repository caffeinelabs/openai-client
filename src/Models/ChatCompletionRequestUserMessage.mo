/// Messages sent by an end user, containing prompts or additional context information. 

import { type ChatCompletionRequestUserMessageContent; JSON = ChatCompletionRequestUserMessageContent } "./ChatCompletionRequestUserMessageContent";

import { type ChatCompletionRequestUserMessageRole; JSON = ChatCompletionRequestUserMessageRole } "./ChatCompletionRequestUserMessageRole";

// ChatCompletionRequestUserMessage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestUserMessage = {
        content : ChatCompletionRequestUserMessageContent;
        role : ChatCompletionRequestUserMessageRole;
        /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestUserMessage type
        public type JSON = {
            content : ChatCompletionRequestUserMessageContent;
            role : ChatCompletionRequestUserMessageRole.JSON;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestUserMessage) : JSON = { value with
            role = ChatCompletionRequestUserMessageRole.toJSON(value.role);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestUserMessage {
            let ?role = ChatCompletionRequestUserMessageRole.fromJSON(json.role) else return null;
            ?{ json with
                role;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestUserMessage) : ?Text = null;
    }
}
