/// The intended purpose of the file. Supported values are `assistants`, `assistants_output`, `batch`, `batch_output`, `fine-tune`, `fine-tune-results` and `vision`.

// OpenAIFilePurpose.mo
/// Enum values: #assistants, #assistants_output, #batch, #batch_output, #fine_tune, #fine_tune_results, #vision

module {
    // User-facing type: type-safe variants for application code
    public type OpenAIFilePurpose = {
        #assistants;
        #assistants_output;
        #batch;
        #batch_output;
        #fine_tune;
        #fine_tune_results;
        #vision;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer OpenAIFilePurpose type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : OpenAIFilePurpose) : JSON =
            switch (value) {
                case (#assistants) "assistants";
                case (#assistants_output) "assistants_output";
                case (#batch) "batch";
                case (#batch_output) "batch_output";
                case (#fine_tune) "fine-tune";
                case (#fine_tune_results) "fine-tune-results";
                case (#vision) "vision";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?OpenAIFilePurpose =
            switch (json) {
                case "assistants" ?#assistants;
                case "assistants_output" ?#assistants_output;
                case "batch" ?#batch;
                case "batch_output" ?#batch_output;
                case "fine-tune" ?#fine_tune;
                case "fine-tune-results" ?#fine_tune_results;
                case "vision" ?#vision;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : OpenAIFilePurpose) : ?Text = null;
    }
}
