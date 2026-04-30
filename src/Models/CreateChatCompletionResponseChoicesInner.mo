
import { type ChatCompletionResponseMessage; JSON = ChatCompletionResponseMessage } "./ChatCompletionResponseMessage";

import { type CreateChatCompletionResponseChoicesInnerFinishReason; JSON = CreateChatCompletionResponseChoicesInnerFinishReason } "./CreateChatCompletionResponseChoicesInnerFinishReason";

import { type CreateChatCompletionResponseChoicesInnerLogprobs; JSON = CreateChatCompletionResponseChoicesInnerLogprobs } "./CreateChatCompletionResponseChoicesInnerLogprobs";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionResponseChoicesInner.mo

module {
    /// The required-fields slice of CreateChatCompletionResponseChoicesInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        finish_reason : CreateChatCompletionResponseChoicesInnerFinishReason;
        /// The index of the choice in the list of choices.
        index : Int;
        message : ChatCompletionResponseMessage;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateChatCompletionResponseChoicesInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs;
    };

    public type CreateChatCompletionResponseChoicesInner = Required and Optional;

    public module JSON {
        // `init` constructs a CreateChatCompletionResponseChoicesInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateChatCompletionResponseChoicesInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateChatCompletionResponseChoicesInner {
            let ?res = from_candid(to_candid(required)) : ?CreateChatCompletionResponseChoicesInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateChatCompletionResponseChoicesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("finish_reason", CreateChatCompletionResponseChoicesInnerFinishReason.toCandidValue(value.finish_reason)));
            List.add(buf, ("index", #Int(value.index)));
            List.add(buf, ("message", ChatCompletionResponseMessage.toCandidValue(value.message)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", CreateChatCompletionResponseChoicesInnerLogprobs.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?finish_reason_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "finish_reason") else return null;
                    let ?finish_reason = (CreateChatCompletionResponseChoicesInnerFinishReason.fromCandidValue(finish_reason_field.1)) else return null;
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?message_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message") else return null;
                    let ?message = (ChatCompletionResponseMessage.fromCandidValue(message_field.1)) else return null;
                    let logprobs : ?CreateChatCompletionResponseChoicesInnerLogprobs = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) (CreateChatCompletionResponseChoicesInnerLogprobs.fromCandidValue(logprobs_field.1));
                        case null null;
                    };
                    ?{
                        finish_reason;
                        index;
                        message;
                        logprobs;
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
