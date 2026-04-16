/// The type of this object. It is always set to \"list\". 

// ChatCompletionListObject.mo
/// Enum values: #list

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionListObject = {
        #list;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionListObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionListObject) : JSON =
            switch (value) {
                case (#list) "list";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionListObject =
            switch (json) {
                case "list" ?#list;
                case _ null;
            };
    }
}
