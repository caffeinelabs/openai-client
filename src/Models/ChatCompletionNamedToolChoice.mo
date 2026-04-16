/// Specifies a tool the model should use. Use to force the model to call a specific function.

import { type AssistantsNamedToolChoiceFunction; JSON = AssistantsNamedToolChoiceFunction } "./AssistantsNamedToolChoiceFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

// ChatCompletionNamedToolChoice.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionNamedToolChoice = {
        type_ : ChatCompletionMessageToolCallType;
        function : AssistantsNamedToolChoiceFunction;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionNamedToolChoice type
        public type JSON = {
            type_ : ChatCompletionMessageToolCallType.JSON;
            function : AssistantsNamedToolChoiceFunction;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionNamedToolChoice) : JSON = { value with
            type_ = ChatCompletionMessageToolCallType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionNamedToolChoice {
            let ?type_ = ChatCompletionMessageToolCallType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
