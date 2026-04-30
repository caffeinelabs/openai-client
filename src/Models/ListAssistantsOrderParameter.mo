import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListAssistantsOrderParameter.mo
/// Enum values: #asc, #desc

module {
    public type ListAssistantsOrderParameter = {
        #asc;
        #desc;
    };

    public module JSON {
        public func toCandidValue(value : ListAssistantsOrderParameter) : Candid.Candid =
            switch (value) {
                case (#asc) #Text("asc");
                case (#desc) #Text("desc");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ListAssistantsOrderParameter =
            switch (candid) {
                case (#Text("asc")) ?#asc;
                case (#Text("desc")) ?#desc;
                case _ null;
            };

        public func toText(value : ListAssistantsOrderParameter) : Text =
            switch (value) {
                case (#asc) "asc";
                case (#desc) "desc";
            };
    };
};
