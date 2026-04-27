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

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateSpeechRequestModel) : ?Text =
            ?"openapi-generator(motoko): CreateSpeechRequestModel has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `CreateSpeechRequestModel.JSON.toJSON` in your client to fix the wire format.";
    }
}
