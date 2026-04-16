/// Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDoneEventType; JSON = TranscriptTextDoneEventType } "./TranscriptTextDoneEventType";

// TranscriptTextDoneEvent.mo

module {
    // User-facing type: what application code uses
    public type TranscriptTextDoneEvent = {
        type_ : TranscriptTextDoneEventType;
        /// The text that was transcribed. 
        text_ : Text;
        /// The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`. 
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptTextDoneEvent type
        public type JSON = {
            type_ : TranscriptTextDoneEventType.JSON;
            text_ : Text;
            logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptTextDoneEvent) : JSON = { value with
            type_ = TranscriptTextDoneEventType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptTextDoneEvent {
            let ?type_ = TranscriptTextDoneEventType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
