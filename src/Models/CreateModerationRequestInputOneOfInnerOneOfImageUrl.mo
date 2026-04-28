/// Contains either an image URL or a data URL for a base64 encoded image.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequestInputOneOfInnerOneOfImageUrl.mo

module {
    public type CreateModerationRequestInputOneOfInnerOneOfImageUrl = {
        /// Either a URL of the image or the base64 encoded image data.
        url : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOfImageUrl) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("url", #Text(value.url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOfImageUrl =
            switch (candid) {
                case (#Record(fields)) {
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        url;
                    };
                };
                case _ null;
            };
    };
};
