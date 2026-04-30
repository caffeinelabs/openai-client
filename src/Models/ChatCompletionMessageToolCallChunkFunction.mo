import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionMessageToolCallChunkFunction.mo

module {
    /// The required-fields slice of ChatCompletionMessageToolCallChunkFunction — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionMessageToolCallChunkFunction as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        name : ?Text;
        arguments : ?Text;
    };

    public type ChatCompletionMessageToolCallChunkFunction = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionMessageToolCallChunkFunction from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionMessageToolCallChunkFunction.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionMessageToolCallChunkFunction {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionMessageToolCallChunkFunction else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionMessageToolCallChunkFunction) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.arguments) {
                case (?v__) List.add(buf, ("arguments", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCallChunkFunction =
            switch (candid) {
                case (#Record(fields)) {
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let arguments : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "arguments")) {
                        case (?arguments_field) ((switch (arguments_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        name;
                        arguments;
                    };
                };
                case _ null;
            };
    };
};
