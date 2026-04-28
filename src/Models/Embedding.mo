/// Represents an embedding vector returned by embedding endpoint. 

import { type EmbeddingObject; JSON = EmbeddingObject } "./EmbeddingObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Embedding.mo

module {
    public type Embedding = {
        /// The index of the embedding in the list of embeddings.
        index : Int;
        /// The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](/docs/guides/embeddings). 
        embedding : [Float];
        object_ : EmbeddingObject;
    };

    public module JSON {
        public func toCandidValue(value : Embedding) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("index", #Int(value.index)));
            List.add(buf, ("embedding", #Array(Array.map<Float, Candid.Candid>(value.embedding, func(f : Float) : Candid.Candid = #Float(f)))));
            List.add(buf, ("object", EmbeddingObject.toCandidValue(value.object_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Embedding =
            switch (candid) {
                case (#Record(fields)) {
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?embedding_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "embedding") else return null;
                    let ?embedding = ((switch (embedding_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let ?f__ = (switch (c__) { case (#Float(g)) ?g; case (#Int(j)) ?Float.fromInt(j); case (#Nat(k)) ?Float.fromInt(k); case _ null }) else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (EmbeddingObject.fromCandidValue(object__field.1)) else return null;
                    ?{
                        index;
                        embedding;
                        object_;
                    };
                };
                case _ null;
            };
    };
};
