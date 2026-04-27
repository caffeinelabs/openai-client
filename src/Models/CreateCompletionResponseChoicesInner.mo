
import { type CreateCompletionResponseChoicesInnerFinishReason; JSON = CreateCompletionResponseChoicesInnerFinishReason } "./CreateCompletionResponseChoicesInnerFinishReason";

import { type CreateCompletionResponseChoicesInnerLogprobs; JSON = CreateCompletionResponseChoicesInnerLogprobs } "./CreateCompletionResponseChoicesInnerLogprobs";

// CreateCompletionResponseChoicesInner.mo

module {
    // User-facing type: what application code uses
    public type CreateCompletionResponseChoicesInner = {
        finish_reason : CreateCompletionResponseChoicesInnerFinishReason;
        index : Int;
        logprobs : CreateCompletionResponseChoicesInnerLogprobs;
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionResponseChoicesInner type
        public type JSON = {
            finish_reason : CreateCompletionResponseChoicesInnerFinishReason.JSON;
            index : Int;
            logprobs : CreateCompletionResponseChoicesInnerLogprobs;
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionResponseChoicesInner) : JSON = { value with
            finish_reason = CreateCompletionResponseChoicesInnerFinishReason.toJSON(value.finish_reason);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionResponseChoicesInner {
            let ?finish_reason = CreateCompletionResponseChoicesInnerFinishReason.fromJSON(json.finish_reason) else return null;
            ?{ json with
                finish_reason;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateCompletionResponseChoicesInner) : ?Text = null;
    }
}
