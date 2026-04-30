/// The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for `gpt-image-1`, one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`, and one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageRequestSize.mo
/// Enum values: #auto, #_1024x1024, #_1536x1024, #_1024x1536, #_256x256, #_512x512, #_1792x1024, #_1024x1792

module {
    public type CreateImageRequestSize = {
        #auto;
        #_1024x1024;
        #_1536x1024;
        #_1024x1536;
        #_256x256;
        #_512x512;
        #_1792x1024;
        #_1024x1792;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestSize) : Candid.Candid =
            switch (value) {
                case (#auto) #Text("auto");
                case (#_1024x1024) #Text("1024x1024");
                case (#_1536x1024) #Text("1536x1024");
                case (#_1024x1536) #Text("1024x1536");
                case (#_256x256) #Text("256x256");
                case (#_512x512) #Text("512x512");
                case (#_1792x1024) #Text("1792x1024");
                case (#_1024x1792) #Text("1024x1792");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestSize =
            switch (candid) {
                case (#Text("auto")) ?#auto;
                case (#Text("1024x1024")) ?#_1024x1024;
                case (#Text("1536x1024")) ?#_1536x1024;
                case (#Text("1024x1536")) ?#_1024x1536;
                case (#Text("256x256")) ?#_256x256;
                case (#Text("512x512")) ?#_512x512;
                case (#Text("1792x1024")) ?#_1792x1024;
                case (#Text("1024x1792")) ?#_1024x1792;
                case _ null;
            };

        public func toText(value : CreateImageRequestSize) : Text =
            switch (value) {
                case (#auto) "auto";
                case (#_1024x1024) "1024x1024";
                case (#_1536x1024) "1536x1024";
                case (#_1024x1536) "1024x1536";
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1792x1024) "1792x1024";
                case (#_1024x1792) "1024x1792";
            };
    };
};
