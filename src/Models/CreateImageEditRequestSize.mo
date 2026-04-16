/// The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for `gpt-image-1`, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.

// CreateImageEditRequestSize.mo
/// Enum values: #_256x256, #_512x512, #_1024x1024, #_1536x1024, #_1024x1536, #auto

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageEditRequestSize = {
        #_256x256;
        #_512x512;
        #_1024x1024;
        #_1536x1024;
        #_1024x1536;
        #auto;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageEditRequestSize type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageEditRequestSize) : JSON =
            switch (value) {
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1024x1024) "1024x1024";
                case (#_1536x1024) "1536x1024";
                case (#_1024x1536) "1024x1536";
                case (#auto) "auto";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageEditRequestSize =
            switch (json) {
                case "256x256" ?#_256x256;
                case "512x512" ?#_512x512;
                case "1024x1024" ?#_1024x1024;
                case "1536x1024" ?#_1536x1024;
                case "1024x1536" ?#_1024x1536;
                case "auto" ?#auto;
                case _ null;
            };
    }
}
