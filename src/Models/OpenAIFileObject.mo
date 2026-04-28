/// The object type, which is always `file`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// OpenAIFileObject.mo
/// Enum values: #file

module {
    public type OpenAIFileObject = {
        #file;
    };

    public module JSON {
        public func toCandidValue(value : OpenAIFileObject) : Candid.Candid =
            switch (value) {
                case (#file) #Text("file");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?OpenAIFileObject =
            switch (candid) {
                case (#Text("file")) ?#file;
                case _ null;
            };

        public func toText(value : OpenAIFileObject) : Text =
            switch (value) {
                case (#file) "file";
            };
    };
};
