/// The role of the messages author, in this case `system`.

// ChatCompletionRequestSystemMessageRole.mo
/// Enum values: #system_

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestSystemMessageRole = {
        #system_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestSystemMessageRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestSystemMessageRole) : JSON =
            switch (value) {
                case (#system_) "system";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestSystemMessageRole =
            switch (json) {
                case "system" ?#system_;
                case _ null;
            };
    }
}
