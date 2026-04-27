
import { type TranscriptTextDeltaEvent; JSON = TranscriptTextDeltaEvent } "./TranscriptTextDeltaEvent";

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDoneEvent; JSON = TranscriptTextDoneEvent } "./TranscriptTextDoneEvent";

import { type TranscriptTextDoneEventType; JSON = TranscriptTextDoneEventType } "./TranscriptTextDoneEventType";

// CreateTranscriptionResponseStreamEvent.mo

module {
    // User-facing type: what application code uses
    public type CreateTranscriptionResponseStreamEvent = {
        type_ : TranscriptTextDoneEventType;
        /// The text delta that was additionally transcribed. 
        delta : Text;
        /// The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`. 
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
        /// The text that was transcribed. 
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionResponseStreamEvent type
        public type JSON = {
            type_ : TranscriptTextDoneEventType.JSON;
            delta : Text;
            logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionResponseStreamEvent) : JSON = { value with
            type_ = TranscriptTextDoneEventType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionResponseStreamEvent {
            let ?type_ = TranscriptTextDoneEventType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateTranscriptionResponseStreamEvent) : ?Text = null;
    }
}
