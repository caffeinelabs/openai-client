import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// DeleteFileResponseObject.mo
/// Enum values: #file

module {
    public type DeleteFileResponseObject = {
        #file;
    };

    public module JSON {
        public func toCandidValue(value : DeleteFileResponseObject) : Candid.Candid =
            switch (value) {
                case (#file) #Text("file");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteFileResponseObject =
            switch (candid) {
                case (#Text("file")) ?#file;
                case _ null;
            };

        public func toText(value : DeleteFileResponseObject) : Text =
            switch (value) {
                case (#file) "file";
            };
    };
};
