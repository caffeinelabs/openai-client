
import { type CreateModerationRequestInputOneOfInnerOneOf; JSON = CreateModerationRequestInputOneOfInnerOneOf } "./CreateModerationRequestInputOneOfInnerOneOf";

import { type CreateModerationRequestInputOneOfInnerOneOf1; JSON = CreateModerationRequestInputOneOfInnerOneOf1 } "./CreateModerationRequestInputOneOfInnerOneOf1";

import { type CreateModerationRequestInputOneOfInnerOneOf1Type; JSON = CreateModerationRequestInputOneOfInnerOneOf1Type } "./CreateModerationRequestInputOneOfInnerOneOf1Type";

import { type CreateModerationRequestInputOneOfInnerOneOfImageUrl; JSON = CreateModerationRequestInputOneOfInnerOneOfImageUrl } "./CreateModerationRequestInputOneOfInnerOneOfImageUrl";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequestInputOneOfInner.mo
// Discriminator-oneOf — wire is a flat object whose `type`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type CreateModerationRequestInputOneOfInner = {
        #image_url : CreateModerationRequestInputOneOfInnerOneOf;
        #text_ : CreateModerationRequestInputOneOfInnerOneOf1;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInner) : Candid.Candid =
            switch (value) {
                case (#image_url(v)) CreateModerationRequestInputOneOfInnerOneOf.toCandidValue(v);
                case (#text_(v)) CreateModerationRequestInputOneOfInnerOneOf1.toCandidValue(v);
            };

        public func toText(value : CreateModerationRequestInputOneOfInner) : Text =
            switch (value) {
                case (#image_url(_)) "image_url";
                case (#text_(_)) "text";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("image_url") {
                                    let ?inner = CreateModerationRequestInputOneOfInnerOneOf.fromCandidValue(candid) else return null;
                                    ?#image_url(inner);
                                };
                                case ("text") {
                                    let ?inner = CreateModerationRequestInputOneOfInnerOneOf1.fromCandidValue(candid) else return null;
                                    ?#text_(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
