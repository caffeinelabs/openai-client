/// Always `image_url`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateModerationRequestInputOneOfInnerOneOfType.mo
/// Enum values: #image_url

module {
    public type CreateModerationRequestInputOneOfInnerOneOfType = {
        #image_url;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOfType) : Candid.Candid =
            switch (value) {
                case (#image_url) #Text("image_url");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOfType =
            switch (candid) {
                case (#Text("image_url")) ?#image_url;
                case _ null;
            };

        public func toText(value : CreateModerationRequestInputOneOfInnerOneOfType) : Text =
            switch (value) {
                case (#image_url) "image_url";
            };
    };
};
