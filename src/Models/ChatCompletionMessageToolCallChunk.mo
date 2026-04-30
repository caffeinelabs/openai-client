
import { type ChatCompletionMessageToolCallChunkFunction; JSON = ChatCompletionMessageToolCallChunkFunction } "./ChatCompletionMessageToolCallChunkFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionMessageToolCallChunk.mo

module {
    /// The required-fields slice of ChatCompletionMessageToolCallChunk — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        index : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionMessageToolCallChunk as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        id : ?Text;
        type_ : ?ChatCompletionMessageToolCallType;
        function : ?ChatCompletionMessageToolCallChunkFunction;
    };

    public type ChatCompletionMessageToolCallChunk = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionMessageToolCallChunk from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionMessageToolCallChunk.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionMessageToolCallChunk {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionMessageToolCallChunk else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionMessageToolCallChunk) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("index", #Int(value.index)));
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.type_) {
                case (?v__) List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(v__)));
                case null ();
            };
            switch (value.function) {
                case (?v__) List.add(buf, ("function", ChatCompletionMessageToolCallChunkFunction.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCallChunk =
            switch (candid) {
                case (#Record(fields)) {
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let type_ : ?ChatCompletionMessageToolCallType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type")) {
                        case (?type__field) (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1));
                        case null null;
                    };
                    let function : ?ChatCompletionMessageToolCallChunkFunction = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function")) {
                        case (?function_field) (ChatCompletionMessageToolCallChunkFunction.fromCandidValue(function_field.1));
                        case null null;
                    };
                    ?{
                        index;
                        id;
                        type_;
                        function;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
