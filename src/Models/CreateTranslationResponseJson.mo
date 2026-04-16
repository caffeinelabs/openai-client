
// CreateTranslationResponseJson.mo

module {
    // User-facing type: what application code uses
    public type CreateTranslationResponseJson = {
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranslationResponseJson type
        public type JSON = {
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranslationResponseJson) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranslationResponseJson = ?json;
    }
}
