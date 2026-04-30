/// The input tokens detailed information for the image generation.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ImagesResponseUsageInputTokensDetails.mo

module {
    /// The required-fields slice of ImagesResponseUsageInputTokensDetails — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The number of text tokens in the input prompt.
        text_tokens : Int;
        /// The number of image tokens in the input prompt.
        image_tokens : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ImagesResponseUsageInputTokensDetails as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ImagesResponseUsageInputTokensDetails = Required and Optional;

    public module JSON {
        // `init` constructs a ImagesResponseUsageInputTokensDetails from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ImagesResponseUsageInputTokensDetails.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ImagesResponseUsageInputTokensDetails {
            let ?res = from_candid(to_candid(required)) : ?ImagesResponseUsageInputTokensDetails else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ImagesResponseUsageInputTokensDetails) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("text_tokens", #Int(value.text_tokens)));
            List.add(buf, ("image_tokens", #Int(value.image_tokens)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ImagesResponseUsageInputTokensDetails =
            switch (candid) {
                case (#Record(fields)) {
                    let ?text_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text_tokens") else return null;
                    let ?text_tokens = ((switch (text_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?image_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "image_tokens") else return null;
                    let ?image_tokens = ((switch (image_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        text_tokens;
                        image_tokens;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
