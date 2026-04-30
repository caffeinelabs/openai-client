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
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf<ChatCompletionToolChoiceOptionOneOf,ChatCompletionNamedToolChoice>.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : ChatCompletionToolChoiceOption) : Text = Runtime.unreachable();

        public func toCandidValue(_value : ChatCompletionToolChoiceOption) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?ChatCompletionToolChoiceOption = Runtime.unreachable();
    };
};
