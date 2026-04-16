/// The contents of the user message. 

import { type ChatCompletionRequestUserMessageContentPart; JSON = ChatCompletionRequestUserMessageContentPart } "./ChatCompletionRequestUserMessageContentPart";

// ChatCompletionRequestUserMessageContent.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestUserMessageContent = {
        #one_of_0 : Text;
        #ChatCompletionRequestUserMessageContentPart : [ChatCompletionRequestUserMessageContentPart];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestUserMessageContent) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#ChatCompletionRequestUserMessageContentPart(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestUserMessageContent type
        public type JSON = {
            #one_of_0 : Text;
            #ChatCompletionRequestUserMessageContentPart : [ChatCompletionRequestUserMessageContentPart];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestUserMessageContent) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#ChatCompletionRequestUserMessageContentPart(v)) #ChatCompletionRequestUserMessageContentPart(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestUserMessageContent =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#ChatCompletionRequestUserMessageContentPart(v)) ?#ChatCompletionRequestUserMessageContentPart(v);
            };
    }
}
