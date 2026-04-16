/// The quality of the image that will be generated. `high`, `medium` and `low` are only supported for `gpt-image-1`. `dall-e-2` only supports `standard` quality. Defaults to `auto`. 

// CreateImageEditRequestQuality.mo
/// Enum values: #standard, #low, #medium, #high, #auto

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageEditRequestQuality = {
        #standard;
        #low;
        #medium;
        #high;
        #auto;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageEditRequestQuality type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageEditRequestQuality) : JSON =
            switch (value) {
                case (#standard) "standard";
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
                case (#auto) "auto";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageEditRequestQuality =
            switch (json) {
                case "standard" ?#standard;
                case "low" ?#low;
                case "medium" ?#medium;
                case "high" ?#high;
                case "auto" ?#auto;
                case _ null;
            };
    }
}
