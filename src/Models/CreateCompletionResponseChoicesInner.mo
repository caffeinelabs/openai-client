
import { type CreateCompletionResponseChoicesInnerFinishReason; JSON = CreateCompletionResponseChoicesInnerFinishReason } "./CreateCompletionResponseChoicesInnerFinishReason";

import { type CreateCompletionResponseChoicesInnerLogprobs; JSON = CreateCompletionResponseChoicesInnerLogprobs } "./CreateCompletionResponseChoicesInnerLogprobs";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateCompletionResponseChoicesInner.mo

module {
    public type CreateCompletionResponseChoicesInner = {
        finish_reason : CreateCompletionResponseChoicesInnerFinishReason;
        index : Int;
        logprobs : CreateCompletionResponseChoicesInnerLogprobs;
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateCompletionResponseChoicesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("finish_reason", CreateCompletionResponseChoicesInnerFinishReason.toCandidValue(value.finish_reason)));
            List.add(buf, ("index", #Int(value.index)));
            List.add(buf, ("logprobs", CreateCompletionResponseChoicesInnerLogprobs.toCandidValue(value.logprobs)));
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseChoicesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?finish_reason_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finish_reason") else return null;
                    let ?finish_reason = (CreateCompletionResponseChoicesInnerFinishReason.fromCandidValue(finish_reason_field.1)) else return null;
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let ?logprobs_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs") else return null;
                    let ?logprobs = (CreateCompletionResponseChoicesInnerLogprobs.fromCandidValue(logprobs_field.1)) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        finish_reason;
                        index;
                        logprobs;
                        text_;
                    };
                };
                case _ null;
            };
    };
};
