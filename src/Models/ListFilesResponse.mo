
import { type OpenAIFile; JSON = OpenAIFile } "./OpenAIFile";

// ListFilesResponse.mo

module {
    // User-facing type: what application code uses
    public type ListFilesResponse = {
        object_ : Text;
        data : [OpenAIFile];
        first_id : Text;
        last_id : Text;
        has_more : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListFilesResponse type
        public type JSON = {
            object_ : Text;
            data : [OpenAIFile];
            first_id : Text;
            last_id : Text;
            has_more : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListFilesResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListFilesResponse = ?json;
    }
}
