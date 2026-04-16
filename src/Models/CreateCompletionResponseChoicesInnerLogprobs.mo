import { type Map } "mo:core/pure/Map";

// CreateCompletionResponseChoicesInnerLogprobs.mo

module {
    // User-facing type: what application code uses
    public type CreateCompletionResponseChoicesInnerLogprobs = {
        text_offset : ?[Int];
        token_logprobs : ?[Float];
        tokens : ?[Text];
        top_logprobs : ?[Map<Text, Float>];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionResponseChoicesInnerLogprobs type
        public type JSON = {
            text_offset : ?[Int];
            token_logprobs : ?[Float];
            tokens : ?[Text];
            top_logprobs : ?[Map<Text, Float>];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionResponseChoicesInnerLogprobs) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionResponseChoicesInnerLogprobs = ?json;
    }
}
