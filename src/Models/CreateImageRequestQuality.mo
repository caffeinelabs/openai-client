/// The quality of the image that will be generated.   - `auto` (default value) will automatically select the best quality for the given model. - `high`, `medium` and `low` are supported for `gpt-image-1`. - `hd` and `standard` are supported for `dall-e-3`. - `standard` is the only option for `dall-e-2`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageRequestQuality.mo
/// Enum values: #standard, #hd, #low, #medium, #high, #auto

module {
    public type CreateImageRequestQuality = {
        #standard;
        #hd;
        #low;
        #medium;
        #high;
        #auto;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestQuality) : Candid.Candid =
            switch (value) {
                case (#standard) #Text("standard");
                case (#hd) #Text("hd");
                case (#low) #Text("low");
                case (#medium) #Text("medium");
                case (#high) #Text("high");
                case (#auto) #Text("auto");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestQuality =
            switch (candid) {
                case (#Text("standard")) ?#standard;
                case (#Text("hd")) ?#hd;
                case (#Text("low")) ?#low;
                case (#Text("medium")) ?#medium;
                case (#Text("high")) ?#high;
                case (#Text("auto")) ?#auto;
                case _ null;
            };

        public func toText(value : CreateImageRequestQuality) : Text =
            switch (value) {
                case (#standard) "standard";
                case (#hd) "hd";
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
                case (#auto) "auto";
            };
    };
};
