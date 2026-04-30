import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateSpeechRequestModelAnyOf.mo
/// Enum values: #tts_1, #tts_1_hd, #gpt_4o_mini_tts

module {
    public type CreateSpeechRequestModelAnyOf = {
        #tts_1;
        #tts_1_hd;
        #gpt_4o_mini_tts;
    };

    public module JSON {
        public func toCandidValue(value : CreateSpeechRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#tts_1) #Text("tts-1");
                case (#tts_1_hd) #Text("tts-1-hd");
                case (#gpt_4o_mini_tts) #Text("gpt-4o-mini-tts");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateSpeechRequestModelAnyOf =
            switch (candid) {
                case (#Text("tts-1")) ?#tts_1;
                case (#Text("tts-1-hd")) ?#tts_1_hd;
                case (#Text("gpt-4o-mini-tts")) ?#gpt_4o_mini_tts;
                case _ null;
            };

        public func toText(value : CreateSpeechRequestModelAnyOf) : Text =
            switch (value) {
                case (#tts_1) "tts-1";
                case (#tts_1_hd) "tts-1-hd";
                case (#gpt_4o_mini_tts) "gpt-4o-mini-tts";
            };
    };
};
