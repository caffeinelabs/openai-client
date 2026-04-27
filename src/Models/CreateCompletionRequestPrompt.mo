/// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.  Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document. 

// CreateCompletionRequestPrompt.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateCompletionRequestPrompt = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #one_of_2 : [Int];
        #_[Int] : [[Int]];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateCompletionRequestPrompt) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#one_of_2(v)) Runtime.unreachable();
                case (#_[Int](v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateCompletionRequestPrompt type
        public type JSON = {
            #one_of_0 : Text;
            #one_of_1 : [Text];
            #one_of_2 : [Int];
            #_[Int] : [[Int]];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateCompletionRequestPrompt) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#one_of_1(v)) #one_of_1(v);
                case (#one_of_2(v)) #one_of_2(v);
                case (#_[Int](v)) #_[Int](v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateCompletionRequestPrompt =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#one_of_1(v)) ?#one_of_1(v);
                case (#one_of_2(v)) ?#one_of_2(v);
                case (#_[Int](v)) ?#_[Int](v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : CreateCompletionRequestPrompt) : ?Text = null;
    }
}
