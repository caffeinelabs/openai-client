/// The image(s) to edit. Must be a supported image file or an array of images.  For `gpt-image-1`, each image should be a `png`, `webp`, or `jpg` file less  than 25MB. You can provide up to 16 images.  For `dall-e-2`, you can only provide one image, and it should be a square  `png` file less than 4MB. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateImageEditRequestImage.mo

module {
    public type CreateImageEditRequestImage = {
    };

    public module JSON {
        public func toCandidValue(value : CreateImageEditRequestImage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageEditRequestImage =
            switch (candid) {
                case (#Record(fields)) {
                    ?{
                    };
                };
                case _ null;
            };
    };
};
