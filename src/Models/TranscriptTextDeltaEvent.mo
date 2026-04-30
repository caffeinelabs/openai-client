/// Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.

import { type TranscriptTextDeltaEventLogprobsInner; JSON = TranscriptTextDeltaEventLogprobsInner } "./TranscriptTextDeltaEventLogprobsInner";

import { type TranscriptTextDeltaEventType; JSON = TranscriptTextDeltaEventType } "./TranscriptTextDeltaEventType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TranscriptTextDeltaEvent.mo

module {
    /// The required-fields slice of TranscriptTextDeltaEvent — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : TranscriptTextDeltaEventType;
        /// The text delta that was additionally transcribed. 
        delta : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TranscriptTextDeltaEvent as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        logprobs : ?[TranscriptTextDeltaEventLogprobsInner];
    };

    public type TranscriptTextDeltaEvent = Required and Optional;

    public module JSON {
        // `init` constructs a TranscriptTextDeltaEvent from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TranscriptTextDeltaEvent.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TranscriptTextDeltaEvent {
            let ?res = from_candid(to_candid(required)) : ?TranscriptTextDeltaEvent else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TranscriptTextDeltaEvent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", TranscriptTextDeltaEventType.toCandidValue(value.type_)));
            List.add(buf, ("delta", #Text(value.delta)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Array(Array.map<TranscriptTextDeltaEventLogprobsInner, Candid.Candid>(v__, TranscriptTextDeltaEventLogprobsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptTextDeltaEvent =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (TranscriptTextDeltaEventType.fromCandidValue(type__field.1)) else return null;
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
                    ?{
                        type_;
                        delta;
                        logprobs;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
