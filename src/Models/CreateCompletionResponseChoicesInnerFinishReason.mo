/// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, or `content_filter` if content was omitted due to a flag from our content filters. 

// CreateCompletionResponseChoicesInnerFinishReason.mo
/// Enum values: #stop, #length, #content_filter

module {
    // User-facing type: type-safe variants for application code
    public type CreateCompletionResponseChoicesInnerFinishReason = {
        #stop;
        #length;
        #content_filter;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionResponseChoicesInnerFinishReason type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionResponseChoicesInnerFinishReason) : JSON =
            switch (value) {
                case (#stop) "stop";
                case (#length) "length";
                case (#content_filter) "content_filter";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionResponseChoicesInnerFinishReason =
            switch (json) {
                case "stop" ?#stop;
                case "length" ?#length;
                case "content_filter" ?#content_filter;
                case _ null;
            };
    }
}
