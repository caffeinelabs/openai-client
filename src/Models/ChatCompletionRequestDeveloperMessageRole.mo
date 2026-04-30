/// The role of the messages author, in this case `developer`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestDeveloperMessageRole.mo
/// Enum values: #developer

module {
    public type ChatCompletionRequestDeveloperMessageRole = {
        #developer;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestDeveloperMessageRole) : Candid.Candid =
            switch (value) {
                case (#developer) #Text("developer");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestDeveloperMessageRole =
            switch (candid) {
                case (#Text("developer")) ?#developer;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestDeveloperMessageRole) : Text =
            switch (value) {
                case (#developer) "developer";
            };
    };
};
