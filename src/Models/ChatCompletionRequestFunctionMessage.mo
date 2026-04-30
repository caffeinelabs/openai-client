
import { type ChatCompletionRequestFunctionMessageRole; JSON = ChatCompletionRequestFunctionMessageRole } "./ChatCompletionRequestFunctionMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestFunctionMessage.mo

module {
    /// The required-fields slice of ChatCompletionRequestFunctionMessage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        role : ChatCompletionRequestFunctionMessageRole;
        /// The name of the function to call.
        name : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestFunctionMessage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        content : ?Text;
    };

    public type ChatCompletionRequestFunctionMessage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestFunctionMessage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestFunctionMessage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestFunctionMessage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestFunctionMessage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestFunctionMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("role", ChatCompletionRequestFunctionMessageRole.toCandidValue(value.role)));
            switch (value.content) {
                case (?v__) List.add(buf, ("content", #Text(v__)));
                case null ();
            };
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestFunctionMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestFunctionMessageRole.fromCandidValue(role_field.1)) else return null;
                    let content : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content")) {
                        case (?content_field) ((switch (content_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        role;
                        content;
                        name;
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
