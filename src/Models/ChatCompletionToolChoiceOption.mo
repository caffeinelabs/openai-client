/// Controls which (if any) tool is called by the model. `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools. Specifying a particular tool via `{\"type\": \"function\", \"function\": {\"name\": \"my_function\"}}` forces the model to call that tool.  `none` is the default when no tools are present. `auto` is the default if tools are present. 

import { type AssistantsNamedToolChoiceFunction; JSON = AssistantsNamedToolChoiceFunction } "./AssistantsNamedToolChoiceFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

import { type ChatCompletionNamedToolChoice; JSON = ChatCompletionNamedToolChoice } "./ChatCompletionNamedToolChoice";

import { type ChatCompletionToolChoiceOptionOneOf; JSON = ChatCompletionToolChoiceOptionOneOf } "./ChatCompletionToolChoiceOptionOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionToolChoiceOption.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type ChatCompletionToolChoiceOption = {
        #ChatCompletionToolChoiceOptionOneOf : ChatCompletionToolChoiceOptionOneOf;
        #ChatCompletionNamedToolChoice : ChatCompletionNamedToolChoice;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ChatCompletionToolChoiceOption) : Text =
            switch (value) {
                case (#ChatCompletionToolChoiceOptionOneOf(v)) (switch (ChatCompletionToolChoiceOptionOneOf.toCandidValue(v)) { case (#Text(s)) s; case _ Runtime.unreachable() });
                case (#ChatCompletionNamedToolChoice(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : ChatCompletionToolChoiceOption) : Candid.Candid =
            switch (value) {
                case (#ChatCompletionToolChoiceOptionOneOf(v)) #Variant(("ChatCompletionToolChoiceOptionOneOf", ChatCompletionToolChoiceOptionOneOf.toCandidValue(v)));
                case (#ChatCompletionNamedToolChoice(v)) #Variant(("ChatCompletionNamedToolChoice", ChatCompletionNamedToolChoice.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionToolChoiceOption =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("ChatCompletionToolChoiceOptionOneOf") {
                            let ?inner = ChatCompletionToolChoiceOptionOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#ChatCompletionToolChoiceOptionOneOf(inner)
                        };
                        case ("ChatCompletionNamedToolChoice") {
                            let ?inner = ChatCompletionNamedToolChoice.fromCandidValue(tagAndVal.1) else return null;
                            ?#ChatCompletionNamedToolChoice(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
