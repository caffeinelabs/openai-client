
import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

// CreateTranslationResponseVerboseJson.mo

module {
    // User-facing type: what application code uses
    public type CreateTranslationResponseVerboseJson = {
        /// The language of the output translation (always `english`).
        language : Text;
        /// The duration of the input audio.
        duration : Float;
        /// The translated text.
        text_ : Text;
        /// Segments of the translated text and their corresponding details.
        segments : ?[TranscriptionSegment];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranslationResponseVerboseJson type
        public type JSON = {
            language : Text;
            duration : Float;
            text_ : Text;
            segments : ?[TranscriptionSegment];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranslationResponseVerboseJson) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranslationResponseVerboseJson = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateTranslationResponseVerboseJson) : ?Text = null;
    }
}
