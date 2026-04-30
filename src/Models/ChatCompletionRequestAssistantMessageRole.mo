/// The role of the messages author, in this case `assistant`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestAssistantMessageRole.mo
/// Enum values: #assistant

module {
    public type ChatCompletionRequestAssistantMessageRole = {
        #assistant;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestAssistantMessageRole) : Candid.Candid =
            switch (value) {
                case (#assistant) #Text("assistant");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestAssistantMessageRole =
            switch (candid) {
                case (#Text("assistant")) ?#assistant;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestAssistantMessageRole) : Text =
            switch (value) {
                case (#assistant) "assistant";
            };
    };
};
