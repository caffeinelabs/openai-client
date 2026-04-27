/// The model to use for image generation. Only `dall-e-2` and `gpt-image-1` are supported. Defaults to `dall-e-2` unless a parameter specific to `gpt-image-1` is used.

import { type CreateImageEditRequestModelAnyOf; JSON = CreateImageEditRequestModelAnyOf } "./CreateImageEditRequestModelAnyOf";

// CreateImageEditRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateImageEditRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageEditRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageEditRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageEditRequestModel = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateImageEditRequestModel) : ?Text =
            ?"openapi-generator(motoko): CreateImageEditRequestModel has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `CreateImageEditRequestModel.JSON.toJSON` in your client to fix the wire format.";
    }
}
