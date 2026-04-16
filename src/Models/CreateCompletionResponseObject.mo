/// The object type, which is always \"text_completion\"

// CreateCompletionResponseObject.mo
/// Enum values: #text_completion

module {
    // User-facing type: type-safe variants for application code
    public type CreateCompletionResponseObject = {
        #text_completion;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionResponseObject type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionResponseObject) : JSON =
            switch (value) {
                case (#text_completion) "text_completion";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionResponseObject =
            switch (json) {
                case "text_completion" ?#text_completion;
                case _ null;
            };
    }
}
