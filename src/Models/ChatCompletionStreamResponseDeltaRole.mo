/// The role of the author of this message.

// ChatCompletionStreamResponseDeltaRole.mo
/// Enum values: #developer, #system_, #user, #assistant, #tool

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionStreamResponseDeltaRole = {
        #developer;
        #system_;
        #user;
        #assistant;
        #tool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionStreamResponseDeltaRole type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionStreamResponseDeltaRole) : JSON =
            switch (value) {
                case (#developer) "developer";
                case (#system_) "system";
                case (#user) "user";
                case (#assistant) "assistant";
                case (#tool) "tool";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionStreamResponseDeltaRole =
            switch (json) {
                case "developer" ?#developer;
                case "system" ?#system_;
                case "user" ?#user;
                case "assistant" ?#assistant;
                case "tool" ?#tool;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionStreamResponseDeltaRole) : ?Text = null;
    }
}
