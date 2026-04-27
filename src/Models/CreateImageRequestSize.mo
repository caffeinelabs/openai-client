/// The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for `gpt-image-1`, one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`, and one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3`.

// CreateImageRequestSize.mo
/// Enum values: #auto, #_1024x1024, #_1536x1024, #_1024x1536, #_256x256, #_512x512, #_1792x1024, #_1024x1792

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestSize = {
        #auto;
        #_1024x1024;
        #_1536x1024;
        #_1024x1536;
        #_256x256;
        #_512x512;
        #_1792x1024;
        #_1024x1792;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestSize type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestSize) : JSON =
            switch (value) {
                case (#auto) "auto";
                case (#_1024x1024) "1024x1024";
                case (#_1536x1024) "1536x1024";
                case (#_1024x1536) "1024x1536";
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1792x1024) "1792x1024";
                case (#_1024x1792) "1024x1792";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestSize =
            switch (json) {
                case "auto" ?#auto;
                case "1024x1024" ?#_1024x1024;
                case "1536x1024" ?#_1536x1024;
                case "1024x1536" ?#_1024x1536;
                case "256x256" ?#_256x256;
                case "512x512" ?#_512x512;
                case "1792x1024" ?#_1792x1024;
                case "1024x1792" ?#_1024x1792;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateImageRequestSize) : ?Text = null;
    }
}
