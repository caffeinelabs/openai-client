/// The type of the content part.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartTextType.mo
/// Enum values: #text_

module {
    public type ChatCompletionRequestMessageContentPartTextType = {
        #text_;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartTextType) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartTextType =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartTextType) : Text =
            switch (value) {
                case (#text_) "text";
            };
    };
};
