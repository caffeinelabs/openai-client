/// Contains either an image URL or a data URL for a base64 encoded image.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationRequestInputOneOfInnerOneOfImageUrl.mo

module {
    /// The required-fields slice of CreateModerationRequestInputOneOfInnerOneOfImageUrl — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Either a URL of the image or the base64 encoded image data.
        url : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationRequestInputOneOfInnerOneOfImageUrl as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateModerationRequestInputOneOfInnerOneOfImageUrl = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationRequestInputOneOfInnerOneOfImageUrl from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationRequestInputOneOfInnerOneOfImageUrl.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationRequestInputOneOfInnerOneOfImageUrl {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationRequestInputOneOfInnerOneOfImageUrl else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOfImageUrl) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("url", #Text(value.url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOfImageUrl =
            switch (candid) {
                case (#Record(fields)) {
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        url;
                    };
                };
                case _ null;
            };
    };
};
