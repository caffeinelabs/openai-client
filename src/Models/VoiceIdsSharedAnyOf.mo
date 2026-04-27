
// VoiceIdsSharedAnyOf.mo
/// Enum values: #alloy, #ash, #ballad, #coral, #echo, #fable, #onyx, #nova, #sage, #shimmer, #verse

module {
    // User-facing type: type-safe variants for application code
    public type VoiceIdsSharedAnyOf = {
        #alloy;
        #ash;
        #ballad;
        #coral;
        #echo;
        #fable;
        #onyx;
        #nova;
        #sage;
        #shimmer;
        #verse;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer VoiceIdsSharedAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : VoiceIdsSharedAnyOf) : JSON =
            switch (value) {
                case (#alloy) "alloy";
                case (#ash) "ash";
                case (#ballad) "ballad";
                case (#coral) "coral";
                case (#echo) "echo";
                case (#fable) "fable";
                case (#onyx) "onyx";
                case (#nova) "nova";
                case (#sage) "sage";
                case (#shimmer) "shimmer";
                case (#verse) "verse";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?VoiceIdsSharedAnyOf =
            switch (json) {
                case "alloy" ?#alloy;
                case "ash" ?#ash;
                case "ballad" ?#ballad;
                case "coral" ?#coral;
                case "echo" ?#echo;
                case "fable" ?#fable;
                case "onyx" ?#onyx;
                case "nova" ?#nova;
                case "sage" ?#sage;
                case "shimmer" ?#shimmer;
                case "verse" ?#verse;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : VoiceIdsSharedAnyOf) : ?Text = null;
    }
}
