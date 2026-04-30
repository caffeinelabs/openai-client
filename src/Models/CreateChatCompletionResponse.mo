/// Represents a chat completion response returned by model, based on the provided input.

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateChatCompletionResponseChoicesInner; JSON = CreateChatCompletionResponseChoicesInner } "./CreateChatCompletionResponseChoicesInner";

import { type CreateChatCompletionResponseObject; JSON = CreateChatCompletionResponseObject } "./CreateChatCompletionResponseObject";

import { type ServiceTier; JSON = ServiceTier } "./ServiceTier";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionResponse.mo

module {
    /// The required-fields slice of CreateChatCompletionResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A unique identifier for the chat completion.
        id : Text;
        /// A list of chat completion choices. Can be more than one if `n` is greater than 1.
        choices : [CreateChatCompletionResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the chat completion was created.
        created : Int;
        /// The model used for the chat completion.
        model : Text;
        object_ : CreateChatCompletionResponseObject;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateChatCompletionResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        service_tier : ?ServiceTier;
        system_fingerprint : ?Text;
        usage : ?CompletionUsage;
    };

    public type CreateChatCompletionResponse = Required and Optional;

    public module JSON {
        // `init` constructs a CreateChatCompletionResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateChatCompletionResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateChatCompletionResponse {
            let ?res = from_candid(to_candid(required)) : ?CreateChatCompletionResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateChatCompletionResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("choices", #Array(Array.map<CreateChatCompletionResponseChoicesInner, Candid.Candid>(value.choices, CreateChatCompletionResponseChoicesInner.toCandidValue))));
            List.add(buf, ("created", #Int(value.created)));
            List.add(buf, ("model", #Text(value.model)));
            switch (value.service_tier) {
                case (?v__) List.add(buf, ("service_tier", ServiceTier.toCandidValue(v__)));
                case null ();
            };
            switch (value.system_fingerprint) {
                case (?v__) List.add(buf, ("system_fingerprint", #Text(v__)));
                case null ();
            };
            List.add(buf, ("object", CreateChatCompletionResponseObject.toCandidValue(value.object_)));
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", CompletionUsage.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?choices_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "choices") else return null;
                    let ?choices = ((switch (choices_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateChatCompletionResponseChoicesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateChatCompletionResponseChoicesInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?created_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created") else return null;
                    let ?created = ((switch (created_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = ((switch (model_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let service_tier : ?ServiceTier = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "service_tier")) {
                        case (?service_tier_field) (ServiceTier.fromCandidValue(service_tier_field.1));
                        case null null;
                    };
                    let system_fingerprint : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "system_fingerprint")) {
                        case (?system_fingerprint_field) ((switch (system_fingerprint_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (CreateChatCompletionResponseObject.fromCandidValue(object__field.1)) else return null;
                    let usage : ?CompletionUsage = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) (CompletionUsage.fromCandidValue(usage_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        choices;
                        created;
                        model;
                        service_tier;
                        system_fingerprint;
                        object_;
                        usage;
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
