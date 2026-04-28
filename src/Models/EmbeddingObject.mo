/// The object type, which is always \"embedding\".
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// EmbeddingObject.mo
/// Enum values: #embedding

module {
    public type EmbeddingObject = {
        #embedding;
    };

    public module JSON {
        public func toCandidValue(value : EmbeddingObject) : Candid.Candid =
            switch (value) {
                case (#embedding) #Text("embedding");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?EmbeddingObject =
            switch (candid) {
                case (#Text("embedding")) ?#embedding;
                case _ null;
            };

        public func toText(value : EmbeddingObject) : Text =
            switch (value) {
                case (#embedding) "embedding";
            };
    };
};
