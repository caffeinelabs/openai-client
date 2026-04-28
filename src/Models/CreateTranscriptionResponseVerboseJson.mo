/// Represents a verbose json transcription response returned by model, based on the provided input.

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

import { type TranscriptionWord; JSON = TranscriptionWord } "./TranscriptionWord";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateTranscriptionResponseVerboseJson.mo

module {
    public type CreateTranscriptionResponseVerboseJson = {
        /// The language of the input audio.
        language : Text;
        /// The duration of the input audio.
        duration : Float;
        /// The transcribed text.
        text_ : Text;
        /// Extracted words and their corresponding timestamps.
        words : ?[TranscriptionWord];
        /// Segments of the transcribed text and their corresponding details.
        segments : ?[TranscriptionSegment];
    };

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionResponseVerboseJson) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("language", #Text(value.language)));
            List.add(buf, ("duration", #Float(value.duration)));
            List.add(buf, ("text", #Text(value.text_)));
            switch (value.words) {
                case (?v__) List.add(buf, ("words", #Array(Array.map<TranscriptionWord, Candid.Candid>(v__, TranscriptionWord.toCandidValue))));
                case null ();
            };
            switch (value.segments) {
                case (?v__) List.add(buf, ("segments", #Array(Array.map<TranscriptionSegment, Candid.Candid>(v__, TranscriptionSegment.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionResponseVerboseJson =
            switch (candid) {
                case (#Record(fields)) {
                    let ?language_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "language") else return null;
                    let ?language = ((switch (language_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?duration_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "duration") else return null;
                    let ?duration = ((switch (duration_field.1) { case (#Float(f)) ?f; case _ null })) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let words : ?[TranscriptionWord] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "words")) {
                        case (?words_field) ((switch (words_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<TranscriptionWord>();
                            for (c__ in xs__.values()) {
                                let ?m__ = TranscriptionWord.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let segments : ?[TranscriptionSegment] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "segments")) {
                        case (?segments_field) ((switch (segments_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<TranscriptionSegment>();
                            for (c__ in xs__.values()) {
                                let ?m__ = TranscriptionSegment.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        language;
                        duration;
                        text_;
                        words;
                        segments;
                    };
                };
                case _ null;
            };
    };
};
