
// CreateTranscriptionRequestModelAnyOf.mo
/// Enum values: #whisper_1, #gpt_4o_transcribe, #gpt_4o_mini_transcribe

module {
    // User-facing type: type-safe variants for application code
    public type CreateTranscriptionRequestModelAnyOf = {
        #whisper_1;
        #gpt_4o_transcribe;
        #gpt_4o_mini_transcribe;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionRequestModelAnyOf) : JSON =
            switch (value) {
                case (#whisper_1) "whisper-1";
                case (#gpt_4o_transcribe) "gpt-4o-transcribe";
                case (#gpt_4o_mini_transcribe) "gpt-4o-mini-transcribe";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionRequestModelAnyOf =
            switch (json) {
                case "whisper-1" ?#whisper_1;
                case "gpt-4o-transcribe" ?#gpt_4o_transcribe;
                case "gpt-4o-mini-transcribe" ?#gpt_4o_mini_transcribe;
                case _ null;
            };
    }
}
