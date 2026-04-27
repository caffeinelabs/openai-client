/// Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint). 

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateCompletionResponseChoicesInner; JSON = CreateCompletionResponseChoicesInner } "./CreateCompletionResponseChoicesInner";

import { type CreateCompletionResponseObject; JSON = CreateCompletionResponseObject } "./CreateCompletionResponseObject";

// CreateCompletionResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateCompletionResponse = {
        /// A unique identifier for the completion.
        id : Text;
        /// The list of completion choices the model generated for the input prompt.
        choices : [CreateCompletionResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the completion was created.
        created : Int;
        /// The model used for completion.
        model : Text;
        /// This fingerprint represents the backend configuration that the model runs with.  Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism. 
        system_fingerprint : ?Text;
        object_ : CreateCompletionResponseObject;
        usage : ?CompletionUsage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionResponse type
        public type JSON = {
            id : Text;
            choices : [CreateCompletionResponseChoicesInner];
            created : Int;
            model : Text;
            system_fingerprint : ?Text;
            object_ : CreateCompletionResponseObject.JSON;
            usage : ?CompletionUsage;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionResponse) : JSON = { value with
            object_ = CreateCompletionResponseObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionResponse {
            let ?object_ = CreateCompletionResponseObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateCompletionResponse) : ?Text = null;
    }
}
