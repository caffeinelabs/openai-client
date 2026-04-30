
import { type ChatCompletionMessageToolCallFunction; JSON = ChatCompletionMessageToolCallFunction } "./ChatCompletionMessageToolCallFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionMessageToolCall.mo

module {
    /// The required-fields slice of ChatCompletionMessageToolCall — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The ID of the tool call.
        id : Text;
        type_ : ChatCompletionMessageToolCallType;
        function : ChatCompletionMessageToolCallFunction;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionMessageToolCall as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionMessageToolCall = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionMessageToolCall from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionMessageToolCall.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionMessageToolCall {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionMessageToolCall else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionMessageToolCall) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(value.type_)));
            List.add(buf, ("function", ChatCompletionMessageToolCallFunction.toCandidValue(value.function)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCall =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1)) else return null;
                    let ?function_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function") else return null;
                    let ?function = (ChatCompletionMessageToolCallFunction.fromCandidValue(function_field.1)) else return null;
                    ?{
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
