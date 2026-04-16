
// CreateTranscriptionRequestTimestampGranularitiesInner.mo
/// Enum values: #word, #segment

module {
    // User-facing type: type-safe variants for application code
    public type CreateTranscriptionRequestTimestampGranularitiesInner = {
        #word;
        #segment;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionRequestTimestampGranularitiesInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionRequestTimestampGranularitiesInner) : JSON =
            switch (value) {
                case (#word) "word";
                case (#segment) "segment";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionRequestTimestampGranularitiesInner =
            switch (json) {
                case "word" ?#word;
                case "segment" ?#segment;
                case _ null;
            };
    }
}
