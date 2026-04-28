/// The type of response format being defined. Always `text`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ResponseFormatTextType.mo
/// Enum values: #text_

module {
    public type ResponseFormatTextType = {
        #text_;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatTextType) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatTextType =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case _ null;
            };

        public func toText(value : ResponseFormatTextType) : Text =
            switch (value) {
                case (#text_) "text";
            };
    };
};
