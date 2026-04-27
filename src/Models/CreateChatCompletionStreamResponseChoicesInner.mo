
import { type ChatCompletionStreamResponseDelta; JSON = ChatCompletionStreamResponseDelta } "./ChatCompletionStreamResponseDelta";

import { type CreateChatCompletionResponseChoicesInnerLogprobs; JSON = CreateChatCompletionResponseChoicesInnerLogprobs } "./CreateChatCompletionResponseChoicesInnerLogprobs";

import { type CreateChatCompletionStreamResponseChoicesInnerFinishReason; JSON = CreateChatCompletionStreamResponseChoicesInnerFinishReason } "./CreateChatCompletionStreamResponseChoicesInnerFinishReason";

// CreateChatCompletionStreamResponseChoicesInner.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionStreamResponseChoicesInner = {
        delta : ChatCompletionStreamResponseDelta;
        logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs;
        finish_reason : CreateChatCompletionStreamResponseChoicesInnerFinishReason;
        /// The index of the choice in the list of choices.
        index : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionStreamResponseChoicesInner type
        public type JSON = {
            delta : ChatCompletionStreamResponseDelta.JSON;
            logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs;
            finish_reason : CreateChatCompletionStreamResponseChoicesInnerFinishReason.JSON;
            index : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionStreamResponseChoicesInner) : JSON = { value with
            delta = ChatCompletionStreamResponseDelta.toJSON(value.delta);
            finish_reason = CreateChatCompletionStreamResponseChoicesInnerFinishReason.toJSON(value.finish_reason);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionStreamResponseChoicesInner {
            let ?delta = ChatCompletionStreamResponseDelta.fromJSON(json.delta) else return null;
            let ?finish_reason = CreateChatCompletionStreamResponseChoicesInnerFinishReason.fromJSON(json.finish_reason) else return null;
            ?{ json with
                delta;
                finish_reason;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateChatCompletionStreamResponseChoicesInner) : ?Text = null;
    }
}
