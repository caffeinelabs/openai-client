/// The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).

// CreateEmbeddingRequestEncodingFormat.mo
/// Enum values: #float_, #base64

module {
    // User-facing type: type-safe variants for application code
    public type CreateEmbeddingRequestEncodingFormat = {
        #float_;
        #base64;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingRequestEncodingFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingRequestEncodingFormat) : JSON =
            switch (value) {
                case (#float_) "float";
                case (#base64) "base64";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequestEncodingFormat =
            switch (json) {
                case "float" ?#float_;
                case "base64" ?#base64;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateEmbeddingRequestEncodingFormat) : ?Text = null;
    }
}
