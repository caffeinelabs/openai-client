/// Represents a streamed chunk of a chat completion response returned by the model, based on the provided input.  [Learn more](/docs/guides/streaming-responses). 

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateChatCompletionStreamResponseChoicesInner; JSON = CreateChatCompletionStreamResponseChoicesInner } "./CreateChatCompletionStreamResponseChoicesInner";

import { type CreateChatCompletionStreamResponseObject; JSON = CreateChatCompletionStreamResponseObject } "./CreateChatCompletionStreamResponseObject";

import { type ServiceTier; JSON = ServiceTier } "./ServiceTier";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionStreamResponse.mo

module {
    /// The required-fields slice of CreateChatCompletionStreamResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A unique identifier for the chat completion. Each chunk has the same ID.
        id : Text;
        /// A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the last chunk if you set `stream_options: {\"include_usage\": true}`. 
        choices : [CreateChatCompletionStreamResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
        created : Int;
        /// The model to generate the completion.
        model : Text;
        object_ : CreateChatCompletionStreamResponseObject;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateChatCompletionStreamResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        service_tier : ?ServiceTier;
        system_fingerprint : ?Text;
        usage : ?CompletionUsage;
    };

    public type CreateChatCompletionStreamResponse = Required and Optional;

    public module JSON {
        // `init` constructs a CreateChatCompletionStreamResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateChatCompletionStreamResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateChatCompletionStreamResponse {
            let ?res = from_candid(to_candid(required)) : ?CreateChatCompletionStreamResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateChatCompletionStreamResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("choices", #Array(Array.map<CreateChatCompletionStreamResponseChoicesInner, Candid.Candid>(value.choices, CreateChatCompletionStreamResponseChoicesInner.toCandidValue))));
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
            List.add(buf, ("object", CreateChatCompletionStreamResponseObject.toCandidValue(value.object_)));
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", CompletionUsage.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionStreamResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?choices_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "choices") else return null;
                    let ?choices = ((switch (choices_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateChatCompletionStreamResponseChoicesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateChatCompletionStreamResponseChoicesInner.fromCandidValue(c__) else return null;
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
                    let ?object_ = (CreateChatCompletionStreamResponseObject.fromCandidValue(object__field.1)) else return null;
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
};
