/// The type of response format being defined. Always `json_object`.

// ResponseFormatJsonObjectType.mo
/// Enum values: #json_object

module {
    // User-facing type: type-safe variants for application code
    public type ResponseFormatJsonObjectType = {
        #json_object;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatJsonObjectType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatJsonObjectType) : JSON =
            switch (value) {
                case (#json_object) "json_object";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatJsonObjectType =
            switch (json) {
                case "json_object" ?#json_object;
                case _ null;
            };
    }
}
