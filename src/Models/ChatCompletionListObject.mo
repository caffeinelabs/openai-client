/// The type of this object. It is always set to \"list\". 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionListObject.mo
/// Enum values: #list

module {
    public type ChatCompletionListObject = {
        #list;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionListObject) : Candid.Candid =
            switch (value) {
                case (#list) #Text("list");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionListObject =
            switch (candid) {
                case (#Text("list")) ?#list;
                case _ null;
            };

        public func toText(value : ChatCompletionListObject) : Text =
            switch (value) {
                case (#list) "list";
            };
    };
};
