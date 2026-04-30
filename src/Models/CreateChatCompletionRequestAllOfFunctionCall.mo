/// Deprecated in favor of `tool_choice`.  Controls which (if any) function is called by the model.  `none` means the model will not call a function and instead generates a message.  `auto` means the model can pick between generating a message or calling a function.  Specifying a particular function via `{\"name\": \"my_function\"}` forces the model to call that function.  `none` is the default when no functions are present. `auto` is the default if functions are present. 

import { type ChatCompletionFunctionCallOption; JSON = ChatCompletionFunctionCallOption } "./ChatCompletionFunctionCallOption";

import { type CreateChatCompletionRequestAllOfFunctionCallOneOf; JSON = CreateChatCompletionRequestAllOfFunctionCallOneOf } "./CreateChatCompletionRequestAllOfFunctionCallOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionRequestAllOfFunctionCall.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type CreateChatCompletionRequestAllOfFunctionCall = {
        #CreateChatCompletionRequestAllOfFunctionCallOneOf : CreateChatCompletionRequestAllOfFunctionCallOneOf;
        #ChatCompletionFunctionCallOption : ChatCompletionFunctionCallOption;
    };

    public module JSON {
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf<CreateChatCompletionRequestAllOfFunctionCallOneOf,ChatCompletionFunctionCallOption>.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : CreateChatCompletionRequestAllOfFunctionCall) : Text = Runtime.unreachable();

        public func toCandidValue(_value : CreateChatCompletionRequestAllOfFunctionCall) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfFunctionCall = Runtime.unreachable();
    };
};
