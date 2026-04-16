/// The format of the encoded audio data. Currently supports \"wav\" and \"mp3\". 

// ChatCompletionRequestMessageContentPartAudioInputAudioFormat.mo
/// Enum values: #wav, #mp3

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartAudioInputAudioFormat = {
        #wav;
        #mp3;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartAudioInputAudioFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartAudioInputAudioFormat) : JSON =
            switch (value) {
                case (#wav) "wav";
                case (#mp3) "mp3";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartAudioInputAudioFormat =
            switch (json) {
                case "wav" ?#wav;
                case "mp3" ?#mp3;
                case _ null;
            };
    }
}
