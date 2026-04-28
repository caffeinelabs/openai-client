/// For `gpt-image-1` only, the token usage information for the image generation. 

import { type ImagesResponseUsageInputTokensDetails; JSON = ImagesResponseUsageInputTokensDetails } "./ImagesResponseUsageInputTokensDetails";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ImagesResponseUsage.mo

module {
    public type ImagesResponseUsage = {
        /// The total number of tokens (images and text) used for the image generation.
        total_tokens : Int;
        /// The number of tokens (images and text) in the input prompt.
        input_tokens : Int;
        /// The number of image tokens in the output image.
        output_tokens : Int;
        input_tokens_details : ImagesResponseUsageInputTokensDetails;
    };

    public module JSON {
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
                    let ?total_tokens = ((switch (total_tokens_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let ?input_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input_tokens") else return null;
                    let ?input_tokens = ((switch (input_tokens_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let ?output_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "output_tokens") else return null;
                    let ?output_tokens = ((switch (output_tokens_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
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
};
