/// The role of the messages author, in this case `system`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestSystemMessageRole.mo
/// Enum values: #system_

module {
    public type ChatCompletionRequestSystemMessageRole = {
        #system_;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestSystemMessageRole) : Candid.Candid =
            switch (value) {
                case (#system_) #Text("system");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestSystemMessageRole =
            switch (candid) {
                case (#Text("system")) ?#system_;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestSystemMessageRole) : Text =
            switch (value) {
                case (#system_) "system";
            };
    };
};
