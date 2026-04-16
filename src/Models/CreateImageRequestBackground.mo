/// Allows to set transparency for the background of the generated image(s).  This parameter is only supported for `gpt-image-1`. Must be one of  `transparent`, `opaque` or `auto` (default value). When `auto` is used, the  model will automatically determine the best background for the image.  If `transparent`, the output format needs to support transparency, so it  should be set to either `png` (default value) or `webp`. 

// CreateImageRequestBackground.mo
/// Enum values: #transparent, #opaque, #auto

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestBackground = {
        #transparent;
        #opaque;
        #auto;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestBackground type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestBackground) : JSON =
            switch (value) {
                case (#transparent) "transparent";
                case (#opaque) "opaque";
                case (#auto) "auto";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestBackground =
            switch (json) {
                case "transparent" ?#transparent;
                case "opaque" ?#opaque;
                case "auto" ?#auto;
                case _ null;
            };
    }
}
