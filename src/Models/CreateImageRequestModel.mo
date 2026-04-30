/// The model to use for image generation. One of `dall-e-2`, `dall-e-3`, or `gpt-image-1`. Defaults to `dall-e-2` unless a parameter specific to `gpt-image-1` is used.

import { type CreateImageRequestModelAnyOf; JSON = CreateImageRequestModelAnyOf } "./CreateImageRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateImageRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateImageRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateImageRequestModel) : Text = value;
    };
};
