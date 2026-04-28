/// The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateEmbeddingRequestEncodingFormat.mo
/// Enum values: #float_, #base64

module {
    public type CreateEmbeddingRequestEncodingFormat = {
        #float_;
        #base64;
    };

    public module JSON {
        public func toCandidValue(value : CreateEmbeddingRequestEncodingFormat) : Candid.Candid =
            switch (value) {
                case (#float_) #Text("float");
                case (#base64) #Text("base64");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingRequestEncodingFormat =
            switch (candid) {
                case (#Text("float")) ?#float_;
                case (#Text("base64")) ?#base64;
                case _ null;
            };

        public func toText(value : CreateEmbeddingRequestEncodingFormat) : Text =
            switch (value) {
                case (#float_) "float";
                case (#base64) "base64";
            };
    };
};
