/// The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for `gpt-image-1`, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageEditRequestSize.mo
/// Enum values: #_256x256, #_512x512, #_1024x1024, #_1536x1024, #_1024x1536, #auto

module {
    public type CreateImageEditRequestSize = {
        #_256x256;
        #_512x512;
        #_1024x1024;
        #_1536x1024;
        #_1024x1536;
        #auto;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageEditRequestSize) : Candid.Candid =
            switch (value) {
                case (#_256x256) #Text("256x256");
                case (#_512x512) #Text("512x512");
                case (#_1024x1024) #Text("1024x1024");
                case (#_1536x1024) #Text("1536x1024");
                case (#_1024x1536) #Text("1024x1536");
                case (#auto) #Text("auto");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageEditRequestSize =
            switch (candid) {
                case (#Text("256x256")) ?#_256x256;
                case (#Text("512x512")) ?#_512x512;
                case (#Text("1024x1024")) ?#_1024x1024;
                case (#Text("1536x1024")) ?#_1536x1024;
                case (#Text("1024x1536")) ?#_1024x1536;
                case (#Text("auto")) ?#auto;
                case _ null;
            };

        public func toText(value : CreateImageEditRequestSize) : Text =
            switch (value) {
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1024x1024) "1024x1024";
                case (#_1536x1024) "1536x1024";
                case (#_1024x1536) "1024x1536";
                case (#auto) "auto";
            };
    };
};
