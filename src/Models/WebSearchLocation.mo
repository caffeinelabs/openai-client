/// Approximate location parameters for the search.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebSearchLocation.mo

module {
    /// The required-fields slice of WebSearchLocation — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebSearchLocation as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        country : ?Text;
        region_ : ?Text;
        city : ?Text;
        timezone : ?Text;
    };

    public type WebSearchLocation = Required and Optional;

    public module JSON {
        // `init` constructs a WebSearchLocation from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebSearchLocation.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebSearchLocation {
            let ?res = from_candid(to_candid(required)) : ?WebSearchLocation else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebSearchLocation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.country) {
                case (?v__) List.add(buf, ("country", #Text(v__)));
                case null ();
            };
            switch (value.region_) {
                case (?v__) List.add(buf, ("region", #Text(v__)));
                case null ();
            };
            switch (value.city) {
                case (?v__) List.add(buf, ("city", #Text(v__)));
                case null ();
            };
            switch (value.timezone) {
                case (?v__) List.add(buf, ("timezone", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebSearchLocation =
            switch (candid) {
                case (#Record(fields)) {
                    let country : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country")) {
                        case (?country_field) ((switch (country_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let region_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "region")) {
                        case (?region__field) ((switch (region__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let city : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "city")) {
                        case (?city_field) ((switch (city_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let timezone : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "timezone")) {
                        case (?timezone_field) ((switch (timezone_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        country;
                        region_;
                        city;
                        timezone;
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
