
import { type ChatCompletionRequestMessageContentPartRefusal; JSON = ChatCompletionRequestMessageContentPartRefusal } "./ChatCompletionRequestMessageContentPartRefusal";

import { type ChatCompletionRequestMessageContentPartRefusalType; JSON = ChatCompletionRequestMessageContentPartRefusalType } "./ChatCompletionRequestMessageContentPartRefusalType";

import { type ChatCompletionRequestMessageContentPartText; JSON = ChatCompletionRequestMessageContentPartText } "./ChatCompletionRequestMessageContentPartText";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestAssistantMessageContentPart.mo
// Discriminator-oneOf — wire is a flat object whose `type`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type ChatCompletionRequestAssistantMessageContentPart = {
        #text_ : ChatCompletionRequestMessageContentPartText;
        #refusal : ChatCompletionRequestMessageContentPartRefusal;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestAssistantMessageContentPart) : Candid.Candid =
            switch (value) {
                case (#text_(v)) ChatCompletionRequestMessageContentPartText.toCandidValue(v);
                case (#refusal(v)) ChatCompletionRequestMessageContentPartRefusal.toCandidValue(v);
            };

        public func toText(value : ChatCompletionRequestAssistantMessageContentPart) : Text =
            switch (value) {
                case (#text_(_)) "text";
                case (#refusal(_)) "refusal";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestAssistantMessageContentPart =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("text") {
                                    let ?inner = ChatCompletionRequestMessageContentPartText.fromCandidValue(candid) else return null;
                                    ?#text_(inner);
                                };
                                case ("refusal") {
                                    let ?inner = ChatCompletionRequestMessageContentPartRefusal.fromCandidValue(candid) else return null;
                                    ?#refusal(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
