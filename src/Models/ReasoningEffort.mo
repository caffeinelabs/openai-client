/// **o-series models only**   Constrains effort on reasoning for  [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently supported values are `low`, `medium`, and `high`. Reducing reasoning effort can result in faster responses and fewer tokens used on reasoning in a response. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ReasoningEffort.mo
/// Enum values: #low, #medium, #high

module {
    public type ReasoningEffort = {
        #low;
        #medium;
        #high;
    };

    public module JSON {
        public func toCandidValue(value : ReasoningEffort) : Candid.Candid =
            switch (value) {
                case (#low) #Text("low");
                case (#medium) #Text("medium");
                case (#high) #Text("high");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ReasoningEffort =
            switch (candid) {
                case (#Text("low")) ?#low;
                case (#Text("medium")) ?#medium;
                case (#Text("high")) ?#high;
                case _ null;
            };

        public func toText(value : ReasoningEffort) : Text =
            switch (value) {
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
            };
    };
};
