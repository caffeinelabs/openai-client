/// The type of the URL citation. Always `url_citation`.

// ChatCompletionResponseMessageAnnotationsInnerType.mo
/// Enum values: #url_citation

module {
    // User-facing type: type-safe variants for application code
    public type ChatCompletionResponseMessageAnnotationsInnerType = {
        #url_citation;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionResponseMessageAnnotationsInnerType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionResponseMessageAnnotationsInnerType) : JSON =
            switch (value) {
                case (#url_citation) "url_citation";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionResponseMessageAnnotationsInnerType =
            switch (json) {
                case "url_citation" ?#url_citation;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ChatCompletionResponseMessageAnnotationsInnerType) : ?Text = null;
    }
}
