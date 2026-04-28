import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranscriptionRequestTimestampGranularitiesInner.mo
/// Enum values: #word, #segment

module {
    public type CreateTranscriptionRequestTimestampGranularitiesInner = {
        #word;
        #segment;
    };

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionRequestTimestampGranularitiesInner) : Candid.Candid =
            switch (value) {
                case (#word) #Text("word");
                case (#segment) #Text("segment");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionRequestTimestampGranularitiesInner =
            switch (candid) {
                case (#Text("word")) ?#word;
                case (#Text("segment")) ?#segment;
                case _ null;
            };

        public func toText(value : CreateTranscriptionRequestTimestampGranularitiesInner) : Text =
            switch (value) {
                case (#word) "word";
                case (#segment) "segment";
            };
    };
};
