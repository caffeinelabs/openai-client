/// The role of the author of this message.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionStreamResponseDeltaRole.mo
/// Enum values: #developer, #system_, #user, #assistant, #tool

module {
    public type ChatCompletionStreamResponseDeltaRole = {
        #developer;
        #system_;
        #user;
        #assistant;
        #tool;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionStreamResponseDeltaRole) : Candid.Candid =
            switch (value) {
                case (#developer) #Text("developer");
                case (#system_) #Text("system");
                case (#user) #Text("user");
                case (#assistant) #Text("assistant");
                case (#tool) #Text("tool");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionStreamResponseDeltaRole =
            switch (candid) {
                case (#Text("developer")) ?#developer;
                case (#Text("system")) ?#system_;
                case (#Text("user")) ?#user;
                case (#Text("assistant")) ?#assistant;
                case (#Text("tool")) ?#tool;
                case _ null;
            };

        public func toText(value : ChatCompletionStreamResponseDeltaRole) : Text =
            switch (value) {
                case (#developer) "developer";
                case (#system_) "system";
                case (#user) "user";
                case (#assistant) "assistant";
                case (#tool) "tool";
            };
    };
};
