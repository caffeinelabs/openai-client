/// ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available. 

import { type CreateTranslationRequestModelAnyOf; JSON = CreateTranslationRequestModelAnyOf } "./CreateTranslationRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateTranslationRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateTranslationRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateTranslationRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslationRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateTranslationRequestModel) : Text = value;
    };
};
