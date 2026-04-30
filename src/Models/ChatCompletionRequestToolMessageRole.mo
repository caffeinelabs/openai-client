/// The role of the messages author, in this case `tool`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestToolMessageRole.mo
/// Enum values: #tool

module {
    public type ChatCompletionRequestToolMessageRole = {
        #tool;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestToolMessageRole) : Candid.Candid =
            switch (value) {
                case (#tool) #Text("tool");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestToolMessageRole =
            switch (candid) {
                case (#Text("tool")) ?#tool;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestToolMessageRole) : Text =
            switch (value) {
                case (#tool) "tool";
            };
    };
};
