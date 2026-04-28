/// Log probability information for the choice.

import { type ChatCompletionTokenLogprob; JSON = ChatCompletionTokenLogprob } "./ChatCompletionTokenLogprob";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionResponseChoicesInnerLogprobs.mo

module {
    public type CreateChatCompletionResponseChoicesInnerLogprobs = {
        /// A list of message content tokens with log probability information.
        content : [ChatCompletionTokenLogprob];
        /// A list of message refusal tokens with log probability information.
        refusal : [ChatCompletionTokenLogprob];
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionResponseChoicesInnerLogprobs) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("content", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(value.content, ChatCompletionTokenLogprob.toCandidValue))));
            List.add(buf, ("refusal", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(value.refusal, ChatCompletionTokenLogprob.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInnerLogprobs =
            switch (candid) {
                case (#Record(fields)) {
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = ((switch (content_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?refusal_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "refusal") else return null;
                    let ?refusal = ((switch (refusal_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        content;
                        refusal;
                    };
                };
                case _ null;
            };
    };
};
