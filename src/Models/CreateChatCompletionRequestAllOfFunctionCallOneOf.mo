/// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function. 

// CreateChatCompletionRequestAllOfFunctionCallOneOf.mo
/// Enum values: #none_, #auto

module {
    // User-facing type: type-safe variants for application code
    public type CreateChatCompletionRequestAllOfFunctionCallOneOf = {
        #none_;
        #auto;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionRequestAllOfFunctionCallOneOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionRequestAllOfFunctionCallOneOf) : JSON =
            switch (value) {
                case (#none_) "none";
                case (#auto) "auto";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionRequestAllOfFunctionCallOneOf =
            switch (json) {
                case "none" ?#none_;
                case "auto" ?#auto;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateChatCompletionRequestAllOfFunctionCallOneOf) : ?Text = null;
    }
}
