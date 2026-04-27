
// TranscriptionSegment.mo

module {
    // User-facing type: what application code uses
    public type TranscriptionSegment = {
        /// Unique identifier of the segment.
        id : Int;
        /// Seek offset of the segment.
        seek : Int;
        /// Start time of the segment in seconds.
        start : Float;
        /// End time of the segment in seconds.
        end : Float;
        /// Text content of the segment.
        text_ : Text;
        /// Array of token IDs for the text content.
        tokens : [Int];
        /// Temperature parameter used for generating the segment.
        temperature : Float;
        /// Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
        avg_logprob : Float;
        /// Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
        compression_ratio : Float;
        /// Probability of no speech in the segment. If the value is higher than 1.0 and the `avg_logprob` is below -1, consider this segment silent.
        no_speech_prob : Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptionSegment type
        public type JSON = {
            id : Int;
            seek : Int;
            start : Float;
            end : Float;
            text_ : Text;
            tokens : [Int];
            temperature : Float;
            avg_logprob : Float;
            compression_ratio : Float;
            no_speech_prob : Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptionSegment) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptionSegment = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : TranscriptionSegment) : ?Text = null;
    }
}
