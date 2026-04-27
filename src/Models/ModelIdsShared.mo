
import { type ModelIdsSharedAnyOf; JSON = ModelIdsSharedAnyOf } "./ModelIdsSharedAnyOf";

// ModelIdsShared.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type ModelIdsShared = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : ModelIdsShared) : JSON = value;
        public func fromJSON(json : JSON) : ?ModelIdsShared = ?json;

        public func validate(_value : ModelIdsShared) : ?Text = null;
    }
}
