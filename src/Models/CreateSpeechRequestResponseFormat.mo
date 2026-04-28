/// The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateSpeechRequestResponseFormat.mo
/// Enum values: #mp3, #opus, #aac, #flac, #wav, #pcm

module {
    public type CreateSpeechRequestResponseFormat = {
        #mp3;
        #opus;
        #aac;
        #flac;
        #wav;
        #pcm;
    };

    public module JSON {
        public func toCandidValue(value : CreateSpeechRequestResponseFormat) : Candid.Candid =
            switch (value) {
                case (#mp3) #Text("mp3");
                case (#opus) #Text("opus");
                case (#aac) #Text("aac");
                case (#flac) #Text("flac");
                case (#wav) #Text("wav");
                case (#pcm) #Text("pcm");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateSpeechRequestResponseFormat =
            switch (candid) {
                case (#Text("mp3")) ?#mp3;
                case (#Text("opus")) ?#opus;
                case (#Text("aac")) ?#aac;
                case (#Text("flac")) ?#flac;
                case (#Text("wav")) ?#wav;
                case (#Text("pcm")) ?#pcm;
                case _ null;
            };

        public func toText(value : CreateSpeechRequestResponseFormat) : Text =
            switch (value) {
                case (#mp3) "mp3";
                case (#opus) "opus";
                case (#aac) "aac";
                case (#flac) "flac";
                case (#wav) "wav";
                case (#pcm) "pcm";
            };
    };
};
