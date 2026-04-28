/// ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1` (which is powered by our open source Whisper V2 model). 

import { type CreateTranscriptionRequestModelAnyOf; JSON = CreateTranscriptionRequestModelAnyOf } "./CreateTranscriptionRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranscriptionRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateTranscriptionRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateTranscriptionRequestModel) : Text = value;
    };
};
