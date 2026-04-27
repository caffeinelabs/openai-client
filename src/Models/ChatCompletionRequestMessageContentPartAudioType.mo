/// The type of the content part. Always `input_audio`.

// ChatCompletionRequestMessageContentPartAudioType.mo
/// Enum values: #input_audio

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionRequestMessageContentPartAudioType = {
        #input_audio;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartAudioType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartAudioType) : JSON =
            switch (value) {
                case (#input_audio) "input_audio";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartAudioType =
            switch (json) {
                case "input_audio" ?#input_audio;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionRequestMessageContentPartAudioType) : ?Text = null;
    }
}
