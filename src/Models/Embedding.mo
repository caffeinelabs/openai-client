/// Represents an embedding vector returned by embedding endpoint. 

import { type EmbeddingObject; JSON = EmbeddingObject } "./EmbeddingObject";

// Embedding.mo

module {
    // User-facing type: what application code uses
    public type Embedding = {
        /// The index of the embedding in the list of embeddings.
        index : Int;
        /// The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](/docs/guides/embeddings). 
        embedding : [Float];
        object_ : EmbeddingObject;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Embedding type
        public type JSON = {
            index : Int;
            embedding : [Float];
            object_ : EmbeddingObject.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Embedding) : JSON = { value with
            object_ = EmbeddingObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Embedding {
            let ?object_ = EmbeddingObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : Embedding) : ?Text = null;
    }
}
