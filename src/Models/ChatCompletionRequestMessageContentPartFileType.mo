/// The type of the content part. Always `file`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartFileType.mo
/// Enum values: #file

module {
    public type ChatCompletionRequestMessageContentPartFileType = {
        #file;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartFileType) : Candid.Candid =
            switch (value) {
                case (#file) #Text("file");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartFileType =
            switch (candid) {
                case (#Text("file")) ?#file;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartFileType) : Text =
            switch (value) {
                case (#file) "file";
            };
    };
};
