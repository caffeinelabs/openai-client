/// The object type, which is always \"model\".

// ModelObject.mo
/// Enum values: #model

module {
    // User-facing type: type-safe variants for application code
    public type ModelObject = {
        #model;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ModelObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ModelObject) : JSON =
            switch (value) {
                case (#model) "model";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ModelObject =
            switch (json) {
                case "model" ?#model;
                case _ null;
            };
    }
}
