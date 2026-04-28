/// Log probability information for the choice.

import { type ChatCompletionTokenLogprob; JSON = ChatCompletionTokenLogprob } "./ChatCompletionTokenLogprob";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateChatCompletionResponseChoicesInnerLogprobs.mo

module {
    public type CreateChatCompletionResponseChoicesInnerLogprobs = {
        /// A list of message content tokens with log probability information.
        content : ?[ChatCompletionTokenLogprob];
        /// A list of message refusal tokens with log probability information.
        refusal : ?[ChatCompletionTokenLogprob];
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionResponseChoicesInnerLogprobs) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.content) {
                case (?v__) List.add(buf, ("content", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(v__, ChatCompletionTokenLogprob.toCandidValue))));
                case null ();
            };
            switch (value.refusal) {
                case (?v__) List.add(buf, ("refusal", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(v__, ChatCompletionTokenLogprob.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInnerLogprobs =
            switch (candid) {
                case (#Record(fields)) {
                    let content : ?[ChatCompletionTokenLogprob] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content")) {
                        case (?content_field) ((switch (content_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let refusal : ?[ChatCompletionTokenLogprob] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "refusal")) {
                        case (?refusal_field) ((switch (refusal_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        content;
                        refusal;
                    };
                };
                case _ null;
            };
    };
};
