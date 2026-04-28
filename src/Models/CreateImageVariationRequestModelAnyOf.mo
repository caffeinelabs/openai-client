import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateImageVariationRequestModelAnyOf.mo
/// Enum values: #dall_e_2

module {
    public type CreateImageVariationRequestModelAnyOf = {
        #dall_e_2;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageVariationRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#dall_e_2) #Text("dall-e-2");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageVariationRequestModelAnyOf =
            switch (candid) {
                case (#Text("dall-e-2")) ?#dall_e_2;
                case _ null;
            };

        public func toText(value : CreateImageVariationRequestModelAnyOf) : Text =
            switch (value) {
                case (#dall_e_2) "dall-e-2";
            };
    };
};
