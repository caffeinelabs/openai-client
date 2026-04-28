import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// TranscriptTextDeltaEventLogprobsInner.mo

module {
    public type TranscriptTextDeltaEventLogprobsInner = {
        /// The token that was used to generate the log probability. 
        token : ?Text;
        /// The log probability of the token. 
        logprob : ?Float;
        /// The bytes that were used to generate the log probability. 
        bytes : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : TranscriptTextDeltaEventLogprobsInner) : Candid.Candid {
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
                case (?v__) List.add(buf, ("bytes", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptTextDeltaEventLogprobsInner =
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
                    let bytes : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
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
