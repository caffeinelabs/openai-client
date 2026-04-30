import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListChatCompletionsOrderParameter.mo
/// Enum values: #asc, #desc

module {
    public type ListChatCompletionsOrderParameter = {
        #asc;
        #desc;
    };

    public module JSON {
        public func toCandidValue(value : ListChatCompletionsOrderParameter) : Candid.Candid =
            switch (value) {
                case (#asc) #Text("asc");
                case (#desc) #Text("desc");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ListChatCompletionsOrderParameter =
            switch (candid) {
                case (#Text("asc")) ?#asc;
                case (#Text("desc")) ?#desc;
                case _ null;
            };

        public func toText(value : ListChatCompletionsOrderParameter) : Text =
            switch (value) {
                case (#asc) "asc";
                case (#desc) "desc";
            };
    };
};
