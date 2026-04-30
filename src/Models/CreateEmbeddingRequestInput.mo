/// Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. Some models may also impose a limit on total number of tokens summed across inputs. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateEmbeddingRequestInput.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type CreateEmbeddingRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #one_of_2 : [Int];
        #_Int_ : [[Int]];
    };

    public module JSON {
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf<string,array,array,array>.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : CreateEmbeddingRequestInput) : Text = Runtime.unreachable();

        public func toCandidValue(_value : CreateEmbeddingRequestInput) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?CreateEmbeddingRequestInput = Runtime.unreachable();
    };
};
