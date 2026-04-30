/// Log probability information for the choice.

import { type ChatCompletionTokenLogprob; JSON = ChatCompletionTokenLogprob } "./ChatCompletionTokenLogprob";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionResponseChoicesInnerLogprobs.mo

module {
    /// The required-fields slice of CreateChatCompletionResponseChoicesInnerLogprobs — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateChatCompletionResponseChoicesInnerLogprobs as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        content : ?[ChatCompletionTokenLogprob];
        refusal : ?[ChatCompletionTokenLogprob];
    };

    public type CreateChatCompletionResponseChoicesInnerLogprobs = Required and Optional;

    public module JSON {
        // `init` constructs a CreateChatCompletionResponseChoicesInnerLogprobs from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateChatCompletionResponseChoicesInnerLogprobs.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateChatCompletionResponseChoicesInnerLogprobs {
            let ?res = from_candid(to_candid(required)) : ?CreateChatCompletionResponseChoicesInnerLogprobs else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateChatCompletionResponseChoicesInnerLogprobs) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.content) {
                case (?v__) List.add(buf, ("content", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(v__, ChatCompletionTokenLogprob.toCandidValue))));
                case null ();
            };
            switch (value.refusal) {
                case (?v__) List.add(buf, ("refusal", #Array(Array.map<ChatCompletionTokenLogprob, Candid.Candid>(v__, ChatCompletionTokenLogprob.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInnerLogprobs =
            switch (candid) {
                case (#Record(fields)) {
                    let content : ?[ChatCompletionTokenLogprob] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content")) {
                        case (?content_field) ((switch (content_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let refusal : ?[ChatCompletionTokenLogprob] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "refusal")) {
                        case (?refusal_field) ((switch (refusal_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTokenLogprob>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTokenLogprob.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        content;
                        refusal;
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
