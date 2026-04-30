/// Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// OpenAIFileStatus.mo
/// Enum values: #uploaded, #processed, #error_

module {
    public type OpenAIFileStatus = {
        #uploaded;
        #processed;
        #error_;
    };

    public module JSON {
        public func toCandidValue(value : OpenAIFileStatus) : Candid.Candid =
            switch (value) {
                case (#uploaded) #Text("uploaded");
                case (#processed) #Text("processed");
                case (#error_) #Text("error");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?OpenAIFileStatus =
            switch (candid) {
                case (#Text("uploaded")) ?#uploaded;
                case (#Text("processed")) ?#processed;
                case (#Text("error")) ?#error_;
                case _ null;
            };

        public func toText(value : OpenAIFileStatus) : Text =
            switch (value) {
                case (#uploaded) "uploaded";
                case (#processed) "processed";
                case (#error_) "error";
            };
    };
};
