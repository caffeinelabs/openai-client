
import { type ChatCompletionRequestMessageContentPartAudio; JSON = ChatCompletionRequestMessageContentPartAudio } "./ChatCompletionRequestMessageContentPartAudio";

import { type ChatCompletionRequestMessageContentPartAudioInputAudio; JSON = ChatCompletionRequestMessageContentPartAudioInputAudio } "./ChatCompletionRequestMessageContentPartAudioInputAudio";

import { type ChatCompletionRequestMessageContentPartFile; JSON = ChatCompletionRequestMessageContentPartFile } "./ChatCompletionRequestMessageContentPartFile";

import { type ChatCompletionRequestMessageContentPartFileFile; JSON = ChatCompletionRequestMessageContentPartFileFile } "./ChatCompletionRequestMessageContentPartFileFile";

import { type ChatCompletionRequestMessageContentPartFileType; JSON = ChatCompletionRequestMessageContentPartFileType } "./ChatCompletionRequestMessageContentPartFileType";

import { type ChatCompletionRequestMessageContentPartImage; JSON = ChatCompletionRequestMessageContentPartImage } "./ChatCompletionRequestMessageContentPartImage";

import { type ChatCompletionRequestMessageContentPartImageImageUrl; JSON = ChatCompletionRequestMessageContentPartImageImageUrl } "./ChatCompletionRequestMessageContentPartImageImageUrl";

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestUserMessageContentPart.mo
// Discriminator-oneOf — wire is a flat object whose `type`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type ChatCompletionRequestUserMessageContentPart = {
        #text_ : ChatCompletionRequestMessageContentPartText;
        #image_url : ChatCompletionRequestMessageContentPartImage;
        #input_audio : ChatCompletionRequestMessageContentPartAudio;
        #file : ChatCompletionRequestMessageContentPartFile;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestUserMessageContentPart) : Candid.Candid =
            switch (value) {
                case (#text_(v)) ChatCompletionRequestMessageContentPartText.toCandidValue(v);
                case (#image_url(v)) ChatCompletionRequestMessageContentPartImage.toCandidValue(v);
                case (#input_audio(v)) ChatCompletionRequestMessageContentPartAudio.toCandidValue(v);
                case (#file(v)) ChatCompletionRequestMessageContentPartFile.toCandidValue(v);
            };

        public func toText(value : ChatCompletionRequestUserMessageContentPart) : Text =
            switch (value) {
                case (#text_(_)) "text";
                case (#image_url(_)) "image_url";
                case (#input_audio(_)) "input_audio";
                case (#file(_)) "file";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestUserMessageContentPart =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("text") {
                                    let ?inner = ChatCompletionRequestMessageContentPartText.fromCandidValue(candid) else return null;
                                    ?#text_(inner);
                                };
                                case ("image_url") {
                                    let ?inner = ChatCompletionRequestMessageContentPartImage.fromCandidValue(candid) else return null;
                                    ?#image_url(inner);
                                };
                                case ("input_audio") {
                                    let ?inner = ChatCompletionRequestMessageContentPartAudio.fromCandidValue(candid) else return null;
                                    ?#input_audio(inner);
                                };
                                case ("file") {
                                    let ?inner = ChatCompletionRequestMessageContentPartFile.fromCandidValue(candid) else return null;
                                    ?#file(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
