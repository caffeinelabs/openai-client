/// The intended purpose of the uploaded file. One of: - `assistants`: Used in the Assistants API - `batch`: Used in the Batch API - `fine-tune`: Used for fine-tuning - `vision`: Images used for vision fine-tuning - `user_data`: Flexible file type for any purpose - `evals`: Used for eval data sets 

// CreateFileRequestPurpose.mo
/// Enum values: #assistants, #batch, #fine_tune, #vision, #user_data, #evals

module {
    // User-facing type: type-safe variants for application code
    public type CreateFileRequestPurpose = {
        #assistants;
        #batch;
        #fine_tune;
        #vision;
        #user_data;
        #evals;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateFileRequestPurpose type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateFileRequestPurpose) : JSON =
            switch (value) {
                case (#assistants) "assistants";
                case (#batch) "batch";
                case (#fine_tune) "fine-tune";
                case (#vision) "vision";
                case (#user_data) "user_data";
                case (#evals) "evals";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateFileRequestPurpose =
            switch (json) {
                case "assistants" ?#assistants;
                case "batch" ?#batch;
                case "fine-tune" ?#fine_tune;
                case "vision" ?#vision;
                case "user_data" ?#user_data;
                case "evals" ?#evals;
                case _ null;
            };
    }
}
