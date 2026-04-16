
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
    }
}
