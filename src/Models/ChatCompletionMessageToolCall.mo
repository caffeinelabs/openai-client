
import { type ChatCompletionMessageToolCallFunction; JSON = ChatCompletionMessageToolCallFunction } "./ChatCompletionMessageToolCallFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

// ChatCompletionMessageToolCall.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionMessageToolCall = {
        /// The ID of the tool call.
        id : Text;
        type_ : ChatCompletionMessageToolCallType;
        function : ChatCompletionMessageToolCallFunction;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionMessageToolCall type
        public type JSON = {
            id : Text;
            type_ : ChatCompletionMessageToolCallType.JSON;
            function : ChatCompletionMessageToolCallFunction;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionMessageToolCall) : JSON = { value with
            type_ = ChatCompletionMessageToolCallType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionMessageToolCall {
            let ?type_ = ChatCompletionMessageToolCallType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionMessageToolCall) : ?Text = null;
    }
}
