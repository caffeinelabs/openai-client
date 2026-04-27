
import { type CreateTranscriptionResponseJson; JSON = CreateTranscriptionResponseJson } "./CreateTranscriptionResponseJson";

import { type CreateTranscriptionResponseJsonLogprobsInner; JSON = CreateTranscriptionResponseJsonLogprobsInner } "./CreateTranscriptionResponseJsonLogprobsInner";

import { type CreateTranscriptionResponseVerboseJson; JSON = CreateTranscriptionResponseVerboseJson } "./CreateTranscriptionResponseVerboseJson";

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

import { type TranscriptionWord; JSON = TranscriptionWord } "./TranscriptionWord";

// CreateTranscription200Response.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateTranscription200Response = {
        #CreateTranscriptionResponseJson : CreateTranscriptionResponseJson;
        #CreateTranscriptionResponseVerboseJson : CreateTranscriptionResponseVerboseJson;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateTranscription200Response) : Text =
            switch (value) {
                case (#CreateTranscriptionResponseJson(v)) Runtime.unreachable();
                case (#CreateTranscriptionResponseVerboseJson(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranscription200Response type
        public type JSON = {
            #CreateTranscriptionResponseJson : CreateTranscriptionResponseJson;
            #CreateTranscriptionResponseVerboseJson : CreateTranscriptionResponseVerboseJson;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranscription200Response) : JSON =
            switch (value) {
                case (#CreateTranscriptionResponseJson(v)) #CreateTranscriptionResponseJson(v);
                case (#CreateTranscriptionResponseVerboseJson(v)) #CreateTranscriptionResponseVerboseJson(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranscription200Response =
            switch (json) {
                case (#CreateTranscriptionResponseJson(v)) ?#CreateTranscriptionResponseJson(v);
                case (#CreateTranscriptionResponseVerboseJson(v)) ?#CreateTranscriptionResponseVerboseJson(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : CreateTranscription200Response) : ?Text = null;
    }
}
