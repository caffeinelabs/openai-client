/// The usage information for the request.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateEmbeddingResponseUsage.mo

module {
    /// The required-fields slice of CreateEmbeddingResponseUsage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The number of tokens used by the prompt.
        prompt_tokens : Int;
        /// The total number of tokens used by the request.
        total_tokens : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateEmbeddingResponseUsage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateEmbeddingResponseUsage = Required and Optional;

    public module JSON {
        // `init` constructs a CreateEmbeddingResponseUsage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateEmbeddingResponseUsage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateEmbeddingResponseUsage {
            let ?res = from_candid(to_candid(required)) : ?CreateEmbeddingResponseUsage else Runtime.unreachable();
            res
        };

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
                    let ?prompt_tokens = ((switch (prompt_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?total_tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_tokens") else return null;
                    let ?total_tokens = ((switch (total_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        prompt_tokens;
                        total_tokens;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
