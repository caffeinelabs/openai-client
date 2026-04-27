/// ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1` (which is powered by our open source Whisper V2 model). 

import { type CreateTranscriptionRequestModelAnyOf; JSON = CreateTranscriptionRequestModelAnyOf } "./CreateTranscriptionRequestModelAnyOf";

// CreateTranscriptionRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateTranscriptionRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateTranscriptionRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateTranscriptionRequestModel = ?json;

        public func validate(_value : CreateTranscriptionRequestModel) : ?Text = null;
    }
}
