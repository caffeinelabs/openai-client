
// TranscriptionWord.mo

module {
    // User-facing type: what application code uses
    public type TranscriptionWord = {
        /// The text content of the word.
        word : Text;
        /// Start time of the word in seconds.
        start : Float;
        /// End time of the word in seconds.
        end : Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptionWord type
        public type JSON = {
            word : Text;
            start : Float;
            end : Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptionWord) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptionWord = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : TranscriptionWord) : ?Text = null;
    }
}
