
import { type ChatCompletionRequestMessageContentPartAudioInputAudioFormat; JSON = ChatCompletionRequestMessageContentPartAudioInputAudioFormat } "./ChatCompletionRequestMessageContentPartAudioInputAudioFormat";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestMessageContentPartAudioInputAudio.mo

module {
    public type ChatCompletionRequestMessageContentPartAudioInputAudio = {
        /// Base64 encoded audio data.
        data : Text;
        format : ChatCompletionRequestMessageContentPartAudioInputAudioFormat;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartAudioInputAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", #Text(value.data)));
            List.add(buf, ("format", ChatCompletionRequestMessageContentPartAudioInputAudioFormat.toCandidValue(value.format)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartAudioInputAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = ((switch (data_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?format_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "format") else return null;
                    let ?format = (ChatCompletionRequestMessageContentPartAudioInputAudioFormat.fromCandidValue(format_field.1)) else return null;
                    ?{
                        data;
                        format;
                    };
                };
                case _ null;
            };
    };
};
