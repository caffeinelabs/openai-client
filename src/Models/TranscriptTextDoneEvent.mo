/// Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDoneEventType; JSON = TranscriptTextDoneEventType } "./TranscriptTextDoneEventType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TranscriptTextDoneEvent.mo

module {
    /// The required-fields slice of TranscriptTextDoneEvent — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : TranscriptTextDoneEventType;
        /// The text that was transcribed. 
        text_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TranscriptTextDoneEvent as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
    };

    public type TranscriptTextDoneEvent = Required and Optional;

    public module JSON {
        // `init` constructs a TranscriptTextDoneEvent from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TranscriptTextDoneEvent.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TranscriptTextDoneEvent {
            let ?res = from_candid(to_candid(required)) : ?TranscriptTextDoneEvent else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TranscriptTextDoneEvent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", TranscriptTextDoneEventType.toCandidValue(value.type_)));
            List.add(buf, ("text", #Text(value.text_)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Array(Array.map<TranscriptTextDeltaEventLogprobsInner, Candid.Candid>(v__, TranscriptTextDeltaEventLogprobsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptTextDoneEvent =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (TranscriptTextDoneEventType.fromCandidValue(type__field.1)) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
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
                    ?{
                        type_;
                        text_;
                        logprobs;
                    };
                };
                case _ null;
            };
    };
};
