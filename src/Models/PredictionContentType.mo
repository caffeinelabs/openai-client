/// The type of the predicted content you want to provide. This type is currently always `content`. 

// PredictionContentType.mo
/// Enum values: #content

module {
    // User-facing type: type-safe variants for application code
    public type PredictionContentType = {
        #content;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PredictionContentType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PredictionContentType) : JSON =
            switch (value) {
                case (#content) "content";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PredictionContentType =
            switch (json) {
                case "content" ?#content;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : PredictionContentType) : ?Text = null;
    }
}
