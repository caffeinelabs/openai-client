/// Represents if a given text input is potentially harmful.

import { type CreateModerationResponseResultsInner; JSON = CreateModerationResponseResultsInner } "./CreateModerationResponseResultsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponse.mo

module {
    /// The required-fields slice of CreateModerationResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The unique identifier for the moderation request.
        id : Text;
        /// The model used to generate the moderation results.
        model : Text;
        /// A list of moderation objects.
        results : [CreateModerationResponseResultsInner];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateModerationResponse = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationResponse {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("model", #Text(value.model)));
            List.add(buf, ("results", #Array(Array.map<CreateModerationResponseResultsInner, Candid.Candid>(value.results, CreateModerationResponseResultsInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = ((switch (model_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?results_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "results") else return null;
                    let ?results = ((switch (results_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateModerationResponseResultsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        id;
                        model;
                        results;
                    };
                };
                case _ null;
            };
    };
};
