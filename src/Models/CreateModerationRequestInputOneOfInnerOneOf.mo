/// An object describing an image to classify.

import { type CreateModerationRequestInputOneOfInnerOneOfImageUrl; JSON = CreateModerationRequestInputOneOfInnerOneOfImageUrl } "./CreateModerationRequestInputOneOfInnerOneOfImageUrl";

import { type CreateModerationRequestInputOneOfInnerOneOfType; JSON = CreateModerationRequestInputOneOfInnerOneOfType } "./CreateModerationRequestInputOneOfInnerOneOfType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequestInputOneOfInnerOneOf.mo

module {
    public type CreateModerationRequestInputOneOfInnerOneOf = {
        type_ : CreateModerationRequestInputOneOfInnerOneOfType;
        image_url : CreateModerationRequestInputOneOfInnerOneOfImageUrl;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", CreateModerationRequestInputOneOfInnerOneOfType.toCandidValue(value.type_)));
            List.add(buf, ("image_url", CreateModerationRequestInputOneOfInnerOneOfImageUrl.toCandidValue(value.image_url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (CreateModerationRequestInputOneOfInnerOneOfType.fromCandidValue(type__field.1)) else return null;
                    let ?image_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "image_url") else return null;
                    let ?image_url = (CreateModerationRequestInputOneOfInnerOneOfImageUrl.fromCandidValue(image_url_field.1)) else return null;
                    ?{
                        type_;
                        image_url;
                    };
                };
                case _ null;
            };
    };
};
