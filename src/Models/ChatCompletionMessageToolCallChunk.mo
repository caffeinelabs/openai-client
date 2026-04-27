
import { type ChatCompletionMessageToolCallChunkFunction; JSON = ChatCompletionMessageToolCallChunkFunction } "./ChatCompletionMessageToolCallChunkFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

// ChatCompletionMessageToolCallChunk.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionMessageToolCallChunk = {
        index : Int;
        /// The ID of the tool call.
        id : ?Text;
        type_ : ?ChatCompletionMessageToolCallType;
        function : ?ChatCompletionMessageToolCallChunkFunction;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionMessageToolCallChunk type
        public type JSON = {
            index : Int;
            id : ?Text;
            type_ : ?ChatCompletionMessageToolCallType.JSON;
            function : ?ChatCompletionMessageToolCallChunkFunction;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionMessageToolCallChunk) : JSON = { value with
            type_ = do ? { ChatCompletionMessageToolCallType.toJSON(value.type_!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionMessageToolCallChunk {
            ?{ json with
                type_ = do ? { ChatCompletionMessageToolCallType.fromJSON(json.type_!)! };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionMessageToolCallChunk) : ?Text = null;
    }
}
