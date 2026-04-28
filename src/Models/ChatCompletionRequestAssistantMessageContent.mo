/// The contents of the assistant message. Required unless `tool_calls` or `function_call` is specified. 

import { type ChatCompletionRequestAssistantMessageContentPart; JSON = ChatCompletionRequestAssistantMessageContentPart } "./ChatCompletionRequestAssistantMessageContentPart";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestAssistantMessageContent.mo
// oneOf<Text, [ChatCompletionRequestAssistantMessageContentPart]> on the wire — emit as
// `#string : Text` or `#array : [...]` user-side, projected to JSON string-or-array directly.

module {
    public type ChatCompletionRequestAssistantMessageContent = {
        #string : Text;
        #array : [ChatCompletionRequestAssistantMessageContentPart];
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestAssistantMessageContent) : Candid.Candid =
            switch (value) {
                case (#string(s)) #Text(s);
                case (#array(xs)) #Array(Array.map<ChatCompletionRequestAssistantMessageContentPart, Candid.Candid>(
                    xs,
                    ChatCompletionRequestAssistantMessageContentPart.toCandidValue
                ));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestAssistantMessageContent =
            switch (candid) {
                case (#Text(s)) ?#string(s);
                case (#Array(xs)) {
                    let buf = List.empty<ChatCompletionRequestAssistantMessageContentPart>();
                    for (c in xs.values()) {
                        let ?p = ChatCompletionRequestAssistantMessageContentPart.fromCandidValue(c) else return null;
                        List.add(buf, p);
                    };
                    ?#array(List.toArray(buf));
                };
                case _ null;
            };
    };
};
