/// A URL citation when using web search. 

import { type ChatCompletionResponseMessageAnnotationsInnerType; JSON = ChatCompletionResponseMessageAnnotationsInnerType } "./ChatCompletionResponseMessageAnnotationsInnerType";

import { type ChatCompletionResponseMessageAnnotationsInnerUrlCitation; JSON = ChatCompletionResponseMessageAnnotationsInnerUrlCitation } "./ChatCompletionResponseMessageAnnotationsInnerUrlCitation";

// ChatCompletionResponseMessageAnnotationsInner.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionResponseMessageAnnotationsInner = {
        type_ : ChatCompletionResponseMessageAnnotationsInnerType;
        url_citation : ChatCompletionResponseMessageAnnotationsInnerUrlCitation;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionResponseMessageAnnotationsInner type
        public type JSON = {
            type_ : ChatCompletionResponseMessageAnnotationsInnerType.JSON;
            url_citation : ChatCompletionResponseMessageAnnotationsInnerUrlCitation;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionResponseMessageAnnotationsInner) : JSON = { value with
            type_ = ChatCompletionResponseMessageAnnotationsInnerType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionResponseMessageAnnotationsInner {
            let ?type_ = ChatCompletionResponseMessageAnnotationsInnerType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionResponseMessageAnnotationsInner) : ?Text = null;
    }
}
