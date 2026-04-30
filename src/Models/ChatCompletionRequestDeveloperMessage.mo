/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, `developer` messages replace the previous `system` messages. 

import { type ChatCompletionRequestDeveloperMessageContent; JSON = ChatCompletionRequestDeveloperMessageContent } "./ChatCompletionRequestDeveloperMessageContent";

import { type ChatCompletionRequestDeveloperMessageRole; JSON = ChatCompletionRequestDeveloperMessageRole } "./ChatCompletionRequestDeveloperMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestDeveloperMessage.mo

module {
    /// The required-fields slice of ChatCompletionRequestDeveloperMessage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        content : ChatCompletionRequestDeveloperMessageContent;
        role : ChatCompletionRequestDeveloperMessageRole;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestDeveloperMessage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        name : ?Text;
    };

    public type ChatCompletionRequestDeveloperMessage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestDeveloperMessage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestDeveloperMessage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestDeveloperMessage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestDeveloperMessage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestDeveloperMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("content", ChatCompletionRequestDeveloperMessageContent.toCandidValue(value.content)));
            List.add(buf, ("role", ChatCompletionRequestDeveloperMessageRole.toCandidValue(value.role)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestDeveloperMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestDeveloperMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestDeveloperMessageRole.fromCandidValue(role_field.1)) else return null;
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
