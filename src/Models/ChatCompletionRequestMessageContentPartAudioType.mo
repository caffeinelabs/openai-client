/// The type of the content part. Always `input_audio`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartAudioType.mo
/// Enum values: #input_audio

module {
    public type ChatCompletionRequestMessageContentPartAudioType = {
        #input_audio;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartAudioType) : Candid.Candid =
            switch (value) {
                case (#input_audio) #Text("input_audio");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartAudioType =
            switch (candid) {
                case (#Text("input_audio")) ?#input_audio;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartAudioType) : Text =
            switch (value) {
                case (#input_audio) "input_audio";
            };
    };
};
