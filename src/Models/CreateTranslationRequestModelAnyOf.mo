
// CreateTranslationRequestModelAnyOf.mo
/// Enum values: #whisper_1

module {
    // User-facing type: type-safe variants for application code
    public type CreateTranslationRequestModelAnyOf = {
        #whisper_1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateTranslationRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateTranslationRequestModelAnyOf) : JSON =
            switch (value) {
                case (#whisper_1) "whisper-1";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateTranslationRequestModelAnyOf =
            switch (json) {
                case "whisper-1" ?#whisper_1;
                case _ null;
            };
    }
}
