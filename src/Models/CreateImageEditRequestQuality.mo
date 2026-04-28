/// The quality of the image that will be generated. `high`, `medium` and `low` are only supported for `gpt-image-1`. `dall-e-2` only supports `standard` quality. Defaults to `auto`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageEditRequestQuality.mo
/// Enum values: #standard, #low, #medium, #high, #auto

module {
    public type CreateImageEditRequestQuality = {
        #standard;
        #low;
        #medium;
        #high;
        #auto;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageEditRequestQuality) : Candid.Candid =
            switch (value) {
                case (#standard) #Text("standard");
                case (#low) #Text("low");
                case (#medium) #Text("medium");
                case (#high) #Text("high");
                case (#auto) #Text("auto");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageEditRequestQuality =
            switch (candid) {
                case (#Text("standard")) ?#standard;
                case (#Text("low")) ?#low;
                case (#Text("medium")) ?#medium;
                case (#Text("high")) ?#high;
                case (#Text("auto")) ?#auto;
                case _ null;
            };

        public func toText(value : CreateImageEditRequestQuality) : Text =
            switch (value) {
                case (#standard) "standard";
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
                case (#auto) "auto";
            };
    };
};
