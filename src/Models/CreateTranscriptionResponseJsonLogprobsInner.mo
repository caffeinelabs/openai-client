import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranscriptionResponseJsonLogprobsInner.mo

module {
    /// The required-fields slice of CreateTranscriptionResponseJsonLogprobsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateTranscriptionResponseJsonLogprobsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        token : ?Text;
        logprob : ?Float;
        bytes : ?[Float];
    };

    public type CreateTranscriptionResponseJsonLogprobsInner = Required and Optional;

    public module JSON {
        // `init` constructs a CreateTranscriptionResponseJsonLogprobsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateTranscriptionResponseJsonLogprobsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateTranscriptionResponseJsonLogprobsInner {
            let ?res = from_candid(to_candid(required)) : ?CreateTranscriptionResponseJsonLogprobsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateTranscriptionResponseJsonLogprobsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.token) {
                case (?v__) List.add(buf, ("token", #Text(v__)));
                case null ();
            };
            switch (value.logprob) {
                case (?v__) List.add(buf, ("logprob", #Float(v__)));
                case null ();
            };
            switch (value.bytes) {
                case (?v__) List.add(buf, ("bytes", #Array(Array.map<Float, Candid.Candid>(v__, func(f : Float) : Candid.Candid = #Float(f)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionResponseJsonLogprobsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token")) {
                        case (?token_field) ((switch (token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let logprob : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprob")) {
                        case (?logprob_field) ((switch (logprob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let bytes : ?[Float] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let ?f__ = (switch (c__) { case (#Float(g)) ?g; case (#Int(j)) ?Float.fromInt(j); case (#Nat(k)) ?Float.fromInt(k); case _ null }) else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        token;
                        logprob;
                        bytes;
                    };
                };
                case _ null;
            };
    };
};
