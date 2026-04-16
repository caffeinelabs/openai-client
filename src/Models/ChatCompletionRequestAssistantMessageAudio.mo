/// Data about a previous audio response from the model.  [Learn more](/docs/guides/audio). 

// ChatCompletionRequestAssistantMessageAudio.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestAssistantMessageAudio = {
        /// Unique identifier for a previous audio response from the model. 
        id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestAssistantMessageAudio type
        public type JSON = {
            id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestAssistantMessageAudio) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestAssistantMessageAudio = ?json;
    }
}
