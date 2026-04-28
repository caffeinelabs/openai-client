/// The object type, which is always \"list\".
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateEmbeddingResponseObject.mo
/// Enum values: #list

module {
    public type CreateEmbeddingResponseObject = {
        #list;
    };

    public module JSON {
        public func toCandidValue(value : CreateEmbeddingResponseObject) : Candid.Candid =
            switch (value) {
                case (#list) #Text("list");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingResponseObject =
            switch (candid) {
                case (#Text("list")) ?#list;
                case _ null;
            };

        public func toText(value : CreateEmbeddingResponseObject) : Text =
            switch (value) {
                case (#list) "list";
            };
    };
};
