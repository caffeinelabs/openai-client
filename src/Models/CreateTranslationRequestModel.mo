/// ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available. 

import { type CreateTranslationRequestModelAnyOf; JSON = CreateTranslationRequestModelAnyOf } "./CreateTranslationRequestModelAnyOf";

// CreateTranslationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateTranslationRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateTranslationRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateTranslationRequestModel = ?json;

        public func validate(_value : CreateTranslationRequestModel) : ?Text = null;
    }
}
