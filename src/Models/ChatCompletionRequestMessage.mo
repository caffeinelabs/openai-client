
import { type ChatCompletionMessageToolCall; JSON = ChatCompletionMessageToolCall } "./ChatCompletionMessageToolCall";

import { type ChatCompletionRequestAssistantMessage; JSON = ChatCompletionRequestAssistantMessage } "./ChatCompletionRequestAssistantMessage";

import { type ChatCompletionRequestAssistantMessageAudio; JSON = ChatCompletionRequestAssistantMessageAudio } "./ChatCompletionRequestAssistantMessageAudio";

import { type ChatCompletionRequestAssistantMessageFunctionCall; JSON = ChatCompletionRequestAssistantMessageFunctionCall } "./ChatCompletionRequestAssistantMessageFunctionCall";

import { type ChatCompletionRequestDeveloperMessage; JSON = ChatCompletionRequestDeveloperMessage } "./ChatCompletionRequestDeveloperMessage";

import { type ChatCompletionRequestFunctionMessage; JSON = ChatCompletionRequestFunctionMessage } "./ChatCompletionRequestFunctionMessage";

import { type ChatCompletionRequestFunctionMessageRole; JSON = ChatCompletionRequestFunctionMessageRole } "./ChatCompletionRequestFunctionMessageRole";

import { type ChatCompletionRequestSystemMessage; JSON = ChatCompletionRequestSystemMessage } "./ChatCompletionRequestSystemMessage";

import { type ChatCompletionRequestToolMessage; JSON = ChatCompletionRequestToolMessage } "./ChatCompletionRequestToolMessage";

import { type ChatCompletionRequestUserMessage; JSON = ChatCompletionRequestUserMessage } "./ChatCompletionRequestUserMessage";

// ChatCompletionRequestMessage.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestMessage = {
        #ChatCompletionRequestDeveloperMessage : ChatCompletionRequestDeveloperMessage;
        #ChatCompletionRequestSystemMessage : ChatCompletionRequestSystemMessage;
        #ChatCompletionRequestUserMessage : ChatCompletionRequestUserMessage;
        #ChatCompletionRequestAssistantMessage : ChatCompletionRequestAssistantMessage;
        #ChatCompletionRequestToolMessage : ChatCompletionRequestToolMessage;
        #ChatCompletionRequestFunctionMessage : ChatCompletionRequestFunctionMessage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestMessage) : Text =
            switch (value) {
                case (#ChatCompletionRequestDeveloperMessage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestSystemMessage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestUserMessage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestAssistantMessage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestToolMessage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestFunctionMessage(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessage type
        public type JSON = {
            #ChatCompletionRequestDeveloperMessage : ChatCompletionRequestDeveloperMessage;
            #ChatCompletionRequestSystemMessage : ChatCompletionRequestSystemMessage;
            #ChatCompletionRequestUserMessage : ChatCompletionRequestUserMessage;
            #ChatCompletionRequestAssistantMessage : ChatCompletionRequestAssistantMessage;
            #ChatCompletionRequestToolMessage : ChatCompletionRequestToolMessage;
            #ChatCompletionRequestFunctionMessage : ChatCompletionRequestFunctionMessage;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessage) : JSON =
            switch (value) {
                case (#ChatCompletionRequestDeveloperMessage(v)) #ChatCompletionRequestDeveloperMessage(v);
                case (#ChatCompletionRequestSystemMessage(v)) #ChatCompletionRequestSystemMessage(v);
                case (#ChatCompletionRequestUserMessage(v)) #ChatCompletionRequestUserMessage(v);
                case (#ChatCompletionRequestAssistantMessage(v)) #ChatCompletionRequestAssistantMessage(v);
                case (#ChatCompletionRequestToolMessage(v)) #ChatCompletionRequestToolMessage(v);
                case (#ChatCompletionRequestFunctionMessage(v)) #ChatCompletionRequestFunctionMessage(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessage =
            switch (json) {
                case (#ChatCompletionRequestDeveloperMessage(v)) ?#ChatCompletionRequestDeveloperMessage(v);
                case (#ChatCompletionRequestSystemMessage(v)) ?#ChatCompletionRequestSystemMessage(v);
                case (#ChatCompletionRequestUserMessage(v)) ?#ChatCompletionRequestUserMessage(v);
                case (#ChatCompletionRequestAssistantMessage(v)) ?#ChatCompletionRequestAssistantMessage(v);
                case (#ChatCompletionRequestToolMessage(v)) ?#ChatCompletionRequestToolMessage(v);
                case (#ChatCompletionRequestFunctionMessage(v)) ?#ChatCompletionRequestFunctionMessage(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : ChatCompletionRequestMessage) : ?Text = null;
    }
}
