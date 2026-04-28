/// The format in which the generated images are returned. This parameter is only supported for `gpt-image-1`. Must be one of `png`, `jpeg`, or `webp`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageRequestOutputFormat.mo
/// Enum values: #png, #jpeg, #webp

module {
    public type CreateImageRequestOutputFormat = {
        #png;
        #jpeg;
        #webp;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestOutputFormat) : Candid.Candid =
            switch (value) {
                case (#png) #Text("png");
                case (#jpeg) #Text("jpeg");
                case (#webp) #Text("webp");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestOutputFormat =
            switch (candid) {
                case (#Text("png")) ?#png;
                case (#Text("jpeg")) ?#jpeg;
                case (#Text("webp")) ?#webp;
                case _ null;
            };

        public func toText(value : CreateImageRequestOutputFormat) : Text =
            switch (value) {
                case (#png) "png";
                case (#jpeg) "jpeg";
                case (#webp) "webp";
            };
    };
};
