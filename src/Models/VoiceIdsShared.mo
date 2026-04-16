
import { type VoiceIdsSharedAnyOf; JSON = VoiceIdsSharedAnyOf } "./VoiceIdsSharedAnyOf";

// VoiceIdsShared.mo

module {
    // User-facing type: what application code uses
    public type VoiceIdsShared = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer VoiceIdsShared type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : VoiceIdsShared) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?VoiceIdsShared = ?json;
    }
}
