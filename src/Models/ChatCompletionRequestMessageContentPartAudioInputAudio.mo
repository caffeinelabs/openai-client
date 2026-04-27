
import { type ChatCompletionRequestMessageContentPartAudioInputAudioFormat; JSON = ChatCompletionRequestMessageContentPartAudioInputAudioFormat } "./ChatCompletionRequestMessageContentPartAudioInputAudioFormat";

// ChatCompletionRequestMessageContentPartAudioInputAudio.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartAudioInputAudio = {
        /// Base64 encoded audio data.
        data : Text;
        format : ChatCompletionRequestMessageContentPartAudioInputAudioFormat;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartAudioInputAudio type
        public type JSON = {
            data : Text;
            format : ChatCompletionRequestMessageContentPartAudioInputAudioFormat.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartAudioInputAudio) : JSON = { value with
            format = ChatCompletionRequestMessageContentPartAudioInputAudioFormat.toJSON(value.format);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartAudioInputAudio {
            let ?format = ChatCompletionRequestMessageContentPartAudioInputAudioFormat.fromJSON(json.format) else return null;
            ?{ json with
                format;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestMessageContentPartAudioInputAudio) : ?Text = null;
    }
}
