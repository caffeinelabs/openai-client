/// The style of the generated images. This parameter is only supported for `dall-e-3`. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images.

// CreateImageRequestStyle.mo
/// Enum values: #vivid, #natural

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestStyle = {
        #vivid;
        #natural;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestStyle type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestStyle) : JSON =
            switch (value) {
                case (#vivid) "vivid";
                case (#natural) "natural";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestStyle =
            switch (json) {
                case "vivid" ?#vivid;
                case "natural" ?#natural;
                case _ null;
            };
    }
}
