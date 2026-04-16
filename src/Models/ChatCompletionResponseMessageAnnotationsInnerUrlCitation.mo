/// A URL citation when using web search.

// ChatCompletionResponseMessageAnnotationsInnerUrlCitation.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionResponseMessageAnnotationsInnerUrlCitation = {
        /// The index of the last character of the URL citation in the message.
        end_index : Int;
        /// The index of the first character of the URL citation in the message.
        start_index : Int;
        /// The URL of the web resource.
        url : Text;
        /// The title of the web resource.
        title : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionResponseMessageAnnotationsInnerUrlCitation type
        public type JSON = {
            end_index : Int;
            start_index : Int;
            url : Text;
            title : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionResponseMessageAnnotationsInnerUrlCitation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionResponseMessageAnnotationsInnerUrlCitation = ?json;
    }
}
