/// Deprecated in favor of `tool_choice`.  Controls which (if any) function is called by the model.  `none` means the model will not call a function and instead generates a message.  `auto` means the model can pick between generating a message or calling a function.  Specifying a particular function via `{\"name\": \"my_function\"}` forces the model to call that function.  `none` is the default when no functions are present. `auto` is the default if functions are present. 

import { type ChatCompletionFunctionCallOption; JSON = ChatCompletionFunctionCallOption } "./ChatCompletionFunctionCallOption";

import { type CreateChatCompletionRequestAllOfFunctionCallOneOf; JSON = CreateChatCompletionRequestAllOfFunctionCallOneOf } "./CreateChatCompletionRequestAllOfFunctionCallOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateChatCompletionRequestAllOfFunctionCall.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type CreateChatCompletionRequestAllOfFunctionCall = {
        #CreateChatCompletionRequestAllOfFunctionCallOneOf : CreateChatCompletionRequestAllOfFunctionCallOneOf;
        #ChatCompletionFunctionCallOption : ChatCompletionFunctionCallOption;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateChatCompletionRequestAllOfFunctionCall) : Text =
            switch (value) {
                case (#CreateChatCompletionRequestAllOfFunctionCallOneOf(v)) (switch (CreateChatCompletionRequestAllOfFunctionCallOneOf.toCandidValue(v)) { case (#Text(s)) s; case _ Runtime.unreachable() });
                case (#ChatCompletionFunctionCallOption(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateChatCompletionRequestAllOfFunctionCall) : Candid.Candid =
            switch (value) {
                case (#CreateChatCompletionRequestAllOfFunctionCallOneOf(v)) #Variant(("CreateChatCompletionRequestAllOfFunctionCallOneOf", CreateChatCompletionRequestAllOfFunctionCallOneOf.toCandidValue(v)));
                case (#ChatCompletionFunctionCallOption(v)) #Variant(("ChatCompletionFunctionCallOption", ChatCompletionFunctionCallOption.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfFunctionCall =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("CreateChatCompletionRequestAllOfFunctionCallOneOf") {
                            let ?inner = CreateChatCompletionRequestAllOfFunctionCallOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateChatCompletionRequestAllOfFunctionCallOneOf(inner)
                        };
                        case ("ChatCompletionFunctionCallOption") {
                            let ?inner = ChatCompletionFunctionCallOption.fromCandidValue(tagAndVal.1) else return null;
                            ?#ChatCompletionFunctionCallOption(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
