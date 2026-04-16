/// The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.

// CreateImageVariationRequestResponseFormat.mo
/// Enum values: #url, #b64_json

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageVariationRequestResponseFormat = {
        #url;
        #b64_json;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageVariationRequestResponseFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageVariationRequestResponseFormat) : JSON =
            switch (value) {
                case (#url) "url";
                case (#b64_json) "b64_json";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageVariationRequestResponseFormat =
            switch (json) {
                case "url" ?#url;
                case "b64_json" ?#b64_json;
                case _ null;
            };
    }
}
