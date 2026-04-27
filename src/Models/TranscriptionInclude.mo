
// TranscriptionInclude.mo
/// Enum values: #logprobs

module {
    // User-facing type: type-safe variants for application code
    public type TranscriptionInclude = {
        #logprobs;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptionInclude type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptionInclude) : JSON =
            switch (value) {
                case (#logprobs) "logprobs";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptionInclude =
            switch (json) {
                case "logprobs" ?#logprobs;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : TranscriptionInclude) : ?Text = null;
    }
}
