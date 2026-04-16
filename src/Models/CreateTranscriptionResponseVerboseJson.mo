/// Represents a verbose json transcription response returned by model, based on the provided input.

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

import { type TranscriptionWord; JSON = TranscriptionWord } "./TranscriptionWord";

// CreateTranscriptionResponseVerboseJson.mo

module {
    // User-facing type: what application code uses
    public type CreateTranscriptionResponseVerboseJson = {
        /// The language of the input audio.
        language : Text;
        /// The duration of the input audio.
        duration : Float;
        /// The transcribed text.
        text_ : Text;
        /// Extracted words and their corresponding timestamps.
        words : ?[TranscriptionWord];
        /// Segments of the transcribed text and their corresponding details.
        segments : ?[TranscriptionSegment];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionResponseVerboseJson type
        public type JSON = {
            language : Text;
            duration : Float;
            text_ : Text;
            words : ?[TranscriptionWord];
            segments : ?[TranscriptionSegment];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionResponseVerboseJson) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionResponseVerboseJson = ?json;
    }
}
