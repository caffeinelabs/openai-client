/// The content that should be matched when generating a model response. If generated tokens would match this content, the entire model response can be returned much more quickly. 

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";

// PredictionContentContent.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type PredictionContentContent = {
        #one_of_0 : Text;
        #ChatCompletionRequestMessageContentPartText : [ChatCompletionRequestMessageContentPartText];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : PredictionContentContent) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartText(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PredictionContentContent type
        public type JSON = {
            #one_of_0 : Text;
            #ChatCompletionRequestMessageContentPartText : [ChatCompletionRequestMessageContentPartText];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PredictionContentContent) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#ChatCompletionRequestMessageContentPartText(v)) #ChatCompletionRequestMessageContentPartText(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PredictionContentContent =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#ChatCompletionRequestMessageContentPartText(v)) ?#ChatCompletionRequestMessageContentPartText(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : PredictionContentContent) : ?Text = null;
    }
}
