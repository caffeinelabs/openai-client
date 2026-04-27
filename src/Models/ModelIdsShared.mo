
import { type ModelIdsSharedAnyOf; JSON = ModelIdsSharedAnyOf } "./ModelIdsSharedAnyOf";

// ModelIdsShared.mo

module {
    // User-facing type: what application code uses
    public type ModelIdsShared = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ModelIdsShared type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ModelIdsShared) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ModelIdsShared = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ModelIdsShared) : ?Text =
            ?"openapi-generator(motoko): ModelIdsShared has no synthesisable JSON form (likely a oneOf<string, …> the codegen could not tag). Override the type or `ModelIdsShared.JSON.toJSON` in your client to fix the wire format.";
    }
}
