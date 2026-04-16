/// The type of the event. Always `transcript.text.delta`. 

// TranscriptTextDeltaEventType.mo
/// Enum values: #transcript_text_delta

module {
    // User-facing type: type-safe variants for application code
    public type TranscriptTextDeltaEventType = {
        #transcript_text_delta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptTextDeltaEventType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptTextDeltaEventType) : JSON =
            switch (value) {
                case (#transcript_text_delta) "transcript.text.delta";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptTextDeltaEventType =
            switch (json) {
                case "transcript.text.delta" ?#transcript_text_delta;
                case _ null;
            };
    }
}
