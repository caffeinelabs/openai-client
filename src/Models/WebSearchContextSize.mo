/// High level guidance for the amount of context window space to use for the  search. One of `low`, `medium`, or `high`. `medium` is the default. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebSearchContextSize.mo
/// Enum values: #low, #medium, #high

module {
    public type WebSearchContextSize = {
        #low;
        #medium;
        #high;
    };

    public module JSON {
        public func toCandidValue(value : WebSearchContextSize) : Candid.Candid =
            switch (value) {
                case (#low) #Text("low");
                case (#medium) #Text("medium");
                case (#high) #Text("high");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?WebSearchContextSize =
            switch (candid) {
                case (#Text("low")) ?#low;
                case (#Text("medium")) ?#medium;
                case (#Text("high")) ?#high;
                case _ null;
            };

        public func toText(value : WebSearchContextSize) : Text =
            switch (value) {
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
            };
    };
};
