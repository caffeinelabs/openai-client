
// CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.mo
/// Enum values: #text_, #image

module {
    // User-facing type: type-safe variants for application code
    public type CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner = {
        #text_;
        #image;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner) : JSON =
            switch (value) {
                case (#text_) "text";
                case (#image) "image";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner =
            switch (json) {
                case "text" ?#text_;
                case "image" ?#image;
                case _ null;
            };
    }
}
