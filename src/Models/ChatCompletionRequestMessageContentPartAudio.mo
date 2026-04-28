/// Learn about [audio inputs](/docs/guides/audio). 

import { type ChatCompletionRequestMessageContentPartAudioInputAudio; JSON = ChatCompletionRequestMessageContentPartAudioInputAudio } "./ChatCompletionRequestMessageContentPartAudioInputAudio";

import { type ChatCompletionRequestMessageContentPartAudioType; JSON = ChatCompletionRequestMessageContentPartAudioType } "./ChatCompletionRequestMessageContentPartAudioType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestMessageContentPartAudio.mo

module {
    public type ChatCompletionRequestMessageContentPartAudio = {
        type_ : ChatCompletionRequestMessageContentPartAudioType;
        input_audio : ChatCompletionRequestMessageContentPartAudioInputAudio;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionRequestMessageContentPartAudioType.toCandidValue(value.type_)));
            List.add(buf, ("input_audio", ChatCompletionRequestMessageContentPartAudioInputAudio.toCandidValue(value.input_audio)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionRequestMessageContentPartAudioType.fromCandidValue(type__field.1)) else return null;
                    let ?input_audio_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input_audio") else return null;
                    let ?input_audio = (ChatCompletionRequestMessageContentPartAudioInputAudio.fromCandidValue(input_audio_field.1)) else return null;
                    ?{
                        type_;
                        input_audio;
                    };
                };
                case _ null;
            };
    };
};
