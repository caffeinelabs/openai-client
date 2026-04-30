/// The image(s) to edit. Must be a supported image file or an array of images.  For `gpt-image-1`, each image should be a `png`, `webp`, or `jpg` file less  than 25MB. You can provide up to 16 images.  For `dall-e-2`, you can only provide one image, and it should be a square  `png` file less than 4MB. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageEditRequestImage.mo

module {
    /// The required-fields slice of CreateImageEditRequestImage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateImageEditRequestImage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateImageEditRequestImage = Required and Optional;

    public module JSON {
        // `init` constructs a CreateImageEditRequestImage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateImageEditRequestImage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateImageEditRequestImage {
            let ?res = from_candid(to_candid(required)) : ?CreateImageEditRequestImage else Runtime.unreachable();
            res
        };

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
