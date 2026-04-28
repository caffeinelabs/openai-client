/// The role of the author of this message.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionResponseMessageRole.mo
/// Enum values: #assistant

module {
    public type ChatCompletionResponseMessageRole = {
        #assistant;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionResponseMessageRole) : Candid.Candid =
            switch (value) {
                case (#assistant) #Text("assistant");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionResponseMessageRole =
            switch (candid) {
                case (#Text("assistant")) ?#assistant;
                case _ null;
            };

        public func toText(value : ChatCompletionResponseMessageRole) : Text =
            switch (value) {
                case (#assistant) "assistant";
            };
    };
};
