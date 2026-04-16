
// CreateTranscriptionResponseJsonLogprobsInner.mo

module {
    // User-facing type: what application code uses
    public type CreateTranscriptionResponseJsonLogprobsInner = {
        /// The token in the transcription.
        token : ?Text;
        /// The log probability of the token.
        logprob : ?Float;
        /// The bytes of the token.
        bytes : ?[Float];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionResponseJsonLogprobsInner type
        public type JSON = {
            token : ?Text;
            logprob : ?Float;
            bytes : ?[Float];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionResponseJsonLogprobsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionResponseJsonLogprobsInner = ?json;
    }
}
