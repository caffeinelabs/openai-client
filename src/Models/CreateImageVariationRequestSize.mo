/// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.

// CreateImageVariationRequestSize.mo
/// Enum values: #_256x256, #_512x512, #_1024x1024

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageVariationRequestSize = {
        #_256x256;
        #_512x512;
        #_1024x1024;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageVariationRequestSize type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageVariationRequestSize) : JSON =
            switch (value) {
                case (#_256x256) "256x256";
                case (#_512x512) "512x512";
                case (#_1024x1024) "1024x1024";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageVariationRequestSize =
            switch (json) {
                case "256x256" ?#_256x256;
                case "512x512" ?#_512x512;
                case "1024x1024" ?#_1024x1024;
                case _ null;
            };
    }
}
