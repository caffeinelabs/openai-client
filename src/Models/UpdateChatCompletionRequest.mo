import { type Map } "mo:core/pure/Map";

// UpdateChatCompletionRequest.mo

module {
    // User-facing type: what application code uses
    public type UpdateChatCompletionRequest = {
        /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.   Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters. 
        metadata : Map<Text, Text>;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UpdateChatCompletionRequest type
        public type JSON = {
            metadata : Map<Text, Text>;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UpdateChatCompletionRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UpdateChatCompletionRequest = ?json;
    }
}
