/// Represents a transcription response returned by model, based on the provided input.

import { type CreateTranscriptionResponseJsonLogprobsInner; JSON = CreateTranscriptionResponseJsonLogprobsInner } "./CreateTranscriptionResponseJsonLogprobsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranscriptionResponseJson.mo

module {
    /// The required-fields slice of CreateTranscriptionResponseJson — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The transcribed text.
        text_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateTranscriptionResponseJson as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner];
    };

    public type CreateTranscriptionResponseJson = Required and Optional;

    public module JSON {
        // `init` constructs a CreateTranscriptionResponseJson from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateTranscriptionResponseJson.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateTranscriptionResponseJson {
            let ?res = from_candid(to_candid(required)) : ?CreateTranscriptionResponseJson else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateTranscriptionResponseJson) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("text", #Text(value.text_)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Array(Array.map<CreateTranscriptionResponseJsonLogprobsInner, Candid.Candid>(v__, CreateTranscriptionResponseJsonLogprobsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionResponseJson =
            switch (candid) {
                case (#Record(fields)) {
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) ((switch (logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateTranscriptionResponseJsonLogprobsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateTranscriptionResponseJsonLogprobsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        text_;
                        logprobs;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
