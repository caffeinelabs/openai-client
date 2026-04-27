/// Represents a streamed chunk of a chat completion response returned by the model, based on the provided input.  [Learn more](/docs/guides/streaming-responses). 

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateChatCompletionStreamResponseChoicesInner; JSON = CreateChatCompletionStreamResponseChoicesInner } "./CreateChatCompletionStreamResponseChoicesInner";

import { type CreateChatCompletionStreamResponseObject; JSON = CreateChatCompletionStreamResponseObject } "./CreateChatCompletionStreamResponseObject";

import { type ServiceTier; JSON = ServiceTier } "./ServiceTier";

// CreateChatCompletionStreamResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionStreamResponse = {
        /// A unique identifier for the chat completion. Each chunk has the same ID.
        id : Text;
        /// A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the last chunk if you set `stream_options: {\"include_usage\": true}`. 
        choices : [CreateChatCompletionStreamResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
        created : Int;
        /// The model to generate the completion.
        model : Text;
        service_tier : ?ServiceTier;
        /// This fingerprint represents the backend configuration that the model runs with. Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism. 
        system_fingerprint : ?Text;
        object_ : CreateChatCompletionStreamResponseObject;
        usage : ?CompletionUsage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionStreamResponse type
        public type JSON = {
            id : Text;
            choices : [CreateChatCompletionStreamResponseChoicesInner];
            created : Int;
            model : Text;
            service_tier : ?ServiceTier.JSON;
            system_fingerprint : ?Text;
            object_ : CreateChatCompletionStreamResponseObject.JSON;
            usage : ?CompletionUsage;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionStreamResponse) : JSON = { value with
            service_tier = do ? { ServiceTier.toJSON(value.service_tier!) };
            object_ = CreateChatCompletionStreamResponseObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionStreamResponse {
            let ?object_ = CreateChatCompletionStreamResponseObject.fromJSON(json.object_) else return null;
            ?{ json with
                service_tier = do ? { ServiceTier.fromJSON(json.service_tier!)! };
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateChatCompletionStreamResponse) : ?Text = null;
    }
}
