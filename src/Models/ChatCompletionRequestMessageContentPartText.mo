/// Learn about [text inputs](/docs/guides/text-generation). 

import { type ChatCompletionRequestMessageContentPartTextType; JSON = ChatCompletionRequestMessageContentPartTextType } "./ChatCompletionRequestMessageContentPartTextType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestMessageContentPartText.mo

module {
    public type ChatCompletionRequestMessageContentPartText = {
        type_ : ChatCompletionRequestMessageContentPartTextType;
        /// The text content.
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartText) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionRequestMessageContentPartTextType.toCandidValue(value.type_)));
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartText =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionRequestMessageContentPartTextType.fromCandidValue(type__field.1)) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        type_;
                        text_;
                    };
                };
                case _ null;
            };
    };
};
