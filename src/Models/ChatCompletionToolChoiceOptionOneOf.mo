/// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools. 

// ChatCompletionToolChoiceOptionOneOf.mo
/// Enum values: #none_, #auto, #required

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionToolChoiceOptionOneOf = {
        #none_;
        #auto;
        #required;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionToolChoiceOptionOneOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionToolChoiceOptionOneOf) : JSON =
            switch (value) {
                case (#none_) "none";
                case (#auto) "auto";
                case (#required) "required";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionToolChoiceOptionOneOf =
            switch (json) {
                case "none" ?#none_;
                case "auto" ?#auto;
                case "required" ?#required;
                case _ null;
            };
    }
}
