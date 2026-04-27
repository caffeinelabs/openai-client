
import { type CreateEmbeddingRequestEncodingFormat; JSON = CreateEmbeddingRequestEncodingFormat } "./CreateEmbeddingRequestEncodingFormat";

import { type CreateEmbeddingRequestInput; JSON = CreateEmbeddingRequestInput } "./CreateEmbeddingRequestInput";

import { type CreateEmbeddingRequestModel; JSON = CreateEmbeddingRequestModel } "./CreateEmbeddingRequestModel";

import Int "mo:core/Int";

// CreateEmbeddingRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateEmbeddingRequest = {
        input : CreateEmbeddingRequestInput;
        model : CreateEmbeddingRequestModel;
        encoding_format : ?CreateEmbeddingRequestEncodingFormat;
        /// The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models. 
        dimensions : ?Nat;
        /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids). 
        user : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingRequest type
        public type JSON = {
            input : CreateEmbeddingRequestInput;
            model : CreateEmbeddingRequestModel;
            encoding_format : ?CreateEmbeddingRequestEncodingFormat.JSON;
            dimensions : ?Int;
            user : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingRequest) : JSON = { value with
            encoding_format = do ? { CreateEmbeddingRequestEncodingFormat.toJSON(value.encoding_format!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequest {
            ?{ json with
                encoding_format = do ? { CreateEmbeddingRequestEncodingFormat.fromJSON(json.encoding_format!)! };
                dimensions = switch (json.dimensions) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateEmbeddingRequest) : ?Text = null;
    }
}
