
import { type ChatCompletionRequestFunctionMessageRole; JSON = ChatCompletionRequestFunctionMessageRole } "./ChatCompletionRequestFunctionMessageRole";

// ChatCompletionRequestFunctionMessage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestFunctionMessage = {
        role : ChatCompletionRequestFunctionMessageRole;
        /// The contents of the function message.
        content : Text;
        /// The name of the function to call.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestFunctionMessage type
        public type JSON = {
            role : ChatCompletionRequestFunctionMessageRole.JSON;
            content : Text;
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestFunctionMessage) : JSON = { value with
            role = ChatCompletionRequestFunctionMessageRole.toJSON(value.role);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestFunctionMessage {
            let ?role = ChatCompletionRequestFunctionMessageRole.fromJSON(json.role) else return null;
            ?{ json with
                role;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestFunctionMessage) : ?Text = null;
    }
}
