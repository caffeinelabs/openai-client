/// One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd` or `gpt-4o-mini-tts`. 

import { type CreateSpeechRequestModelAnyOf; JSON = CreateSpeechRequestModelAnyOf } "./CreateSpeechRequestModelAnyOf";

// CreateSpeechRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateSpeechRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateSpeechRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateSpeechRequestModel = ?json;

        public func validate(_value : CreateSpeechRequestModel) : ?Text = null;
    }
}
