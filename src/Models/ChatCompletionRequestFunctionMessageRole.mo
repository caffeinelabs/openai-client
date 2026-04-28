/// The role of the messages author, in this case `function`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestFunctionMessageRole.mo
/// Enum values: #function

module {
    public type ChatCompletionRequestFunctionMessageRole = {
        #function;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestFunctionMessageRole) : Candid.Candid =
            switch (value) {
                case (#function) #Text("function");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestFunctionMessageRole =
            switch (candid) {
                case (#Text("function")) ?#function;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestFunctionMessageRole) : Text =
            switch (value) {
                case (#function) "function";
            };
    };
};
