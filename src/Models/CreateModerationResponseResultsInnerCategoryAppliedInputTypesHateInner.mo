import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.mo
/// Enum values: #text_

module {
    public type CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner = {
        #text_;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case _ null;
            };

        public func toText(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner) : Text =
            switch (value) {
                case (#text_) "text";
            };
    };
};
