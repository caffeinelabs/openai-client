/// One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd` or `gpt-4o-mini-tts`. 

import { type CreateSpeechRequestModelAnyOf; JSON = CreateSpeechRequestModelAnyOf } "./CreateSpeechRequestModelAnyOf";

// CreateSpeechRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateSpeechRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateSpeechRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateSpeechRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateSpeechRequestModel = ?json;
    }
}
