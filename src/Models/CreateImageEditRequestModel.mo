/// The model to use for image generation. Only `dall-e-2` and `gpt-image-1` are supported. Defaults to `dall-e-2` unless a parameter specific to `gpt-image-1` is used.

import { type CreateImageEditRequestModelAnyOf; JSON = CreateImageEditRequestModelAnyOf } "./CreateImageEditRequestModelAnyOf";

// CreateImageEditRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateImageEditRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateImageEditRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateImageEditRequestModel = ?json;

        public func validate(_value : CreateImageEditRequestModel) : ?Text = null;
    }
}
