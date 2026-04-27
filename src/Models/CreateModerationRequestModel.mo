/// The content moderation model you would like to use. Learn more in [the moderation guide](/docs/guides/moderation), and learn about available models [here](/docs/models#moderation). 

import { type CreateModerationRequestModelAnyOf; JSON = CreateModerationRequestModelAnyOf } "./CreateModerationRequestModelAnyOf";

// CreateModerationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateModerationRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateModerationRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateModerationRequestModel = ?json;

        public func validate(_value : CreateModerationRequestModel) : ?Text = null;
    }
}
