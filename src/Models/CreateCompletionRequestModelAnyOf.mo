
// CreateCompletionRequestModelAnyOf.mo
/// Enum values: #gpt_3_5_turbo_instruct, #davinci_002, #babbage_002

module {
    // User-facing type: type-safe variants for application code
    public type CreateCompletionRequestModelAnyOf = {
        #gpt_3_5_turbo_instruct;
        #davinci_002;
        #babbage_002;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionRequestModelAnyOf) : JSON =
            switch (value) {
                case (#gpt_3_5_turbo_instruct) "gpt-3.5-turbo-instruct";
                case (#davinci_002) "davinci-002";
                case (#babbage_002) "babbage-002";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionRequestModelAnyOf =
            switch (json) {
                case "gpt-3.5-turbo-instruct" ?#gpt_3_5_turbo_instruct;
                case "davinci-002" ?#davinci_002;
                case "babbage-002" ?#babbage_002;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateCompletionRequestModelAnyOf) : ?Text = null;
    }
}
