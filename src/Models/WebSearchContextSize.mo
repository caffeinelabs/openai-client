/// High level guidance for the amount of context window space to use for the  search. One of `low`, `medium`, or `high`. `medium` is the default. 

// WebSearchContextSize.mo
/// Enum values: #low, #medium, #high

module {
    // User-facing type: type-safe variants for application code
    public type WebSearchContextSize = {
        #low;
        #medium;
        #high;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebSearchContextSize type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebSearchContextSize) : JSON =
            switch (value) {
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebSearchContextSize =
            switch (json) {
                case "low" ?#low;
                case "medium" ?#medium;
                case "high" ?#high;
                case _ null;
            };
    }
}
