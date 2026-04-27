/// The contents of the assistant message. Required unless `tool_calls` or `function_call` is specified. 

import { type ChatCompletionRequestAssistantMessageContentPart; JSON = ChatCompletionRequestAssistantMessageContentPart } "./ChatCompletionRequestAssistantMessageContentPart";

// ChatCompletionRequestAssistantMessageContent.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestAssistantMessageContent = {
        #one_of_0 : Text;
        #ChatCompletionRequestAssistantMessageContentPart : [ChatCompletionRequestAssistantMessageContentPart];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestAssistantMessageContent) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#ChatCompletionRequestAssistantMessageContentPart(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestAssistantMessageContent type
        public type JSON = {
            #one_of_0 : Text;
            #ChatCompletionRequestAssistantMessageContentPart : [ChatCompletionRequestAssistantMessageContentPart];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestAssistantMessageContent) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#ChatCompletionRequestAssistantMessageContentPart(v)) #ChatCompletionRequestAssistantMessageContentPart(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestAssistantMessageContent =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#ChatCompletionRequestAssistantMessageContentPart(v)) ?#ChatCompletionRequestAssistantMessageContentPart(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : ChatCompletionRequestAssistantMessageContent) : ?Text = null;
    }
}
