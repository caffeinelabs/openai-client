/// Approximate location parameters for the search.

// WebSearchLocation.mo

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebSearchLocation type
        public type JSON = {
            country : ?Text;
            region_ : ?Text;
            city : ?Text;
            timezone : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebSearchLocation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebSearchLocation = ?json;
    }
}
