/// The model to use for image generation. Only `dall-e-2` is supported at this time.

import { type CreateImageVariationRequestModelAnyOf; JSON = CreateImageVariationRequestModelAnyOf } "./CreateImageVariationRequestModelAnyOf";

// CreateImageVariationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateImageVariationRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateImageVariationRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateImageVariationRequestModel = ?json;

        public func validate(_value : CreateImageVariationRequestModel) : ?Text = null;
    }
}
