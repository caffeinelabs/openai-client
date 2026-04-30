import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.mo
/// Enum values: #text_, #image

module {
    public type CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner = {
        #text_;
        #image;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
                case (#image) #Text("image");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case (#Text("image")) ?#image;
                case _ null;
            };

        public func toText(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner) : Text =
            switch (value) {
                case (#text_) "text";
                case (#image) "image";
            };
    };
};
