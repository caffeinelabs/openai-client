/// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionToolChoiceOptionOneOf.mo
/// Enum values: #none_, #auto, #required

module {
    public type ChatCompletionToolChoiceOptionOneOf = {
        #none_;
        #auto;
        #required;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionToolChoiceOptionOneOf) : Candid.Candid =
            switch (value) {
                case (#none_) #Text("none");
                case (#auto) #Text("auto");
                case (#required) #Text("required");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionToolChoiceOptionOneOf =
            switch (candid) {
                case (#Text("none")) ?#none_;
                case (#Text("auto")) ?#auto;
                case (#Text("required")) ?#required;
                case _ null;
            };

        public func toText(value : ChatCompletionToolChoiceOptionOneOf) : Text =
            switch (value) {
                case (#none_) "none";
                case (#auto) "auto";
                case (#required) "required";
            };
    };
};
