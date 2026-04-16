/// Always `text`.

// CreateModerationRequestInputOneOfInnerOneOf1Type.mo
/// Enum values: #text_

module {
    // User-facing type: type-safe variants for application code
    public type CreateModerationRequestInputOneOfInnerOneOf1Type = {
        #text_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInnerOneOf1Type type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInnerOneOf1Type) : JSON =
            switch (value) {
                case (#text_) "text";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInnerOneOf1Type =
            switch (json) {
                case "text" ?#text_;
                case _ null;
            };
    }
}
