
// CreateEmbeddingRequestModelAnyOf.mo
/// Enum values: #text_embedding_ada_002, #text_embedding_3_small, #text_embedding_3_large

module {
    // User-facing type: type-safe variants for application code
    public type CreateEmbeddingRequestModelAnyOf = {
        #text_embedding_ada_002;
        #text_embedding_3_small;
        #text_embedding_3_large;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingRequestModelAnyOf) : JSON =
            switch (value) {
                case (#text_embedding_ada_002) "text-embedding-ada-002";
                case (#text_embedding_3_small) "text-embedding-3-small";
                case (#text_embedding_3_large) "text-embedding-3-large";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequestModelAnyOf =
            switch (json) {
                case "text-embedding-ada-002" ?#text_embedding_ada_002;
                case "text-embedding-3-small" ?#text_embedding_3_small;
                case "text-embedding-3-large" ?#text_embedding_3_large;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateEmbeddingRequestModelAnyOf) : ?Text = null;
    }
}
