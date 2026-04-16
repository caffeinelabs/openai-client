/// Always `image_url`.

// CreateModerationRequestInputOneOfInnerOneOfType.mo
/// Enum values: #image_url

module {
    // User-facing type: type-safe variants for application code
    public type CreateModerationRequestInputOneOfInnerOneOfType = {
        #image_url;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInnerOneOfType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInnerOneOfType) : JSON =
            switch (value) {
                case (#image_url) "image_url";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInnerOneOfType =
            switch (json) {
                case "image_url" ?#image_url;
                case _ null;
            };
    }
}
