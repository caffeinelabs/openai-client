import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionTokenLogprobTopLogprobsInner.mo

module {
    public type ChatCompletionTokenLogprobTopLogprobsInner = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
        /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
        bytes : ?[Int];
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionTokenLogprobTopLogprobsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("token", #Text(value.token)));
            List.add(buf, ("logprob", #Float(value.logprob)));
            switch (value.bytes) {
                case (?v__) List.add(buf, ("bytes", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionTokenLogprobTopLogprobsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?token_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token") else return null;
                    let ?token = ((switch (token_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?logprob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprob") else return null;
                    let ?logprob = ((switch (logprob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let bytes : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let ?i__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, i__);
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
