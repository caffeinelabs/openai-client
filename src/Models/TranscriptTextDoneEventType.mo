/// The type of the event. Always `transcript.text.done`. 

// TranscriptTextDoneEventType.mo
/// Enum values: #transcript_text_done

module {
    // User-facing type: type-safe variants for application code
    public type TranscriptTextDoneEventType = {
        #transcript_text_done;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptTextDoneEventType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptTextDoneEventType) : JSON =
            switch (value) {
                case (#transcript_text_done) "transcript.text.done";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptTextDoneEventType =
            switch (json) {
                case "transcript.text.done" ?#transcript_text_done;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : TranscriptTextDoneEventType) : ?Text = null;
    }
}
