/// Learn about [text inputs](/docs/guides/text-generation). 

import { type ChatCompletionRequestMessageContentPartTextType; JSON = ChatCompletionRequestMessageContentPartTextType } "./ChatCompletionRequestMessageContentPartTextType";

// ChatCompletionRequestMessageContentPartText.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartText = {
        type_ : ChatCompletionRequestMessageContentPartTextType;
        /// The text content.
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartText type
        public type JSON = {
            type_ : ChatCompletionRequestMessageContentPartTextType.JSON;
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartText) : JSON = { value with
            type_ = ChatCompletionRequestMessageContentPartTextType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartText {
            let ?type_ = ChatCompletionRequestMessageContentPartTextType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestMessageContentPartText) : ?Text = null;
    }
}
