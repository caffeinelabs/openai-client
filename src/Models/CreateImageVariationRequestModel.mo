/// The model to use for image generation. Only `dall-e-2` is supported at this time.

import { type CreateImageVariationRequestModelAnyOf; JSON = CreateImageVariationRequestModelAnyOf } "./CreateImageVariationRequestModelAnyOf";

// CreateImageVariationRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateImageVariationRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageVariationRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageVariationRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageVariationRequestModel = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateImageVariationRequestModel) : ?Text =
            ?"openapi-generator(motoko): CreateImageVariationRequestModel has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `CreateImageVariationRequestModel.JSON.toJSON` in your client to fix the wire format.";
    }
}
