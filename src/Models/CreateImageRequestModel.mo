/// The model to use for image generation. One of `dall-e-2`, `dall-e-3`, or `gpt-image-1`. Defaults to `dall-e-2` unless a parameter specific to `gpt-image-1` is used.

import { type CreateImageRequestModelAnyOf; JSON = CreateImageRequestModelAnyOf } "./CreateImageRequestModelAnyOf";

// CreateImageRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateImageRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateImageRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateImageRequestModel = ?json;

        public func validate(_value : CreateImageRequestModel) : ?Text = null;
    }
}
