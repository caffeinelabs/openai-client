import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateTranscriptionResponseJsonLogprobsInner.mo

module {
    public type CreateTranscriptionResponseJsonLogprobsInner = {
        /// The token in the transcription.
        token : ?Text;
        /// The log probability of the token.
        logprob : ?Float;
        /// The bytes of the token.
        bytes : ?[Float];
    };

    public module JSON {
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
                        case (?logprob_field) ((switch (logprob_field.1) { case (#Float(f)) ?f; case _ null }));
                        case null null;
                    };
                    let bytes : ?[Float] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let #Float(f__) = c__ else return null;
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
