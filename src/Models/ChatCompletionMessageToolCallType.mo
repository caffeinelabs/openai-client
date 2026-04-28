/// The type of the tool. Currently, only `function` is supported.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionMessageToolCallType.mo
/// Enum values: #function

module {
    public type ChatCompletionMessageToolCallType = {
        #function;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionMessageToolCallType) : Candid.Candid =
            switch (value) {
                case (#function) #Text("function");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCallType =
            switch (candid) {
                case (#Text("function")) ?#function;
                case _ null;
            };

        public func toText(value : ChatCompletionMessageToolCallType) : Text =
            switch (value) {
                case (#function) "function";
            };
    };
};
