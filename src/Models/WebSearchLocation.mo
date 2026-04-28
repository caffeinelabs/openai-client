/// Approximate location parameters for the search.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// WebSearchLocation.mo

module {
    public type WebSearchLocation = {
        /// The two-letter  [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`. 
        country : ?Text;
        /// Free text input for the region of the user, e.g. `California`. 
        region_ : ?Text;
        /// Free text input for the city of the user, e.g. `San Francisco`. 
        city : ?Text;
        /// The [IANA timezone](https://timeapi.io/documentation/iana-timezones)  of the user, e.g. `America/Los_Angeles`. 
        timezone : ?Text;
    };

    public module JSON {
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
};
