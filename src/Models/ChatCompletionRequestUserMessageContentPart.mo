
import { type ChatCompletionRequestMessageContentPartAudio; JSON = ChatCompletionRequestMessageContentPartAudio } "./ChatCompletionRequestMessageContentPartAudio";

import { type ChatCompletionRequestMessageContentPartAudioInputAudio; JSON = ChatCompletionRequestMessageContentPartAudioInputAudio } "./ChatCompletionRequestMessageContentPartAudioInputAudio";

import { type ChatCompletionRequestMessageContentPartFile; JSON = ChatCompletionRequestMessageContentPartFile } "./ChatCompletionRequestMessageContentPartFile";

import { type ChatCompletionRequestMessageContentPartFileFile; JSON = ChatCompletionRequestMessageContentPartFileFile } "./ChatCompletionRequestMessageContentPartFileFile";

import { type ChatCompletionRequestMessageContentPartFileType; JSON = ChatCompletionRequestMessageContentPartFileType } "./ChatCompletionRequestMessageContentPartFileType";

import { type ChatCompletionRequestMessageContentPartImage; JSON = ChatCompletionRequestMessageContentPartImage } "./ChatCompletionRequestMessageContentPartImage";

import { type ChatCompletionRequestMessageContentPartImageImageUrl; JSON = ChatCompletionRequestMessageContentPartImageImageUrl } "./ChatCompletionRequestMessageContentPartImageImageUrl";

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";

// ChatCompletionRequestUserMessageContentPart.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ChatCompletionRequestUserMessageContentPart = {
        #ChatCompletionRequestMessageContentPartText : ChatCompletionRequestMessageContentPartText;
        #ChatCompletionRequestMessageContentPartImage : ChatCompletionRequestMessageContentPartImage;
        #ChatCompletionRequestMessageContentPartAudio : ChatCompletionRequestMessageContentPartAudio;
        #ChatCompletionRequestMessageContentPartFile : ChatCompletionRequestMessageContentPartFile;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionRequestUserMessageContentPart) : Text =
            switch (value) {
                case (#ChatCompletionRequestMessageContentPartText(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartImage(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartAudio(v)) Runtime.unreachable();
                case (#ChatCompletionRequestMessageContentPartFile(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestUserMessageContentPart type
        public type JSON = {
            #ChatCompletionRequestMessageContentPartText : ChatCompletionRequestMessageContentPartText;
            #ChatCompletionRequestMessageContentPartImage : ChatCompletionRequestMessageContentPartImage;
            #ChatCompletionRequestMessageContentPartAudio : ChatCompletionRequestMessageContentPartAudio;
            #ChatCompletionRequestMessageContentPartFile : ChatCompletionRequestMessageContentPartFile;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestUserMessageContentPart) : JSON =
            switch (value) {
                case (#ChatCompletionRequestMessageContentPartText(v)) #ChatCompletionRequestMessageContentPartText(v);
                case (#ChatCompletionRequestMessageContentPartImage(v)) #ChatCompletionRequestMessageContentPartImage(v);
                case (#ChatCompletionRequestMessageContentPartAudio(v)) #ChatCompletionRequestMessageContentPartAudio(v);
                case (#ChatCompletionRequestMessageContentPartFile(v)) #ChatCompletionRequestMessageContentPartFile(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestUserMessageContentPart =
            switch (json) {
                case (#ChatCompletionRequestMessageContentPartText(v)) ?#ChatCompletionRequestMessageContentPartText(v);
                case (#ChatCompletionRequestMessageContentPartImage(v)) ?#ChatCompletionRequestMessageContentPartImage(v);
                case (#ChatCompletionRequestMessageContentPartAudio(v)) ?#ChatCompletionRequestMessageContentPartAudio(v);
                case (#ChatCompletionRequestMessageContentPartFile(v)) ?#ChatCompletionRequestMessageContentPartFile(v);
            };
    }
}
