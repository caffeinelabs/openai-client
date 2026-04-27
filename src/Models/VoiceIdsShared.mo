
import { type VoiceIdsSharedAnyOf; JSON = VoiceIdsSharedAnyOf } "./VoiceIdsSharedAnyOf";

// VoiceIdsShared.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type VoiceIdsShared = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : VoiceIdsShared) : JSON = value;
        public func fromJSON(json : JSON) : ?VoiceIdsShared = ?json;

        public func validate(_value : VoiceIdsShared) : ?Text = null;
    }
}
