/// One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd` or `gpt-4o-mini-tts`. 

import { type CreateSpeechRequestModelAnyOf; JSON = CreateSpeechRequestModelAnyOf } "./CreateSpeechRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateSpeechRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateSpeechRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateSpeechRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateSpeechRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateSpeechRequestModel) : Text = value;
    };
};
