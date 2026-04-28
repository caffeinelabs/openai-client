import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageEditRequestModelAnyOf.mo
/// Enum values: #dall_e_2, #gpt_image_1

module {
    public type CreateImageEditRequestModelAnyOf = {
        #dall_e_2;
        #gpt_image_1;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageEditRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#dall_e_2) #Text("dall-e-2");
                case (#gpt_image_1) #Text("gpt-image-1");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageEditRequestModelAnyOf =
            switch (candid) {
                case (#Text("dall-e-2")) ?#dall_e_2;
                case (#Text("gpt-image-1")) ?#gpt_image_1;
                case _ null;
            };

        public func toText(value : CreateImageEditRequestModelAnyOf) : Text =
            switch (value) {
                case (#dall_e_2) "dall-e-2";
                case (#gpt_image_1) "gpt-image-1";
            };
    };
};
