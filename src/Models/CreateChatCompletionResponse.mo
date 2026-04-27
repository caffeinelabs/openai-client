/// Represents a chat completion response returned by model, based on the provided input.

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateChatCompletionResponseChoicesInner; JSON = CreateChatCompletionResponseChoicesInner } "./CreateChatCompletionResponseChoicesInner";

import { type CreateChatCompletionResponseObject; JSON = CreateChatCompletionResponseObject } "./CreateChatCompletionResponseObject";

import { type ServiceTier; JSON = ServiceTier } "./ServiceTier";

// CreateChatCompletionResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionResponse = {
        /// A unique identifier for the chat completion.
        id : Text;
        /// A list of chat completion choices. Can be more than one if `n` is greater than 1.
        choices : [CreateChatCompletionResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the chat completion was created.
        created : Int;
        /// The model used for the chat completion.
        model : Text;
        service_tier : ?ServiceTier;
        /// This fingerprint represents the backend configuration that the model runs with.  Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism. 
        system_fingerprint : ?Text;
        object_ : CreateChatCompletionResponseObject;
        usage : ?CompletionUsage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionResponse type
        public type JSON = {
            id : Text;
            choices : [CreateChatCompletionResponseChoicesInner];
            created : Int;
            model : Text;
            service_tier : ?ServiceTier.JSON;
            system_fingerprint : ?Text;
            object_ : CreateChatCompletionResponseObject.JSON;
            usage : ?CompletionUsage;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionResponse) : JSON = { value with
            service_tier = do ? { ServiceTier.toJSON(value.service_tier!) };
            object_ = CreateChatCompletionResponseObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionResponse {
            let ?object_ = CreateChatCompletionResponseObject.fromJSON(json.object_) else return null;
            ?{ json with
                service_tier = do ? { ServiceTier.fromJSON(json.service_tier!)! };
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateChatCompletionResponse) : ?Text = null;
    }
}
