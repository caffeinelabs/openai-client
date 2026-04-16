/// The format in which generated images with `dall-e-2` and `dall-e-3` are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter isn't supported for `gpt-image-1` which will always return base64-encoded images.

// CreateImageRequestResponseFormat.mo
/// Enum values: #url, #b64_json

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestResponseFormat = {
        #url;
        #b64_json;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestResponseFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestResponseFormat) : JSON =
            switch (value) {
                case (#url) "url";
                case (#b64_json) "b64_json";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestResponseFormat =
            switch (json) {
                case "url" ?#url;
                case "b64_json" ?#b64_json;
                case _ null;
            };
    }
}
