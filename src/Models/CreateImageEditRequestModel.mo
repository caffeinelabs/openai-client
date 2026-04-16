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
    }
}
