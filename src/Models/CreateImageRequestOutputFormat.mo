/// The format in which the generated images are returned. This parameter is only supported for `gpt-image-1`. Must be one of `png`, `jpeg`, or `webp`.

// CreateImageRequestOutputFormat.mo
/// Enum values: #png, #jpeg, #webp

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestOutputFormat = {
        #png;
        #jpeg;
        #webp;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestOutputFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestOutputFormat) : JSON =
            switch (value) {
                case (#png) "png";
                case (#jpeg) "jpeg";
                case (#webp) "webp";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestOutputFormat =
            switch (json) {
                case "png" ?#png;
                case "jpeg" ?#jpeg;
                case "webp" ?#webp;
                case _ null;
            };
    }
}
