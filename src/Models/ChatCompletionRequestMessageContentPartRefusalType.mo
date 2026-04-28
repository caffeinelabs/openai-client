/// The type of the content part.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartRefusalType.mo
/// Enum values: #refusal

module {
    public type ChatCompletionRequestMessageContentPartRefusalType = {
        #refusal;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartRefusalType) : Candid.Candid =
            switch (value) {
                case (#refusal) #Text("refusal");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartRefusalType =
            switch (candid) {
                case (#Text("refusal")) ?#refusal;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartRefusalType) : Text =
            switch (value) {
                case (#refusal) "refusal";
            };
    };
};
