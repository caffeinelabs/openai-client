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
    }
}
