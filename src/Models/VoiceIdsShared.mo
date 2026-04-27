
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

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : VoiceIdsShared) : ?Text =
            ?"openapi-generator(motoko): VoiceIdsShared has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `VoiceIdsShared.JSON.toJSON` in your client to fix the wire format.";
    }
}
