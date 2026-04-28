/// The role of the messages author, in this case `user`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestUserMessageRole.mo
/// Enum values: #user

module {
    public type ChatCompletionRequestUserMessageRole = {
        #user;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestUserMessageRole) : Candid.Candid =
            switch (value) {
                case (#user) #Text("user");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestUserMessageRole =
            switch (candid) {
                case (#Text("user")) ?#user;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestUserMessageRole) : Text =
            switch (value) {
                case (#user) "user";
            };
    };
};
