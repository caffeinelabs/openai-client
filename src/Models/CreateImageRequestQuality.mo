/// The quality of the image that will be generated.   - `auto` (default value) will automatically select the best quality for the given model. - `high`, `medium` and `low` are supported for `gpt-image-1`. - `hd` and `standard` are supported for `dall-e-3`. - `standard` is the only option for `dall-e-2`. 

// CreateImageRequestQuality.mo
/// Enum values: #standard, #hd, #low, #medium, #high, #auto

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestQuality = {
        #standard;
        #hd;
        #low;
        #medium;
        #high;
        #auto;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestQuality type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestQuality) : JSON =
            switch (value) {
                case (#standard) "standard";
                case (#hd) "hd";
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
                case (#auto) "auto";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestQuality =
            switch (json) {
                case "standard" ?#standard;
                case "hd" ?#hd;
                case "low" ?#low;
                case "medium" ?#medium;
                case "high" ?#high;
                case "auto" ?#auto;
                case _ null;
            };
    }
}
