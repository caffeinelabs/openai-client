
import { type CreateSpeechRequestModel; JSON = CreateSpeechRequestModel } "./CreateSpeechRequestModel";

import { type CreateSpeechRequestResponseFormat; JSON = CreateSpeechRequestResponseFormat } "./CreateSpeechRequestResponseFormat";

import { type VoiceIdsShared; JSON = VoiceIdsShared } "./VoiceIdsShared";

// CreateSpeechRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateSpeechRequest = {
        model : CreateSpeechRequestModel;
        /// The text to generate audio for. The maximum length is 4096 characters.
        input : Text;
        /// Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
        instructions : ?Text;
        voice : VoiceIdsShared;
        response_format : ?CreateSpeechRequestResponseFormat;
        /// The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
        speed : ?Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateSpeechRequest type
        public type JSON = {
            model : CreateSpeechRequestModel;
            input : Text;
            instructions : ?Text;
            voice : VoiceIdsShared;
            response_format : ?CreateSpeechRequestResponseFormat.JSON;
            speed : ?Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateSpeechRequest) : JSON = { value with
            response_format = do ? { CreateSpeechRequestResponseFormat.toJSON(value.response_format!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateSpeechRequest {
            ?{ json with
                response_format = do ? { CreateSpeechRequestResponseFormat.fromJSON(json.response_format!)! };
            }
        };
    }
}
