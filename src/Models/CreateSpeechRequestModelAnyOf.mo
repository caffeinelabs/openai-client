
// CreateSpeechRequestModelAnyOf.mo
/// Enum values: #tts_1, #tts_1_hd, #gpt_4o_mini_tts

module {
    // User-facing type: type-safe variants for application code
    public type CreateSpeechRequestModelAnyOf = {
        #tts_1;
        #tts_1_hd;
        #gpt_4o_mini_tts;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateSpeechRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateSpeechRequestModelAnyOf) : JSON =
            switch (value) {
                case (#tts_1) "tts-1";
                case (#tts_1_hd) "tts-1-hd";
                case (#gpt_4o_mini_tts) "gpt-4o-mini-tts";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateSpeechRequestModelAnyOf =
            switch (json) {
                case "tts-1" ?#tts_1;
                case "tts-1-hd" ?#tts_1_hd;
                case "gpt-4o-mini-tts" ?#gpt_4o_mini_tts;
                case _ null;
            };
    }
}
