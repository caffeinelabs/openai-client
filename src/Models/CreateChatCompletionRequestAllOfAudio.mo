/// Parameters for audio output. Required when audio output is requested with `modalities: [\"audio\"]`. [Learn more](/docs/guides/audio). 

import { type VoiceIdsShared; JSON = VoiceIdsShared } "./VoiceIdsShared";

// CreateChatCompletionRequestAllOfAudio.mo

module {
    // User-facing type: what application code uses
    public type CreateChatCompletionRequestAllOfAudio = {
        voice : VoiceIdsShared;
        /// Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`, or `pcm16`. 
        format : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionRequestAllOfAudio type
        public type JSON = {
            voice : VoiceIdsShared;
            format : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionRequestAllOfAudio) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionRequestAllOfAudio = ?json;
    }
}
