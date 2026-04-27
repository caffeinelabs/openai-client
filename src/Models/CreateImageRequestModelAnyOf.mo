
// CreateImageRequestModelAnyOf.mo
/// Enum values: #dall_e_2, #dall_e_3, #gpt_image_1

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageRequestModelAnyOf = {
        #dall_e_2;
        #dall_e_3;
        #gpt_image_1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequestModelAnyOf) : JSON =
            switch (value) {
                case (#dall_e_2) "dall-e-2";
                case (#dall_e_3) "dall-e-3";
                case (#gpt_image_1) "gpt-image-1";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequestModelAnyOf =
            switch (json) {
                case "dall-e-2" ?#dall_e_2;
                case "dall-e-3" ?#dall_e_3;
                case "gpt-image-1" ?#gpt_image_1;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateImageRequestModelAnyOf) : ?Text = null;
    }
}
