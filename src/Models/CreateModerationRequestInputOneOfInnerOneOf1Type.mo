/// Always `text`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateModerationRequestInputOneOfInnerOneOf1Type.mo
/// Enum values: #text_

module {
    public type CreateModerationRequestInputOneOfInnerOneOf1Type = {
        #text_;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOf1Type) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOf1Type =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case _ null;
            };

        public func toText(value : CreateModerationRequestInputOneOfInnerOneOf1Type) : Text =
            switch (value) {
                case (#text_) "text";
            };
    };
};
