
import { type ChatCompletionResponseMessage; JSON = ChatCompletionResponseMessage } "./ChatCompletionResponseMessage";

import { type CreateChatCompletionResponseChoicesInnerFinishReason; JSON = CreateChatCompletionResponseChoicesInnerFinishReason } "./CreateChatCompletionResponseChoicesInnerFinishReason";

import { type CreateChatCompletionResponseChoicesInnerLogprobs; JSON = CreateChatCompletionResponseChoicesInnerLogprobs } "./CreateChatCompletionResponseChoicesInnerLogprobs";

// CreateChatCompletionResponseChoicesInner.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionResponseChoicesInner = {
        finish_reason : CreateChatCompletionResponseChoicesInnerFinishReason;
        /// The index of the choice in the list of choices.
        index : Int;
        message : ChatCompletionResponseMessage;
        logprobs : CreateChatCompletionResponseChoicesInnerLogprobs;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionResponseChoicesInner type
        public type JSON = {
            finish_reason : CreateChatCompletionResponseChoicesInnerFinishReason.JSON;
            index : Int;
            message : ChatCompletionResponseMessage.JSON;
            logprobs : CreateChatCompletionResponseChoicesInnerLogprobs;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionResponseChoicesInner) : JSON = { value with
            finish_reason = CreateChatCompletionResponseChoicesInnerFinishReason.toJSON(value.finish_reason);
            message = ChatCompletionResponseMessage.toJSON(value.message);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionResponseChoicesInner {
            let ?finish_reason = CreateChatCompletionResponseChoicesInnerFinishReason.fromJSON(json.finish_reason) else return null;
            let ?message = ChatCompletionResponseMessage.fromJSON(json.message) else return null;
            ?{ json with
                finish_reason;
                message;
            }
        };
    }
}
