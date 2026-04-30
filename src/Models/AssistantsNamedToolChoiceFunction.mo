import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AssistantsNamedToolChoiceFunction.mo

module {
    /// The required-fields slice of AssistantsNamedToolChoiceFunction — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The name of the function to call.
        name : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express AssistantsNamedToolChoiceFunction as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type AssistantsNamedToolChoiceFunction = Required and Optional;

    public module JSON {
        // `init` constructs a AssistantsNamedToolChoiceFunction from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AssistantsNamedToolChoiceFunction.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : AssistantsNamedToolChoiceFunction {
            let ?res = from_candid(to_candid(required)) : ?AssistantsNamedToolChoiceFunction else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AssistantsNamedToolChoiceFunction) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AssistantsNamedToolChoiceFunction =
            switch (candid) {
                case (#Record(fields)) {
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        name;
                    };
                };
                case _ null;
            };
    };
};
