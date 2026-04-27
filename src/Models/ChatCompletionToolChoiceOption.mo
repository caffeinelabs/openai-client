/// Controls which (if any) tool is called by the model. `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools. Specifying a particular tool via `{\"type\": \"function\", \"function\": {\"name\": \"my_function\"}}` forces the model to call that tool.  `none` is the default when no tools are present. `auto` is the default if tools are present. 

import { type AssistantsNamedToolChoiceFunction; JSON = AssistantsNamedToolChoiceFunction } "./AssistantsNamedToolChoiceFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

import { type ChatCompletionNamedToolChoice; JSON = ChatCompletionNamedToolChoice } "./ChatCompletionNamedToolChoice";

import { type ChatCompletionToolChoiceOptionOneOf; JSON = ChatCompletionToolChoiceOptionOneOf } "./ChatCompletionToolChoiceOptionOneOf";

// ChatCompletionToolChoiceOption.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionToolChoiceOption = {
        #ChatCompletionToolChoiceOptionOneOf : ChatCompletionToolChoiceOptionOneOf;
        #ChatCompletionNamedToolChoice : ChatCompletionNamedToolChoice;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionToolChoiceOption) : Text =
            switch (value) {
                case (#ChatCompletionToolChoiceOptionOneOf(v)) ChatCompletionToolChoiceOptionOneOf.toJSON(v);
                case (#ChatCompletionNamedToolChoice(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionToolChoiceOption type
        public type JSON = {
            #ChatCompletionToolChoiceOptionOneOf : ChatCompletionToolChoiceOptionOneOf;
            #ChatCompletionNamedToolChoice : ChatCompletionNamedToolChoice;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionToolChoiceOption) : JSON =
            switch (value) {
                case (#ChatCompletionToolChoiceOptionOneOf(v)) #ChatCompletionToolChoiceOptionOneOf(v);
                case (#ChatCompletionNamedToolChoice(v)) #ChatCompletionNamedToolChoice(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionToolChoiceOption =
            switch (json) {
                case (#ChatCompletionToolChoiceOptionOneOf(v)) ?#ChatCompletionToolChoiceOptionOneOf(v);
                case (#ChatCompletionNamedToolChoice(v)) ?#ChatCompletionNamedToolChoice(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : ChatCompletionToolChoiceOption) : ?Text = null;
    }
}
