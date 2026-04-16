/// The object type, which is always \"embedding\".

// EmbeddingObject.mo
/// Enum values: #embedding

module {
    // User-facing type: type-safe variants for application code
    public type EmbeddingObject = {
        #embedding;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EmbeddingObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EmbeddingObject) : JSON =
            switch (value) {
                case (#embedding) "embedding";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EmbeddingObject =
            switch (json) {
                case "embedding" ?#embedding;
                case _ null;
            };
    }
}
