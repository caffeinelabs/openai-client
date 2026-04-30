import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TranscriptionSegment.mo

module {
    /// The required-fields slice of TranscriptionSegment — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Unique identifier of the segment.
        id : Int;
        /// Seek offset of the segment.
        seek : Int;
        /// Start time of the segment in seconds.
        start : Float;
        /// End time of the segment in seconds.
        end : Float;
        /// Text content of the segment.
        text_ : Text;
        /// Array of token IDs for the text content.
        tokens : [Int];
        /// Temperature parameter used for generating the segment.
        temperature : Float;
        /// Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
        avg_logprob : Float;
        /// Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
        compression_ratio : Float;
        /// Probability of no speech in the segment. If the value is higher than 1.0 and the `avg_logprob` is below -1, consider this segment silent.
        no_speech_prob : Float;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TranscriptionSegment as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type TranscriptionSegment = Required and Optional;

    public module JSON {
        // `init` constructs a TranscriptionSegment from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TranscriptionSegment.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TranscriptionSegment {
            let ?res = from_candid(to_candid(required)) : ?TranscriptionSegment else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TranscriptionSegment) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Int(value.id)));
            List.add(buf, ("seek", #Int(value.seek)));
            List.add(buf, ("start", #Float(value.start)));
            List.add(buf, ("end", #Float(value.end)));
            List.add(buf, ("text", #Text(value.text_)));
            List.add(buf, ("tokens", #Array(Array.map<Int, Candid.Candid>(value.tokens, func(i : Int) : Candid.Candid = #Int(i)))));
            List.add(buf, ("temperature", #Float(value.temperature)));
            List.add(buf, ("avg_logprob", #Float(value.avg_logprob)));
            List.add(buf, ("compression_ratio", #Float(value.compression_ratio)));
            List.add(buf, ("no_speech_prob", #Float(value.no_speech_prob)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptionSegment =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?seek_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "seek") else return null;
                    let ?seek = ((switch (seek_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?tokens_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tokens") else return null;
                    let ?tokens = ((switch (tokens_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let ?i__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?temperature_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "temperature") else return null;
                    let ?temperature = ((switch (temperature_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?avg_logprob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "avg_logprob") else return null;
                    let ?avg_logprob = ((switch (avg_logprob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?compression_ratio_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "compression_ratio") else return null;
                    let ?compression_ratio = ((switch (compression_ratio_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?no_speech_prob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "no_speech_prob") else return null;
                    let ?no_speech_prob = ((switch (no_speech_prob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    ?{
                        id;
                        seek;
                        start;
                        end;
                        text_;
                        tokens;
                        temperature;
                        avg_logprob;
                        compression_ratio;
                        no_speech_prob;
                    };
                };
                case _ null;
            };
    };
};
