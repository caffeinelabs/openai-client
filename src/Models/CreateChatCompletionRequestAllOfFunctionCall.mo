/// Deprecated in favor of `tool_choice`.  Controls which (if any) function is called by the model.  `none` means the model will not call a function and instead generates a message.  `auto` means the model can pick between generating a message or calling a function.  Specifying a particular function via `{\"name\": \"my_function\"}` forces the model to call that function.  `none` is the default when no functions are present. `auto` is the default if functions are present. 

import { type ChatCompletionFunctionCallOption; JSON = ChatCompletionFunctionCallOption } "./ChatCompletionFunctionCallOption";

import { type CreateChatCompletionRequestAllOfFunctionCallOneOf; JSON = CreateChatCompletionRequestAllOfFunctionCallOneOf } "./CreateChatCompletionRequestAllOfFunctionCallOneOf";

// CreateChatCompletionRequestAllOfFunctionCall.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateChatCompletionRequestAllOfFunctionCall = {
        #CreateChatCompletionRequestAllOfFunctionCallOneOf : CreateChatCompletionRequestAllOfFunctionCallOneOf;
        #ChatCompletionFunctionCallOption : ChatCompletionFunctionCallOption;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateChatCompletionRequestAllOfFunctionCall) : Text =
            switch (value) {
                case (#CreateChatCompletionRequestAllOfFunctionCallOneOf(v)) CreateChatCompletionRequestAllOfFunctionCallOneOf.toJSON(v);
                case (#ChatCompletionFunctionCallOption(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionRequestAllOfFunctionCall type
        public type JSON = {
            #CreateChatCompletionRequestAllOfFunctionCallOneOf : CreateChatCompletionRequestAllOfFunctionCallOneOf;
            #ChatCompletionFunctionCallOption : ChatCompletionFunctionCallOption;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionRequestAllOfFunctionCall) : JSON =
            switch (value) {
                case (#CreateChatCompletionRequestAllOfFunctionCallOneOf(v)) #CreateChatCompletionRequestAllOfFunctionCallOneOf(v);
                case (#ChatCompletionFunctionCallOption(v)) #ChatCompletionFunctionCallOption(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionRequestAllOfFunctionCall =
            switch (json) {
                case (#CreateChatCompletionRequestAllOfFunctionCallOneOf(v)) ?#CreateChatCompletionRequestAllOfFunctionCallOneOf(v);
                case (#ChatCompletionFunctionCallOption(v)) ?#ChatCompletionFunctionCallOption(v);
            };
    }
}
