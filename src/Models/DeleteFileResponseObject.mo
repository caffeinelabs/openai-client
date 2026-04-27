
// DeleteFileResponseObject.mo
/// Enum values: #file

module {
    // User-facing type: type-safe variants for application code
    public type DeleteFileResponseObject = {
        #file;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteFileResponseObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteFileResponseObject) : JSON =
            switch (value) {
                case (#file) "file";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteFileResponseObject =
            switch (json) {
                case "file" ?#file;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : DeleteFileResponseObject) : ?Text = null;
    }
}
