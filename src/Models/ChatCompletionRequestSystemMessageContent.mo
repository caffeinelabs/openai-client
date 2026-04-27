/// The contents of the system message.

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";

// ChatCompletionRequestSystemMessageContent.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestSystemMessageContent = {
        #one_of_0 : Text;
        #ChatCompletionRequestMessageContentPartText : [ChatCompletionRequestMessageContentPartText];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestSystemMessageContent) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartText(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestSystemMessageContent type
        public type JSON = {
            #one_of_0 : Text;
            #ChatCompletionRequestMessageContentPartText : [ChatCompletionRequestMessageContentPartText];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestSystemMessageContent) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#ChatCompletionRequestMessageContentPartText(v)) #ChatCompletionRequestMessageContentPartText(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestSystemMessageContent =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#ChatCompletionRequestMessageContentPartText(v)) ?#ChatCompletionRequestMessageContentPartText(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : ChatCompletionRequestSystemMessageContent) : ?Text = null;
    }
}
