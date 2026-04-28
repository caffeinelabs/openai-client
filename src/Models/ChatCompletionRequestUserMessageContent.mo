/// The contents of the user message. 

import { type ChatCompletionRequestUserMessageContentPart; JSON = ChatCompletionRequestUserMessageContentPart } "./ChatCompletionRequestUserMessageContentPart";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestUserMessageContent.mo
// oneOf<Text, [ChatCompletionRequestUserMessageContentPart]> on the wire — emit as
// `#string : Text` or `#array : [...]` user-side, projected to JSON string-or-array directly.

module {
    public type ChatCompletionRequestUserMessageContent = {
        #string : Text;
        #array : [ChatCompletionRequestUserMessageContentPart];
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestUserMessageContent) : Candid.Candid =
            switch (value) {
                case (#string(s)) #Text(s);
                case (#array(xs)) #Array(Array.map<ChatCompletionRequestUserMessageContentPart, Candid.Candid>(
                    xs,
                    ChatCompletionRequestUserMessageContentPart.toCandidValue
                ));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestUserMessageContent =
            switch (candid) {
                case (#Text(s)) ?#string(s);
                case (#Array(xs)) {
                    let buf = List.empty<ChatCompletionRequestUserMessageContentPart>();
                    for (c in xs.values()) {
                        let ?p = ChatCompletionRequestUserMessageContentPart.fromCandidValue(c) else return null;
                        List.add(buf, p);
                    };
                    ?#array(List.toArray(buf));
                };
                case _ null;
            };
    };
};
