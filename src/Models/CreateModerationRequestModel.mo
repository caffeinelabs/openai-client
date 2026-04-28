/// The content moderation model you would like to use. Learn more in [the moderation guide](/docs/guides/moderation), and learn about available models [here](/docs/models#moderation). 

import { type CreateModerationRequestModelAnyOf; JSON = CreateModerationRequestModelAnyOf } "./CreateModerationRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateModerationRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateModerationRequestModel) : Text = value;
    };
};
