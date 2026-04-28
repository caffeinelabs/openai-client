/// The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.  Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateCompletionRequestPrompt.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type CreateCompletionRequestPrompt = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #one_of_2 : [Int];
        #_[Int] : [[Int]];
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateCompletionRequestPrompt) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#one_of_2(v)) Runtime.unreachable();
                case (#_[Int](v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateCompletionRequestPrompt) : Candid.Candid =
            switch (value) {
                case (#one_of_0(v)) #Variant(("one_of_0", Text.toCandidValue(v)));
                case (#one_of_1(v)) #Variant(("one_of_1", [Text].toCandidValue(v)));
                case (#one_of_2(v)) #Variant(("one_of_2", [Int].toCandidValue(v)));
                case (#_[Int](v)) #Variant(("_[Int]", [[Int]].toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionRequestPrompt =
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
