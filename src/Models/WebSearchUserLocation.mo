/// Approximate location parameters for the search. 

import { type WebSearchLocation; JSON = WebSearchLocation } "./WebSearchLocation";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// WebSearchUserLocation.mo

module {
    public type WebSearchUserLocation = {
        /// The type of location approximation. Always `approximate`. 
        type_ : Text;
        approximate : WebSearchLocation;
    };

    public module JSON {
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
