/// **o-series models only**   Constrains effort on reasoning for  [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently supported values are `low`, `medium`, and `high`. Reducing reasoning effort can result in faster responses and fewer tokens used on reasoning in a response. 

// ReasoningEffort.mo
/// Enum values: #low, #medium, #high

module {
    // User-facing type: type-safe variants for application code
    public type ReasoningEffort = {
        #low;
        #medium;
        #high;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ReasoningEffort type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ReasoningEffort) : JSON =
            switch (value) {
                case (#low) "low";
                case (#medium) "medium";
                case (#high) "high";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ReasoningEffort =
            switch (json) {
                case "low" ?#low;
                case "medium" ?#medium;
                case "high" ?#high;
                case _ null;
            };
    }
}
