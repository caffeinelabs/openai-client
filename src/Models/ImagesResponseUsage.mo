/// For `gpt-image-1` only, the token usage information for the image generation. 

import { type ImagesResponseUsageInputTokensDetails; JSON = ImagesResponseUsageInputTokensDetails } "./ImagesResponseUsageInputTokensDetails";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ImagesResponseUsage.mo

module {
    /// The required-fields slice of ImagesResponseUsage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The total number of tokens (images and text) used for the image generation.
        total_tokens : Int;
        /// The number of tokens (images and text) in the input prompt.
        input_tokens : Int;
        /// The number of image tokens in the output image.
        output_tokens : Int;
        input_tokens_details : ImagesResponseUsageInputTokensDetails;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ImagesResponseUsage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ImagesResponseUsage = Required and Optional;

    public module JSON {
        // `init` constructs a ImagesResponseUsage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ImagesResponseUsage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ImagesResponseUsage {
            let ?res = from_candid(to_candid(required)) : ?ImagesResponseUsage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ImagesResponseUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("total_tokens", #Int(value.total_tokens)));
            List.add(buf, ("input_tokens", #Int(value.input_tokens)));
            List.add(buf, ("output_tokens", #Int(value.output_tokens)));
            List.add(buf, ("input_tokens_details", ImagesResponseUsageInputTokensDetails.toCandidValue(value.input_tokens_details)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ImagesResponseUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?total_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_tokens") else return null;
                    let ?total_tokens = ((switch (total_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?input_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input_tokens") else return null;
                    let ?input_tokens = ((switch (input_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?output_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "output_tokens") else return null;
                    let ?output_tokens = ((switch (output_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?input_tokens_details_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input_tokens_details") else return null;
                    let ?input_tokens_details = (ImagesResponseUsageInputTokensDetails.fromCandidValue(input_tokens_details_field.1)) else return null;
                    ?{
                        total_tokens;
                        input_tokens;
                        output_tokens;
                        input_tokens_details;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
