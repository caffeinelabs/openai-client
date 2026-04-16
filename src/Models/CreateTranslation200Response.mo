
import { type CreateTranslationResponseJson; JSON = CreateTranslationResponseJson } "./CreateTranslationResponseJson";

import { type CreateTranslationResponseVerboseJson; JSON = CreateTranslationResponseVerboseJson } "./CreateTranslationResponseVerboseJson";

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

// CreateTranslation200Response.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateTranslation200Response = {
        #CreateTranslationResponseJson : CreateTranslationResponseJson;
        #CreateTranslationResponseVerboseJson : CreateTranslationResponseVerboseJson;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateTranslation200Response) : Text =
            switch (value) {
                case (#CreateTranslationResponseJson(v)) Runtime.unreachable();
                case (#CreateTranslationResponseVerboseJson(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranslation200Response type
        public type JSON = {
            #CreateTranslationResponseJson : CreateTranslationResponseJson;
            #CreateTranslationResponseVerboseJson : CreateTranslationResponseVerboseJson;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranslation200Response) : JSON =
            switch (value) {
                case (#CreateTranslationResponseJson(v)) #CreateTranslationResponseJson(v);
                case (#CreateTranslationResponseVerboseJson(v)) #CreateTranslationResponseVerboseJson(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranslation200Response =
            switch (json) {
                case (#CreateTranslationResponseJson(v)) ?#CreateTranslationResponseJson(v);
                case (#CreateTranslationResponseVerboseJson(v)) ?#CreateTranslationResponseVerboseJson(v);
            };
    }
}
