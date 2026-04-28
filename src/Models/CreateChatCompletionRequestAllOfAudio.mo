/// Parameters for audio output. Required when audio output is requested with `modalities: [\"audio\"]`. [Learn more](/docs/guides/audio). 

import { type VoiceIdsShared; JSON = VoiceIdsShared } "./VoiceIdsShared";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateChatCompletionRequestAllOfAudio.mo

module {
    public type CreateChatCompletionRequestAllOfAudio = {
        voice : VoiceIdsShared;
        /// Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`, or `pcm16`. 
        format : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionRequestAllOfAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("voice", VoiceIdsShared.toCandidValue(value.voice)));
            List.add(buf, ("format", #Text(value.format)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?voice_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "voice") else return null;
                    let ?voice = (VoiceIdsShared.fromCandidValue(voice_field.1)) else return null;
                    let ?format_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "format") else return null;
                    let ?format = ((switch (format_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        voice;
                        format;
                    };
                };
                case _ null;
            };
    };
};
