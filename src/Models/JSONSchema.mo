/// Structured Outputs configuration options, including a JSON Schema. 
import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// JSONSchema.mo

module {
    /// The required-fields slice of JSONSchema — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The name of the response format. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64. 
        name : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express JSONSchema as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        description : ?Text;
        schema : ?Map<Text, Text>;
        strict : ?Bool;
    };

    public type JSONSchema = Required and Optional;

    public module JSON {
        // `init` constructs a JSONSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { JSONSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : JSONSchema {
            let ?res = from_candid(to_candid(required)) : ?JSONSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : JSONSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            List.add(buf, ("name", #Text(value.name)));
            switch (value.schema) {
                case (?v__) List.add(buf, ("schema", #Record(Array.map<(Text, Text), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Text)) : (Text, Candid.Candid) = (k, #Text(v))))));
                case null ();
            };
            switch (value.strict) {
                case (?v__) List.add(buf, ("strict", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?JSONSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let schema : ?Map<Text, Text> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "schema")) {
                        case (?schema_field) ((switch (schema_field.1) {
                        case (#Record(pairs__)) {
                            let buf__ = List.empty<(Text, Text)>();
                            for ((k__, c__) in pairs__.values()) {
                                let #Text(v__) = c__ else return null;
                                List.add(buf__, (k__, v__));
                            };
                            ?fromIter<Text, Text>(List.toArray(buf__).values(), Text.compare);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let strict : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "strict")) {
                        case (?strict_field) ((switch (strict_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        description;
                        name;
                        schema;
                        strict;
                    };
                };
                case _ null;
            };
    };
};
