/// Options for streaming response. Only set this when you set `stream: true`. 

// ChatCompletionStreamOptions.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionStreamOptions = {
        /// If set, an additional chunk will be streamed before the `data: [DONE]` message. The `usage` field on this chunk shows the token usage statistics for the entire request, and the `choices` field will always be an empty array.   All other chunks will also include a `usage` field, but with a null value. **NOTE:** If the stream is interrupted, you may not receive the final usage chunk which contains the total token usage for the request. 
        include_usage : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionStreamOptions type
        public type JSON = {
            include_usage : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionStreamOptions) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionStreamOptions = ?json;
    }
}
