/// Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. Some models may also impose a limit on total number of tokens summed across inputs. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateEmbeddingRequestInput.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type CreateEmbeddingRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #one_of_2 : [Int];
        #_[Int] : [[Int]];
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateEmbeddingRequestInput) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#one_of_2(v)) Runtime.unreachable();
                case (#_[Int](v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateEmbeddingRequestInput) : Candid.Candid =
            switch (value) {
                case (#one_of_0(v)) #Variant(("one_of_0", Text.toCandidValue(v)));
                case (#one_of_1(v)) #Variant(("one_of_1", [Text].toCandidValue(v)));
                case (#one_of_2(v)) #Variant(("one_of_2", [Int].toCandidValue(v)));
                case (#_[Int](v)) #Variant(("_[Int]", [[Int]].toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingRequestInput =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("one_of_0") {
                            let ?inner = Text.fromCandidValue(tagAndVal.1) else return null;
                            ?#one_of_0(inner)
                        };
                        case ("one_of_1") {
                            let ?inner = [Text].fromCandidValue(tagAndVal.1) else return null;
                            ?#one_of_1(inner)
                        };
                        case ("one_of_2") {
                            let ?inner = [Int].fromCandidValue(tagAndVal.1) else return null;
                            ?#one_of_2(inner)
                        };
                        case ("_[Int]") {
                            let ?inner = [[Int]].fromCandidValue(tagAndVal.1) else return null;
                            ?#_[Int](inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
