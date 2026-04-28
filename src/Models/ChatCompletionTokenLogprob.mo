
import { type ChatCompletionTokenLogprobTopLogprobsInner; JSON = ChatCompletionTokenLogprobTopLogprobsInner } "./ChatCompletionTokenLogprobTopLogprobsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionTokenLogprob.mo

module {
    public type ChatCompletionTokenLogprob = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
        /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
        bytes : [Int];
        /// List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
        top_logprobs : [ChatCompletionTokenLogprobTopLogprobsInner];
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionTokenLogprob) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("token", #Text(value.token)));
            List.add(buf, ("logprob", #Float(value.logprob)));
            List.add(buf, ("bytes", #Array(Array.map<Int, Candid.Candid>(value.bytes, func(i : Int) : Candid.Candid = #Int(i)))));
            List.add(buf, ("top_logprobs", #Array(Array.map<ChatCompletionTokenLogprobTopLogprobsInner, Candid.Candid>(value.top_logprobs, ChatCompletionTokenLogprobTopLogprobsInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionTokenLogprob =
            switch (candid) {
                case (#Record(fields)) {
                    let ?token_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token") else return null;
                    let ?token = ((switch (token_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?logprob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprob") else return null;
                    let ?logprob = ((switch (logprob_field.1) { case (#Float(f)) ?f; case _ null })) else return null;
                    let ?bytes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes") else return null;
                    let ?bytes = ((switch (bytes_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let #Int(i__) = c__ else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?top_logprobs_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_logprobs") else return null;
                    let ?top_logprobs = ((switch (top_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprobTopLogprobsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprobTopLogprobsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        token;
                        logprob;
                        bytes;
                        top_logprobs;
                    };
                };
                case _ null;
            };
    };
};
