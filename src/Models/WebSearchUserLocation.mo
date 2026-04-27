/// Approximate location parameters for the search. 

import { type WebSearchLocation; JSON = WebSearchLocation } "./WebSearchLocation";

// WebSearchUserLocation.mo

module {
    // User-facing type: what application code uses
    public type WebSearchUserLocation = {
        /// The type of location approximation. Always `approximate`. 
        type_ : Text;
        approximate : WebSearchLocation;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebSearchUserLocation type
        public type JSON = {
            type_ : Text;
            approximate : WebSearchLocation;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebSearchUserLocation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebSearchUserLocation = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : WebSearchUserLocation) : ?Text = null;
    }
}
