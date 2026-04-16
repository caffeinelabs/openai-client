/// Represents a transcription response returned by model, based on the provided input.

import { type CreateTranscriptionResponseJsonLogprobsInner; JSON = CreateTranscriptionResponseJsonLogprobsInner } "./CreateTranscriptionResponseJsonLogprobsInner";

// CreateTranscriptionResponseJson.mo

module {
    // User-facing type: what application code uses
    public type CreateTranscriptionResponseJson = {
        /// The transcribed text.
        text_ : Text;
        /// The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array. 
        logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscriptionResponseJson type
        public type JSON = {
            text_ : Text;
            logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscriptionResponseJson) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscriptionResponseJson = ?json;
    }
}
