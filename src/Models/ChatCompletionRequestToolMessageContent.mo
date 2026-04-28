/// The contents of the tool message.

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestToolMessageContent.mo
// oneOf<Text, [ChatCompletionRequestMessageContentPartText]> on the wire — emit as
// `#string : Text` or `#array : [...]` user-side, projected to JSON string-or-array directly.

module {
    public type ChatCompletionRequestToolMessageContent = {
        #string : Text;
        #array : [ChatCompletionRequestMessageContentPartText];
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestToolMessageContent) : Candid.Candid =
            switch (value) {
                case (#string(s)) #Text(s);
                case (#array(xs)) #Array(Array.map<ChatCompletionRequestMessageContentPartText, Candid.Candid>(
                    xs,
                    ChatCompletionRequestMessageContentPartText.toCandidValue
                ));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestToolMessageContent =
            switch (candid) {
                case (#Text(s)) ?#string(s);
                case (#Array(xs)) {
                    let buf = List.empty<ChatCompletionRequestMessageContentPartText>();
                    for (c in xs.values()) {
                        let ?p = ChatCompletionRequestMessageContentPartText.fromCandidValue(c) else return null;
                        List.add(buf, p);
                    };
                    ?#array(List.toArray(buf));
                };
                case _ null;
            };
    };
};
