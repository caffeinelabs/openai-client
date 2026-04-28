import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateEmbeddingRequestModelAnyOf.mo
/// Enum values: #text_embedding_ada_002, #text_embedding_3_small, #text_embedding_3_large

module {
    public type CreateEmbeddingRequestModelAnyOf = {
        #text_embedding_ada_002;
        #text_embedding_3_small;
        #text_embedding_3_large;
    };

    public module JSON {
        public func toCandidValue(value : CreateEmbeddingRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#text_embedding_ada_002) #Text("text-embedding-ada-002");
                case (#text_embedding_3_small) #Text("text-embedding-3-small");
                case (#text_embedding_3_large) #Text("text-embedding-3-large");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingRequestModelAnyOf =
            switch (candid) {
                case (#Text("text-embedding-ada-002")) ?#text_embedding_ada_002;
                case (#Text("text-embedding-3-small")) ?#text_embedding_3_small;
                case (#Text("text-embedding-3-large")) ?#text_embedding_3_large;
                case _ null;
            };

        public func toText(value : CreateEmbeddingRequestModelAnyOf) : Text =
            switch (value) {
                case (#text_embedding_ada_002) "text-embedding-ada-002";
                case (#text_embedding_3_small) "text-embedding-3-small";
                case (#text_embedding_3_large) "text-embedding-3-large";
            };
    };
};
