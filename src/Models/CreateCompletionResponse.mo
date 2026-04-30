/// Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint). 

import { type CompletionUsage; JSON = CompletionUsage } "./CompletionUsage";

import { type CreateCompletionResponseChoicesInner; JSON = CreateCompletionResponseChoicesInner } "./CreateCompletionResponseChoicesInner";

import { type CreateCompletionResponseObject; JSON = CreateCompletionResponseObject } "./CreateCompletionResponseObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateCompletionResponse.mo

module {
    /// The required-fields slice of CreateCompletionResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A unique identifier for the completion.
        id : Text;
        /// The list of completion choices the model generated for the input prompt.
        choices : [CreateCompletionResponseChoicesInner];
        /// The Unix timestamp (in seconds) of when the completion was created.
        created : Int;
        /// The model used for completion.
        model : Text;
        object_ : CreateCompletionResponseObject;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateCompletionResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        system_fingerprint : ?Text;
        usage : ?CompletionUsage;
    };

    public type CreateCompletionResponse = Required and Optional;

    public module JSON {
        // `init` constructs a CreateCompletionResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateCompletionResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateCompletionResponse {
            let ?res = from_candid(to_candid(required)) : ?CreateCompletionResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateCompletionResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("choices", #Array(Array.map<CreateCompletionResponseChoicesInner, Candid.Candid>(value.choices, CreateCompletionResponseChoicesInner.toCandidValue))));
            List.add(buf, ("created", #Int(value.created)));
            List.add(buf, ("model", #Text(value.model)));
            switch (value.system_fingerprint) {
                case (?v__) List.add(buf, ("system_fingerprint", #Text(v__)));
                case null ();
            };
            List.add(buf, ("object", CreateCompletionResponseObject.toCandidValue(value.object_)));
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", CompletionUsage.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?choices_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "choices") else return null;
                    let ?choices = ((switch (choices_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateCompletionResponseChoicesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateCompletionResponseChoicesInner.fromCandidValue(c__) else return null;
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
                    let system_fingerprint : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "system_fingerprint")) {
                        case (?system_fingerprint_field) ((switch (system_fingerprint_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (CreateCompletionResponseObject.fromCandidValue(object__field.1)) else return null;
                    let usage : ?CompletionUsage = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) (CompletionUsage.fromCandidValue(usage_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        choices;
                        created;
                        model;
                        system_fingerprint;
                        object_;
                        usage;
                    };
                };
                case _ null;
            };
    };
};
