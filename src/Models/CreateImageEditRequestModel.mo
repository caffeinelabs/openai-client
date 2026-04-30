/// The model to use for image generation. Only `dall-e-2` and `gpt-image-1` are supported. Defaults to `dall-e-2` unless a parameter specific to `gpt-image-1` is used.

import { type CreateImageEditRequestModelAnyOf; JSON = CreateImageEditRequestModelAnyOf } "./CreateImageEditRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageEditRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateImageEditRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateImageEditRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageEditRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateImageEditRequestModel) : Text = value;
    };
};
