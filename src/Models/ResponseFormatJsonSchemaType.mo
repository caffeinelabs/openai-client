/// The type of response format being defined. Always `json_schema`.

// ResponseFormatJsonSchemaType.mo
/// Enum values: #json_schema

module {
    // User-facing type: type-safe variants for application code
    public type ResponseFormatJsonSchemaType = {
        #json_schema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatJsonSchemaType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatJsonSchemaType) : JSON =
            switch (value) {
                case (#json_schema) "json_schema";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatJsonSchemaType =
            switch (json) {
                case "json_schema" ?#json_schema;
                case _ null;
            };
    }
}
