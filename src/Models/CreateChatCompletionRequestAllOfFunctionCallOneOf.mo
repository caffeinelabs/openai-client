/// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionRequestAllOfFunctionCallOneOf.mo
/// Enum values: #none_, #auto

module {
    public type CreateChatCompletionRequestAllOfFunctionCallOneOf = {
        #none_;
        #auto;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionRequestAllOfFunctionCallOneOf) : Candid.Candid =
            switch (value) {
                case (#none_) #Text("none");
                case (#auto) #Text("auto");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfFunctionCallOneOf =
            switch (candid) {
                case (#Text("none")) ?#none_;
                case (#Text("auto")) ?#auto;
                case _ null;
            };

        public func toText(value : CreateChatCompletionRequestAllOfFunctionCallOneOf) : Text =
            switch (value) {
                case (#none_) "none";
                case (#auto) "auto";
            };
    };
};
