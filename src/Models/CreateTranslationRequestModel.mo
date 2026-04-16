/// ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available. 

import { type CreateTranslationRequestModelAnyOf; JSON = CreateTranslationRequestModelAnyOf } "./CreateTranslationRequestModelAnyOf";

// CreateTranslationRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateTranslationRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranslationRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranslationRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranslationRequestModel = ?json;
    }
}
