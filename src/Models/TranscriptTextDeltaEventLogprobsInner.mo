
// TranscriptTextDeltaEventLogprobsInner.mo

module {
    // User-facing type: what application code uses
    public type TranscriptTextDeltaEventLogprobsInner = {
        /// The token that was used to generate the log probability. 
        token : ?Text;
        /// The log probability of the token. 
        logprob : ?Float;
        /// The bytes that were used to generate the log probability. 
        bytes : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptTextDeltaEventLogprobsInner type
        public type JSON = {
            token : ?Text;
            logprob : ?Float;
            bytes : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptTextDeltaEventLogprobsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptTextDeltaEventLogprobsInner = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : TranscriptTextDeltaEventLogprobsInner) : ?Text = null;
    }
}
