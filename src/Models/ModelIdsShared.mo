
import { type ModelIdsSharedAnyOf; JSON = ModelIdsSharedAnyOf } "./ModelIdsSharedAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ModelIdsShared.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type ModelIdsShared = Text;

    public module JSON {
        public func toCandidValue(value : ModelIdsShared) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?ModelIdsShared =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : ModelIdsShared) : Text = value;
    };
};
