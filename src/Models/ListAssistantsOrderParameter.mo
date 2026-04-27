
// ListAssistantsOrderParameter.mo
/// Enum values: #asc, #desc

module {
    // User-facing type: type-safe variants for application code
    public type ListAssistantsOrderParameter = {
        #asc;
        #desc;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAssistantsOrderParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAssistantsOrderParameter) : JSON =
            switch (value) {
                case (#asc) "asc";
                case (#desc) "desc";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAssistantsOrderParameter =
            switch (json) {
                case "asc" ?#asc;
                case "desc" ?#desc;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ListAssistantsOrderParameter) : ?Text = null;
    }
}
