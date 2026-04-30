/// This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](/docs/guides/tools-web-search?api-mode=chat). 

import { type WebSearchContextSize; JSON = WebSearchContextSize } "./WebSearchContextSize";

import { type WebSearchUserLocation; JSON = WebSearchUserLocation } "./WebSearchUserLocation";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebSearch.mo

module {
    /// The required-fields slice of WebSearch — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express WebSearch as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        user_location : ?WebSearchUserLocation;
        search_context_size : ?WebSearchContextSize;
    };

    public type WebSearch = Required and Optional;

    public module JSON {
        // `init` constructs a WebSearch from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebSearch.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : WebSearch {
            let ?res = from_candid(to_candid(required)) : ?WebSearch else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebSearch) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.user_location) {
                case (?v__) List.add(buf, ("user_location", WebSearchUserLocation.toCandidValue(v__)));
                case null ();
            };
            switch (value.search_context_size) {
                case (?v__) List.add(buf, ("search_context_size", WebSearchContextSize.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebSearch =
            switch (candid) {
                case (#Record(fields)) {
                    let user_location : ?WebSearchUserLocation = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_location")) {
                        case (?user_location_field) (WebSearchUserLocation.fromCandidValue(user_location_field.1));
                        case null null;
                    };
                    let search_context_size : ?WebSearchContextSize = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "search_context_size")) {
                        case (?search_context_size_field) (WebSearchContextSize.fromCandidValue(search_context_size_field.1));
                        case null null;
                    };
                    ?{
                        user_location;
                        search_context_size;
                    };
                };
                case _ null;
            };
    };
};
