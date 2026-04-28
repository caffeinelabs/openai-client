import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TranscriptionInclude.mo
/// Enum values: #logprobs

module {
    public type TranscriptionInclude = {
        #logprobs;
    };

    public module JSON {
        public func toCandidValue(value : TranscriptionInclude) : Candid.Candid =
            switch (value) {
                case (#logprobs) #Text("logprobs");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptionInclude =
            switch (candid) {
                case (#Text("logprobs")) ?#logprobs;
                case _ null;
            };

        public func toText(value : TranscriptionInclude) : Text =
            switch (value) {
                case (#logprobs) "logprobs";
            };
    };
};
