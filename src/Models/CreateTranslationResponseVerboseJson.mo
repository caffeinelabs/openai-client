
import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranslationResponseVerboseJson.mo

module {
    public type CreateTranslationResponseVerboseJson = {
        /// The language of the output translation (always `english`).
        language : Text;
        /// The duration of the input audio.
        duration : Float;
        /// The translated text.
        text_ : Text;
        /// Segments of the translated text and their corresponding details.
        segments : ?[TranscriptionSegment];
    };

    public module JSON {
        public func toCandidValue(value : CreateTranslationResponseVerboseJson) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("language", #Text(value.language)));
            List.add(buf, ("duration", #Float(value.duration)));
            List.add(buf, ("text", #Text(value.text_)));
            switch (value.segments) {
                case (?v__) List.add(buf, ("segments", #Array(Array.map<TranscriptionSegment, Candid.Candid>(v__, TranscriptionSegment.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslationResponseVerboseJson =
            switch (candid) {
                case (#Record(fields)) {
                    let ?language_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "language") else return null;
                    let ?language = ((switch (language_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?duration_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "duration") else return null;
                    let ?duration = ((switch (duration_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
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
                        segments;
                    };
                };
                case _ null;
            };
    };
};
