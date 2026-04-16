/// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them. 

import { type CreateEmbeddingRequestModelAnyOf; JSON = CreateEmbeddingRequestModelAnyOf } "./CreateEmbeddingRequestModelAnyOf";

// CreateEmbeddingRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateEmbeddingRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequestModel = ?json;
    }
}
