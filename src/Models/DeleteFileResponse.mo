
import { type DeleteFileResponseObject; JSON = DeleteFileResponseObject } "./DeleteFileResponseObject";

// DeleteFileResponse.mo

module {
    // User-facing type: what application code uses
    public type DeleteFileResponse = {
        id : Text;
        object_ : DeleteFileResponseObject;
        deleted : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteFileResponse type
        public type JSON = {
            id : Text;
            object_ : DeleteFileResponseObject.JSON;
            deleted : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteFileResponse) : JSON = { value with
            object_ = DeleteFileResponseObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteFileResponse {
            let ?object_ = DeleteFileResponseObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };
    }
}
