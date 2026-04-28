/// The input tokens detailed information for the image generation.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ImagesResponseUsageInputTokensDetails.mo

module {
    public type ImagesResponseUsageInputTokensDetails = {
        /// The number of text tokens in the input prompt.
        text_tokens : Int;
        /// The number of image tokens in the input prompt.
        image_tokens : Int;
    };

    public module JSON {
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
};
