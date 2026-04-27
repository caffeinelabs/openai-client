/// The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.

// CreateSpeechRequestResponseFormat.mo
/// Enum values: #mp3, #opus, #aac, #flac, #wav, #pcm

module {
    // User-facing type: type-safe variants for application code
    public type CreateSpeechRequestResponseFormat = {
        #mp3;
        #opus;
        #aac;
        #flac;
        #wav;
        #pcm;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateSpeechRequestResponseFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateSpeechRequestResponseFormat) : JSON =
            switch (value) {
                case (#mp3) "mp3";
                case (#opus) "opus";
                case (#aac) "aac";
                case (#flac) "flac";
                case (#wav) "wav";
                case (#pcm) "pcm";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateSpeechRequestResponseFormat =
            switch (json) {
                case "mp3" ?#mp3;
                case "opus" ?#opus;
                case "aac" ?#aac;
                case "flac" ?#flac;
                case "wav" ?#wav;
                case "pcm" ?#pcm;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateSpeechRequestResponseFormat) : ?Text = null;
    }
}
