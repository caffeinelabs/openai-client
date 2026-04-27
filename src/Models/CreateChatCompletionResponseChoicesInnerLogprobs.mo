/// Log probability information for the choice.

import { type ChatCompletionTokenLogprob; JSON = ChatCompletionTokenLogprob } "./ChatCompletionTokenLogprob";

// CreateChatCompletionResponseChoicesInnerLogprobs.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionResponseChoicesInnerLogprobs = {
        /// A list of message content tokens with log probability information.
        content : [ChatCompletionTokenLogprob];
        /// A list of message refusal tokens with log probability information.
        refusal : [ChatCompletionTokenLogprob];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionResponseChoicesInnerLogprobs type
        public type JSON = {
            content : [ChatCompletionTokenLogprob];
            refusal : [ChatCompletionTokenLogprob];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionResponseChoicesInnerLogprobs) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionResponseChoicesInnerLogprobs = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateChatCompletionResponseChoicesInnerLogprobs) : ?Text = null;
    }
}
