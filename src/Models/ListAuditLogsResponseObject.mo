
// ListAuditLogsResponseObject.mo
/// Enum values: #list

module {
    // User-facing type: type-safe variants for application code
    public type ListAuditLogsResponseObject = {
        #list;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAuditLogsResponseObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAuditLogsResponseObject) : JSON =
            switch (value) {
                case (#list) "list";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAuditLogsResponseObject =
            switch (json) {
                case "list" ?#list;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ListAuditLogsResponseObject) : ?Text = null;
    }
}
