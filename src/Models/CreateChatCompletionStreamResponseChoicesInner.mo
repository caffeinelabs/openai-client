
import { type ChatCompletionStreamResponseDelta; JSON = ChatCompletionStreamResponseDelta } "./ChatCompletionStreamResponseDelta";

import { type CreateChatCompletionResponseChoicesInnerLogprobs; JSON = CreateChatCompletionResponseChoicesInnerLogprobs } "./CreateChatCompletionResponseChoicesInnerLogprobs";

import { type CreateChatCompletionStreamResponseChoicesInnerFinishReason; JSON = CreateChatCompletionStreamResponseChoicesInnerFinishReason } "./CreateChatCompletionStreamResponseChoicesInnerFinishReason";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionStreamResponseChoicesInner.mo

module {
    public type CreateChatCompletionStreamResponseChoicesInner = {
        delta : ChatCompletionStreamResponseDelta;
        logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs;
        finish_reason : CreateChatCompletionStreamResponseChoicesInnerFinishReason;
        /// The index of the choice in the list of choices.
        index : Int;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionStreamResponseChoicesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("delta", ChatCompletionStreamResponseDelta.toCandidValue(value.delta)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", CreateChatCompletionResponseChoicesInnerLogprobs.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("finish_reason", CreateChatCompletionStreamResponseChoicesInnerFinishReason.toCandidValue(value.finish_reason)));
            List.add(buf, ("index", #Int(value.index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionStreamResponseChoicesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?delta_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delta") else return null;
                    let ?delta = (ChatCompletionStreamResponseDelta.fromCandidValue(delta_field.1)) else return null;
                    let logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) (CreateChatCompletionResponseChoicesInnerLogprobs.fromCandidValue(logprobs_field.1));
                        case null null;
                    };
                    let ?finish_reason_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finish_reason") else return null;
                    let ?finish_reason = (CreateChatCompletionStreamResponseChoicesInnerFinishReason.fromCandidValue(finish_reason_field.1)) else return null;
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    ?{
                        delta;
                        logprobs;
                        finish_reason;
                        index;
                    };
                };
                case _ null;
            };
    };
};
