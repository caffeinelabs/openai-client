/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, use `developer` messages for this purpose instead. 

import { type ChatCompletionRequestSystemMessageContent; JSON = ChatCompletionRequestSystemMessageContent } "./ChatCompletionRequestSystemMessageContent";

import { type ChatCompletionRequestSystemMessageRole; JSON = ChatCompletionRequestSystemMessageRole } "./ChatCompletionRequestSystemMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestSystemMessage.mo

module {
    /// The required-fields slice of ChatCompletionRequestSystemMessage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        content : ChatCompletionRequestSystemMessageContent;
        role : ChatCompletionRequestSystemMessageRole;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestSystemMessage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        name : ?Text;
    };

    public type ChatCompletionRequestSystemMessage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestSystemMessage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestSystemMessage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestSystemMessage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestSystemMessage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestSystemMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("content", ChatCompletionRequestSystemMessageContent.toCandidValue(value.content)));
            List.add(buf, ("role", ChatCompletionRequestSystemMessageRole.toCandidValue(value.role)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestSystemMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestSystemMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestSystemMessageRole.fromCandidValue(role_field.1)) else return null;
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        content;
                        role;
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
