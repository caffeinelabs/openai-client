
// CreateImageVariationRequestModelAnyOf.mo
/// Enum values: #dall_e_2

module {
    // User-facing type: type-safe variants for application code
    public type CreateImageVariationRequestModelAnyOf = {
        #dall_e_2;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageVariationRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageVariationRequestModelAnyOf) : JSON =
            switch (value) {
                case (#dall_e_2) "dall-e-2";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageVariationRequestModelAnyOf =
            switch (json) {
                case "dall-e-2" ?#dall_e_2;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateImageVariationRequestModelAnyOf) : ?Text = null;
    }
}
