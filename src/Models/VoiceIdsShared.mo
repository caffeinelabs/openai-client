
import { type VoiceIdsSharedAnyOf; JSON = VoiceIdsSharedAnyOf } "./VoiceIdsSharedAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// VoiceIdsShared.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type VoiceIdsShared = Text;

    public module JSON {
        public func toCandidValue(value : VoiceIdsShared) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?VoiceIdsShared =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : VoiceIdsShared) : Text = value;
    };
};
