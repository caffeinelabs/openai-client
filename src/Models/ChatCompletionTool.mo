
import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

import { type FunctionObject; JSON = FunctionObject } "./FunctionObject";

// ChatCompletionTool.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionTool = {
        type_ : ChatCompletionMessageToolCallType;
        function : FunctionObject;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionTool type
        public type JSON = {
            type_ : ChatCompletionMessageToolCallType.JSON;
            function : FunctionObject;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionTool) : JSON = { value with
            type_ = ChatCompletionMessageToolCallType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionTool {
            let ?type_ = ChatCompletionMessageToolCallType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionTool) : ?Text = null;
    }
}
