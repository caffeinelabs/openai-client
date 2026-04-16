/// Learn about [audio inputs](/docs/guides/audio). 

import { type ChatCompletionRequestMessageContentPartAudioInputAudio; JSON = ChatCompletionRequestMessageContentPartAudioInputAudio } "./ChatCompletionRequestMessageContentPartAudioInputAudio";

import { type ChatCompletionRequestMessageContentPartAudioType; JSON = ChatCompletionRequestMessageContentPartAudioType } "./ChatCompletionRequestMessageContentPartAudioType";

// ChatCompletionRequestMessageContentPartAudio.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartAudio = {
        type_ : ChatCompletionRequestMessageContentPartAudioType;
        input_audio : ChatCompletionRequestMessageContentPartAudioInputAudio;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartAudio type
        public type JSON = {
            type_ : ChatCompletionRequestMessageContentPartAudioType.JSON;
            input_audio : ChatCompletionRequestMessageContentPartAudioInputAudio.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartAudio) : JSON = {
            type_ = ChatCompletionRequestMessageContentPartAudioType.toJSON(value.type_);
            input_audio = ChatCompletionRequestMessageContentPartAudioInputAudio.toJSON(value.input_audio);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartAudio {
            let ?type_ = ChatCompletionRequestMessageContentPartAudioType.fromJSON(json.type_) else return null;
            let ?input_audio = ChatCompletionRequestMessageContentPartAudioInputAudio.fromJSON(json.input_audio) else return null;
            ?{
                type_;
                input_audio;
            }
        };
    }
}
