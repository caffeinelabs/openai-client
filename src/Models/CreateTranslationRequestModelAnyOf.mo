import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranslationRequestModelAnyOf.mo
/// Enum values: #whisper_1

module {
    public type CreateTranslationRequestModelAnyOf = {
        #whisper_1;
    };

    public module JSON {
        public func toCandidValue(value : CreateTranslationRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#whisper_1) #Text("whisper-1");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslationRequestModelAnyOf =
            switch (candid) {
                case (#Text("whisper-1")) ?#whisper_1;
                case _ null;
            };

        public func toText(value : CreateTranslationRequestModelAnyOf) : Text =
            switch (value) {
                case (#whisper_1) "whisper-1";
            };
    };
};
