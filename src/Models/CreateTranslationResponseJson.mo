import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranslationResponseJson.mo

module {
    /// The required-fields slice of CreateTranslationResponseJson — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        text_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateTranslationResponseJson as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateTranslationResponseJson = Required and Optional;

    public module JSON {
        // `init` constructs a CreateTranslationResponseJson from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateTranslationResponseJson.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateTranslationResponseJson {
            let ?res = from_candid(to_candid(required)) : ?CreateTranslationResponseJson else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateTranslationResponseJson) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslationResponseJson =
            switch (candid) {
                case (#Record(fields)) {
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        text_;
                    };
                };
                case _ null;
            };
    };
};
