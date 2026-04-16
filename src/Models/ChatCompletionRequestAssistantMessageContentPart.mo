
import { type ChatCompletionRequestMessageContentPartRefusal; JSON = ChatCompletionRequestMessageContentPartRefusal } "./ChatCompletionRequestMessageContentPartRefusal";

import { type ChatCompletionRequestMessageContentPartRefusalType; JSON = ChatCompletionRequestMessageContentPartRefusalType } "./ChatCompletionRequestMessageContentPartRefusalType";

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";

// ChatCompletionRequestAssistantMessageContentPart.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestAssistantMessageContentPart = {
        #ChatCompletionRequestMessageContentPartText : ChatCompletionRequestMessageContentPartText;
        #ChatCompletionRequestMessageContentPartRefusal : ChatCompletionRequestMessageContentPartRefusal;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestAssistantMessageContentPart) : Text =
            switch (value) {
                case (#ChatCompletionRequestMessageContentPartText(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartRefusal(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestAssistantMessageContentPart type
        public type JSON = {
            #ChatCompletionRequestMessageContentPartText : ChatCompletionRequestMessageContentPartText;
            #ChatCompletionRequestMessageContentPartRefusal : ChatCompletionRequestMessageContentPartRefusal;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestAssistantMessageContentPart) : JSON =
            switch (value) {
                case (#ChatCompletionRequestMessageContentPartText(v)) #ChatCompletionRequestMessageContentPartText(v);
                case (#ChatCompletionRequestMessageContentPartRefusal(v)) #ChatCompletionRequestMessageContentPartRefusal(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestAssistantMessageContentPart =
            switch (json) {
                case (#ChatCompletionRequestMessageContentPartText(v)) ?#ChatCompletionRequestMessageContentPartText(v);
                case (#ChatCompletionRequestMessageContentPartRefusal(v)) ?#ChatCompletionRequestMessageContentPartRefusal(v);
            };
    }
}
