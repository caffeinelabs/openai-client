
// DeleteModelResponse.mo

module {
    // User-facing type: what application code uses
    public type DeleteModelResponse = {
        id : Text;
        deleted : Bool;
        object_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteModelResponse type
        public type JSON = {
            id : Text;
            deleted : Bool;
            object_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteModelResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteModelResponse = ?json;
    }
}
