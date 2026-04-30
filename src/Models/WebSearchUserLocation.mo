/// Approximate location parameters for the search. 

import { type WebSearchLocation; JSON = WebSearchLocation } "./WebSearchLocation";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebSearchUserLocation.mo

module {
    /// The required-fields slice of WebSearchUserLocation — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The type of location approximation. Always `approximate`. 
        type_ : Text;
        approximate : WebSearchLocation;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebSearchUserLocation as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type WebSearchUserLocation = Required and Optional;

    public module JSON {
        // `init` constructs a WebSearchUserLocation from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebSearchUserLocation.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebSearchUserLocation {
            let ?res = from_candid(to_candid(required)) : ?WebSearchUserLocation else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebSearchUserLocation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", #Text(value.type_)));
            List.add(buf, ("approximate", WebSearchLocation.toCandidValue(value.approximate)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebSearchUserLocation =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?approximate_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "approximate") else return null;
                    let ?approximate = (WebSearchLocation.fromCandidValue(approximate_field.1)) else return null;
                    ?{
                        type_;
                        approximate;
                    };
                };
                case _ null;
            };
    };
};
