/// Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.

// OpenAIFileStatus.mo
/// Enum values: #uploaded, #processed, #error_

module {
    // User-facing type: type-safe variants for application code
    public type OpenAIFileStatus = {
        #uploaded;
        #processed;
        #error_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer OpenAIFileStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : OpenAIFileStatus) : JSON =
            switch (value) {
                case (#uploaded) "uploaded";
                case (#processed) "processed";
                case (#error_) "error";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?OpenAIFileStatus =
            switch (json) {
                case "uploaded" ?#uploaded;
                case "processed" ?#processed;
                case "error" ?#error_;
                case _ null;
            };
    }
}
