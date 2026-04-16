/// Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDeltaEventType; JSON = TranscriptTextDeltaEventType } "./TranscriptTextDeltaEventType";

// TranscriptTextDeltaEvent.mo

module {
    // User-facing type: what application code uses
    public type TranscriptTextDeltaEvent = {
        type_ : TranscriptTextDeltaEventType;
        /// The text delta that was additionally transcribed. 
        delta : Text;
        /// The log probabilities of the delta. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`. 
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TranscriptTextDeltaEvent type
        public type JSON = {
            type_ : TranscriptTextDeltaEventType.JSON;
            delta : Text;
            logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TranscriptTextDeltaEvent) : JSON = { value with
            type_ = TranscriptTextDeltaEventType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TranscriptTextDeltaEvent {
            let ?type_ = TranscriptTextDeltaEventType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
