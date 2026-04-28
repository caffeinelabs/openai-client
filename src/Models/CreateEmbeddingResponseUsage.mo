/// The usage information for the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateEmbeddingResponseUsage.mo

module {
    public type CreateEmbeddingResponseUsage = {
        /// The number of tokens used by the prompt.
        prompt_tokens : Int;
        /// The total number of tokens used by the request.
        total_tokens : Int;
    };

    public module JSON {
        public func toCandidValue(value : CreateEmbeddingResponseUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("prompt_tokens", #Int(value.prompt_tokens)));
            List.add(buf, ("total_tokens", #Int(value.total_tokens)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingResponseUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?prompt_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prompt_tokens") else return null;
                    let ?prompt_tokens = ((switch (prompt_tokens_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let ?total_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_tokens") else return null;
                    let ?total_tokens = ((switch (total_tokens_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    ?{
                        prompt_tokens;
                        total_tokens;
                    };
                };
                case _ null;
            };
    };
};
