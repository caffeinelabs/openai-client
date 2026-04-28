/// The intended purpose of the file. Supported values are `assistants`, `assistants_output`, `batch`, `batch_output`, `fine-tune`, `fine-tune-results` and `vision`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// OpenAIFilePurpose.mo
/// Enum values: #assistants, #assistants_output, #batch, #batch_output, #fine_tune, #fine_tune_results, #vision

module {
    public type OpenAIFilePurpose = {
        #assistants;
        #assistants_output;
        #batch;
        #batch_output;
        #fine_tune;
        #fine_tune_results;
        #vision;
    };

    public module JSON {
        public func toCandidValue(value : OpenAIFilePurpose) : Candid.Candid =
            switch (value) {
                case (#assistants) #Text("assistants");
                case (#assistants_output) #Text("assistants_output");
                case (#batch) #Text("batch");
                case (#batch_output) #Text("batch_output");
                case (#fine_tune) #Text("fine-tune");
                case (#fine_tune_results) #Text("fine-tune-results");
                case (#vision) #Text("vision");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?OpenAIFilePurpose =
            switch (candid) {
                case (#Text("assistants")) ?#assistants;
                case (#Text("assistants_output")) ?#assistants_output;
                case (#Text("batch")) ?#batch;
                case (#Text("batch_output")) ?#batch_output;
                case (#Text("fine-tune")) ?#fine_tune;
                case (#Text("fine-tune-results")) ?#fine_tune_results;
                case (#Text("vision")) ?#vision;
                case _ null;
            };

        public func toText(value : OpenAIFilePurpose) : Text =
            switch (value) {
                case (#assistants) "assistants";
                case (#assistants_output) "assistants_output";
                case (#batch) "batch";
                case (#batch_output) "batch_output";
                case (#fine_tune) "fine-tune";
                case (#fine_tune_results) "fine-tune-results";
                case (#vision) "vision";
            };
    };
};
