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

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateTranslationRequestModel) : ?Text =
            ?"openapi-generator(motoko): CreateTranslationRequestModel has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `CreateTranslationRequestModel.JSON.toJSON` in your client to fix the wire format.";
    }
}
