
import { type ChatCompletionRequestToolMessageContent; JSON = ChatCompletionRequestToolMessageContent } "./ChatCompletionRequestToolMessageContent";

import { type ChatCompletionRequestToolMessageRole; JSON = ChatCompletionRequestToolMessageRole } "./ChatCompletionRequestToolMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestToolMessage.mo

module {
    /// The required-fields slice of ChatCompletionRequestToolMessage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        role : ChatCompletionRequestToolMessageRole;
        content : ChatCompletionRequestToolMessageContent;
        /// Tool call that this message is responding to.
        tool_call_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestToolMessage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionRequestToolMessage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestToolMessage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestToolMessage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestToolMessage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestToolMessage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestToolMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("role", ChatCompletionRequestToolMessageRole.toCandidValue(value.role)));
            List.add(buf, ("content", ChatCompletionRequestToolMessageContent.toCandidValue(value.content)));
            List.add(buf, ("tool_call_id", #Text(value.tool_call_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestToolMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestToolMessageRole.fromCandidValue(role_field.1)) else return null;
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestToolMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?tool_call_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tool_call_id") else return null;
                    let ?tool_call_id = ((switch (tool_call_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        role;
                        content;
                        tool_call_id;
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
