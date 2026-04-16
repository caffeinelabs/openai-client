
// ChatCompletionModalitiesInner.mo
/// Enum values: #text_, #audio

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionModalitiesInner = {
        #text_;
        #audio;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionModalitiesInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionModalitiesInner) : JSON =
            switch (value) {
                case (#text_) "text";
                case (#audio) "audio";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionModalitiesInner =
            switch (json) {
                case "text" ?#text_;
                case "audio" ?#audio;
                case _ null;
            };
    }
}
