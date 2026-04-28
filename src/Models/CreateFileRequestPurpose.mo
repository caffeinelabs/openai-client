/// The intended purpose of the uploaded file. One of: - `assistants`: Used in the Assistants API - `batch`: Used in the Batch API - `fine-tune`: Used for fine-tuning - `vision`: Images used for vision fine-tuning - `user_data`: Flexible file type for any purpose - `evals`: Used for eval data sets 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateFileRequestPurpose.mo
/// Enum values: #assistants, #batch, #fine_tune, #vision, #user_data, #evals

module {
    public type CreateFileRequestPurpose = {
        #assistants;
        #batch;
        #fine_tune;
        #vision;
        #user_data;
        #evals;
    };

    public module JSON {
        public func toCandidValue(value : CreateFileRequestPurpose) : Candid.Candid =
            switch (value) {
                case (#assistants) #Text("assistants");
                case (#batch) #Text("batch");
                case (#fine_tune) #Text("fine-tune");
                case (#vision) #Text("vision");
                case (#user_data) #Text("user_data");
                case (#evals) #Text("evals");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateFileRequestPurpose =
            switch (candid) {
                case (#Text("assistants")) ?#assistants;
                case (#Text("batch")) ?#batch;
                case (#Text("fine-tune")) ?#fine_tune;
                case (#Text("vision")) ?#vision;
                case (#Text("user_data")) ?#user_data;
                case (#Text("evals")) ?#evals;
                case _ null;
            };

        public func toText(value : CreateFileRequestPurpose) : Text =
            switch (value) {
                case (#assistants) "assistants";
                case (#batch) "batch";
                case (#fine_tune) "fine-tune";
                case (#vision) "vision";
                case (#user_data) "user_data";
                case (#evals) "evals";
            };
    };
};
