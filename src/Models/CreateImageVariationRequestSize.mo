/// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageVariationRequestSize.mo
/// Enum values: #_256x256, #_512x512, #_1024x1024

module {
    public type CreateImageVariationRequestSize = {
        #_256x256;
        #_512x512;
        #_1024x1024;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageVariationRequestSize) : Candid.Candid =
            switch (value) {
                case (#_256x256) #Text("256x256");
                case (#_512x512) #Text("512x512");
                case (#_1024x1024) #Text("1024x1024");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageVariationRequestSize =
            switch (candid) {
                case (#Text("256x256")) ?#_256x256;
                case (#Text("512x512")) ?#_512x512;
                case (#Text("1024x1024")) ?#_1024x1024;
                case _ null;
            };

        public func toText(value : CreateImageVariationRequestSize) : Text =
            switch (value) {
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1024x1024) "1024x1024";
            };
    };
};
