/// The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, or `vtt`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. 

// AudioResponseFormat.mo
/// Enum values: #json, #text_, #srt, #verbose_json, #vtt

module {
    // User-facing type: type-safe variants for application code
    public type AudioResponseFormat = {
        #json;
        #text_;
        #srt;
        #verbose_json;
        #vtt;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AudioResponseFormat type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AudioResponseFormat) : JSON =
            switch (value) {
                case (#json) "json";
                case (#text_) "text";
                case (#srt) "srt";
                case (#verbose_json) "verbose_json";
                case (#vtt) "vtt";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AudioResponseFormat =
            switch (json) {
                case "json" ?#json;
                case "text" ?#text_;
                case "srt" ?#srt;
                case "verbose_json" ?#verbose_json;
                case "vtt" ?#vtt;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : AudioResponseFormat) : ?Text = null;
    }
}
