/// Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. Some models may also impose a limit on total number of tokens summed across inputs. 

// CreateEmbeddingRequestInput.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateEmbeddingRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #one_of_2 : [Int];
        #_[Int] : [[Int]];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateEmbeddingRequestInput) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#one_of_2(v)) Runtime.unreachable();
                case (#_[Int](v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateEmbeddingRequestInput type
        public type JSON = {
            #one_of_0 : Text;
            #one_of_1 : [Text];
            #one_of_2 : [Int];
            #_[Int] : [[Int]];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateEmbeddingRequestInput) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#one_of_1(v)) #one_of_1(v);
                case (#one_of_2(v)) #one_of_2(v);
                case (#_[Int](v)) #_[Int](v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequestInput =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#one_of_1(v)) ?#one_of_1(v);
                case (#one_of_2(v)) ?#one_of_2(v);
                case (#_[Int](v)) ?#_[Int](v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : CreateEmbeddingRequestInput) : ?Text = null;
    }
}
