/// Describes an OpenAI model offering that can be used with the API.

import { type ModelObject; JSON = ModelObject } "./ModelObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Model.mo

module {
    /// The required-fields slice of Model — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The model identifier, which can be referenced in the API endpoints.
        id : Text;
        /// The Unix timestamp (in seconds) when the model was created.
        created : Int;
        object_ : ModelObject;
        /// The organization that owns the model.
        owned_by : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Model as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type Model = Required and Optional;

    public module JSON {
        // `init` constructs a Model from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Model.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Model {
            let ?res = from_candid(to_candid(required)) : ?Model else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Model) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("created", #Int(value.created)));
            List.add(buf, ("object", ModelObject.toCandidValue(value.object_)));
            List.add(buf, ("owned_by", #Text(value.owned_by)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Model =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?created_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created") else return null;
                    let ?created = ((switch (created_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (ModelObject.fromCandidValue(object__field.1)) else return null;
                    let ?owned_by_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "owned_by") else return null;
                    let ?owned_by = ((switch (owned_by_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                        created;
                        object_;
                        owned_by;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
