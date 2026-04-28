/// The model to use for image generation. Only `dall-e-2` is supported at this time.

import { type CreateImageVariationRequestModelAnyOf; JSON = CreateImageVariationRequestModelAnyOf } "./CreateImageVariationRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageVariationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateImageVariationRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateImageVariationRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageVariationRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateImageVariationRequestModel) : Text = value;
    };
};
