
import { type TranscriptTextDeltaEvent; JSON = TranscriptTextDeltaEvent } "./TranscriptTextDeltaEvent";

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDoneEvent; JSON = TranscriptTextDoneEvent } "./TranscriptTextDoneEvent";

import { type TranscriptTextDoneEventType; JSON = TranscriptTextDoneEventType } "./TranscriptTextDoneEventType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranscriptionResponseStreamEvent.mo

module {
    public type CreateTranscriptionResponseStreamEvent = {
        type_ : TranscriptTextDoneEventType;
        /// The text delta that was additionally transcribed. 
        delta : Text;
        /// The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`. 
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
        /// The text that was transcribed. 
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionResponseStreamEvent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", TranscriptTextDoneEventType.toCandidValue(value.type_)));
            List.add(buf, ("delta", #Text(value.delta)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Array(Array.map<TranscriptTextDeltaEventLogprobsInner, Candid.Candid>(v__, TranscriptTextDeltaEventLogprobsInner.toCandidValue))));
                case null ();
            };
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionResponseStreamEvent =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (TranscriptTextDoneEventType.fromCandidValue(type__field.1)) else return null;
                    let ?delta_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delta") else return null;
                    let ?delta = ((switch (delta_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let logprobs : ?[TranscriptTextDeltaEventLogprobsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) ((switch (logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<TranscriptTextDeltaEventLogprobsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = TranscriptTextDeltaEventLogprobsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        type_;
                        delta;
                        logprobs;
                        text_;
                    };
                };
                case _ null;
            };
    };
};
