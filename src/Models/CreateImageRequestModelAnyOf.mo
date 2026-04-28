import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageRequestModelAnyOf.mo
/// Enum values: #dall_e_2, #dall_e_3, #gpt_image_1

module {
    public type CreateImageRequestModelAnyOf = {
        #dall_e_2;
        #dall_e_3;
        #gpt_image_1;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#dall_e_2) #Text("dall-e-2");
                case (#dall_e_3) #Text("dall-e-3");
                case (#gpt_image_1) #Text("gpt-image-1");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestModelAnyOf =
            switch (candid) {
                case (#Text("dall-e-2")) ?#dall_e_2;
                case (#Text("dall-e-3")) ?#dall_e_3;
                case (#Text("gpt-image-1")) ?#gpt_image_1;
                case _ null;
            };

        public func toText(value : CreateImageRequestModelAnyOf) : Text =
            switch (value) {
                case (#dall_e_2) "dall-e-2";
                case (#dall_e_3) "dall-e-3";
                case (#gpt_image_1) "gpt-image-1";
            };
    };
};
