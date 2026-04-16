/// The role of the messages author, in this case `developer`.

// ChatCompletionRequestDeveloperMessageRole.mo
/// Enum values: #developer

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestDeveloperMessageRole = {
        #developer;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestDeveloperMessageRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestDeveloperMessageRole) : JSON =
            switch (value) {
                case (#developer) "developer";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestDeveloperMessageRole =
            switch (json) {
                case "developer" ?#developer;
                case _ null;
            };
    }
}
