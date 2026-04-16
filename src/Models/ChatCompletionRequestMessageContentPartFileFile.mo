
// ChatCompletionRequestMessageContentPartFileFile.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartFileFile = {
        /// The name of the file, used when passing the file to the model as a  string. 
        filename : ?Text;
        /// The base64 encoded file data, used when passing the file to the model  as a string. 
        file_data : ?Text;
        /// The ID of an uploaded file to use as input. 
        file_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartFileFile type
        public type JSON = {
            filename : ?Text;
            file_data : ?Text;
            file_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartFileFile) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartFileFile = ?json;
    }
}
