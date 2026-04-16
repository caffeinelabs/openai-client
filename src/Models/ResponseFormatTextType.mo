/// The type of response format being defined. Always `text`.

// ResponseFormatTextType.mo
/// Enum values: #text_

module {
    // User-facing type: type-safe variants for application code
    public type ResponseFormatTextType = {
        #text_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatTextType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatTextType) : JSON =
            switch (value) {
                case (#text_) "text";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatTextType =
            switch (json) {
                case "text" ?#text_;
                case _ null;
            };
    }
}
