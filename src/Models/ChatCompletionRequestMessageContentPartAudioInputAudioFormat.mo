/// The format of the encoded audio data. Currently supports \"wav\" and \"mp3\". 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartAudioInputAudioFormat.mo
/// Enum values: #wav, #mp3

module {
    public type ChatCompletionRequestMessageContentPartAudioInputAudioFormat = {
        #wav;
        #mp3;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartAudioInputAudioFormat) : Candid.Candid =
            switch (value) {
                case (#wav) #Text("wav");
                case (#mp3) #Text("mp3");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartAudioInputAudioFormat =
            switch (candid) {
                case (#Text("wav")) ?#wav;
                case (#Text("mp3")) ?#mp3;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartAudioInputAudioFormat) : Text =
            switch (value) {
                case (#wav) "wav";
                case (#mp3) "mp3";
            };
    };
};
