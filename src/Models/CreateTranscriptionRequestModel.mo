/// ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1` (which is powered by our open source Whisper V2 model). 

import { type CreateTranscriptionRequestModelAnyOf; JSON = CreateTranscriptionRequestModelAnyOf } "./CreateTranscriptionRequestModelAnyOf";

// CreateTranscriptionRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateTranscriptionRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionRequestModel = ?json;
    }
}
