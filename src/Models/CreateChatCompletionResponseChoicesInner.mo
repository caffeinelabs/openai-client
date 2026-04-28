
import { type ChatCompletionResponseMessage; JSON = ChatCompletionResponseMessage } "./ChatCompletionResponseMessage";

import { type CreateChatCompletionResponseChoicesInnerFinishReason; JSON = CreateChatCompletionResponseChoicesInnerFinishReason } "./CreateChatCompletionResponseChoicesInnerFinishReason";

import { type CreateChatCompletionResponseChoicesInnerLogprobs; JSON = CreateChatCompletionResponseChoicesInnerLogprobs } "./CreateChatCompletionResponseChoicesInnerLogprobs";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateChatCompletionResponseChoicesInner.mo

module {
    public type CreateChatCompletionResponseChoicesInner = {
        finish_reason : CreateChatCompletionResponseChoicesInnerFinishReason;
        /// The index of the choice in the list of choices.
        index : Int;
        message : ChatCompletionResponseMessage;
        logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionResponseChoicesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("finish_reason", CreateChatCompletionResponseChoicesInnerFinishReason.toCandidValue(value.finish_reason)));
            List.add(buf, ("index", #Int(value.index)));
            List.add(buf, ("message", ChatCompletionResponseMessage.toCandidValue(value.message)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", CreateChatCompletionResponseChoicesInnerLogprobs.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?finish_reason_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finish_reason") else return null;
                    let ?finish_reason = (CreateChatCompletionResponseChoicesInnerFinishReason.fromCandidValue(finish_reason_field.1)) else return null;
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?message_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message") else return null;
                    let ?message = (ChatCompletionResponseMessage.fromCandidValue(message_field.1)) else return null;
                    let logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) (CreateChatCompletionResponseChoicesInnerLogprobs.fromCandidValue(logprobs_field.1));
                        case null null;
                    };
                    ?{
                        finish_reason;
                        index;
                        message;
                        logprobs;
                    };
                };
                case _ null;
            };
    };
};
