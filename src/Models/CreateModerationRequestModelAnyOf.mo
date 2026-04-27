
// CreateModerationRequestModelAnyOf.mo
/// Enum values: #omni_moderation_latest, #omni_moderation_2024_09_26, #text_moderation_latest, #text_moderation_stable

module {
    // User-facing type: type-safe variants for application code
    public type CreateModerationRequestModelAnyOf = {
        #omni_moderation_latest;
        #omni_moderation_2024_09_26;
        #text_moderation_latest;
        #text_moderation_stable;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestModelAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestModelAnyOf) : JSON =
            switch (value) {
                case (#omni_moderation_latest) "omni-moderation-latest";
                case (#omni_moderation_2024_09_26) "omni-moderation-2024-09-26";
                case (#text_moderation_latest) "text-moderation-latest";
                case (#text_moderation_stable) "text-moderation-stable";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestModelAnyOf =
            switch (json) {
                case "omni-moderation-latest" ?#omni_moderation_latest;
                case "omni-moderation-2024-09-26" ?#omni_moderation_2024_09_26;
                case "text-moderation-latest" ?#text_moderation_latest;
                case "text-moderation-stable" ?#text_moderation_stable;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : CreateModerationRequestModelAnyOf) : ?Text = null;
    }
}
