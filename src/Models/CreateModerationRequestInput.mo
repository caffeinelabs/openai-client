/// Input (or inputs) to classify. Can be a single string, an array of strings, or an array of multi-modal input objects similar to other models. 

import { type CreateModerationRequestInputOneOfInner; JSON = CreateModerationRequestInputOneOfInner } "./CreateModerationRequestInputOneOfInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationRequestInput.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type CreateModerationRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #CreateModerationRequestInputOneOfInner : [CreateModerationRequestInputOneOfInner];
    };

    public module JSON {
        // Generic oneOf is rare on the surfaces we care about (chat / tweet
        // bodies use discriminator-oneOf or string-flatten). The branches here
        // can mix primitives, parametrised types, and arrays — none of which
        // dispatch cleanly via `OneOf<string,array,array>.toCandidValue(v)` (Text isn't a
        // module; `Map<K,V>` and `[[Int]]` aren't dottable identifiers). To
        // keep the file type-checking (so `mops publish` can extract docs),
        // stub all three converters with `Runtime.unreachable()`. Real
        // implementations are a follow-up — primitive dispatch + recursive
        // partial reuse for arrays/maps inside oneOf branches.
        public func toText(_value : CreateModerationRequestInput) : Text = Runtime.unreachable();

        public func toCandidValue(_value : CreateModerationRequestInput) : Candid.Candid = Runtime.unreachable();

        public func fromCandidValue(_candid : Candid.Candid) : ?CreateModerationRequestInput = Runtime.unreachable();
    };
};
