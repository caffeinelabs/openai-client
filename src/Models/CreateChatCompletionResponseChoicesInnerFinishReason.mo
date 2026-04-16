/// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, `content_filter` if content was omitted due to a flag from our content filters, `tool_calls` if the model called a tool, or `function_call` (deprecated) if the model called a function. 

// CreateChatCompletionResponseChoicesInnerFinishReason.mo
/// Enum values: #stop, #length, #tool_calls, #content_filter, #function_call

module {
    // User-facing type: type-safe variants for application code
    public type CreateChatCompletionResponseChoicesInnerFinishReason = {
        #stop;
        #length;
        #tool_calls;
        #content_filter;
        #function_call;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionResponseChoicesInnerFinishReason type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionResponseChoicesInnerFinishReason) : JSON =
            switch (value) {
                case (#stop) "stop";
                case (#length) "length";
                case (#tool_calls) "tool_calls";
                case (#content_filter) "content_filter";
                case (#function_call) "function_call";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionResponseChoicesInnerFinishReason =
            switch (json) {
                case "stop" ?#stop;
                case "length" ?#length;
                case "tool_calls" ?#tool_calls;
                case "content_filter" ?#content_filter;
                case "function_call" ?#function_call;
                case _ null;
            };
    }
}
