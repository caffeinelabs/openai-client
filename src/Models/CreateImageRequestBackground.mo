/// Allows to set transparency for the background of the generated image(s).  This parameter is only supported for `gpt-image-1`. Must be one of  `transparent`, `opaque` or `auto` (default value). When `auto` is used, the  model will automatically determine the best background for the image.  If `transparent`, the output format needs to support transparency, so it  should be set to either `png` (default value) or `webp`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageRequestBackground.mo
/// Enum values: #transparent, #opaque, #auto

module {
    public type CreateImageRequestBackground = {
        #transparent;
        #opaque;
        #auto;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestBackground) : Candid.Candid =
            switch (value) {
                case (#transparent) #Text("transparent");
                case (#opaque) #Text("opaque");
                case (#auto) #Text("auto");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestBackground =
            switch (candid) {
                case (#Text("transparent")) ?#transparent;
                case (#Text("opaque")) ?#opaque;
                case (#Text("auto")) ?#auto;
                case _ null;
            };

        public func toText(value : CreateImageRequestBackground) : Text =
            switch (value) {
                case (#transparent) "transparent";
                case (#opaque) "opaque";
                case (#auto) "auto";
            };
    };
};
