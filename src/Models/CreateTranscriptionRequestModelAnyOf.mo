import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranscriptionRequestModelAnyOf.mo
/// Enum values: #whisper_1, #gpt_4o_transcribe, #gpt_4o_mini_transcribe

module {
    public type CreateTranscriptionRequestModelAnyOf = {
        #whisper_1;
        #gpt_4o_transcribe;
        #gpt_4o_mini_transcribe;
    };

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#whisper_1) #Text("whisper-1");
                case (#gpt_4o_transcribe) #Text("gpt-4o-transcribe");
                case (#gpt_4o_mini_transcribe) #Text("gpt-4o-mini-transcribe");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionRequestModelAnyOf =
            switch (candid) {
                case (#Text("whisper-1")) ?#whisper_1;
                case (#Text("gpt-4o-transcribe")) ?#gpt_4o_transcribe;
                case (#Text("gpt-4o-mini-transcribe")) ?#gpt_4o_mini_transcribe;
                case _ null;
            };

        public func toText(value : CreateTranscriptionRequestModelAnyOf) : Text =
            switch (value) {
                case (#whisper_1) "whisper-1";
                case (#gpt_4o_transcribe) "gpt-4o-transcribe";
                case (#gpt_4o_mini_transcribe) "gpt-4o-mini-transcribe";
            };
    };
};
