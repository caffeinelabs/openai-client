
import { type CreateEmbeddingRequestEncodingFormat; JSON = CreateEmbeddingRequestEncodingFormat } "./CreateEmbeddingRequestEncodingFormat";

import { type CreateEmbeddingRequestInput; JSON = CreateEmbeddingRequestInput } "./CreateEmbeddingRequestInput";

import { type CreateEmbeddingRequestModel; JSON = CreateEmbeddingRequestModel } "./CreateEmbeddingRequestModel";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// CreateEmbeddingRequest.mo

module {
    /// The required-fields slice of CreateEmbeddingRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        input : CreateEmbeddingRequestInput;
        model : CreateEmbeddingRequestModel;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateEmbeddingRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        encoding_format : ?CreateEmbeddingRequestEncodingFormat;
        dimensions : ?Nat;
        user : ?Text;
    };

    public type CreateEmbeddingRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateEmbeddingRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateEmbeddingRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateEmbeddingRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateEmbeddingRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateEmbeddingRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("input", CreateEmbeddingRequestInput.toCandidValue(value.input)));
            List.add(buf, ("model", CreateEmbeddingRequestModel.toCandidValue(value.model)));
            switch (value.encoding_format) {
                case (?v__) List.add(buf, ("encoding_format", CreateEmbeddingRequestEncodingFormat.toCandidValue(v__)));
                case null ();
            };
            switch (value.dimensions) {
                case (?v__) List.add(buf, ("dimensions", #Nat(v__)));
                case null ();
            };
            switch (value.user) {
                case (?v__) List.add(buf, ("user", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?input_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input") else return null;
                    let ?input = (CreateEmbeddingRequestInput.fromCandidValue(input_field.1)) else return null;
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = (CreateEmbeddingRequestModel.fromCandidValue(model_field.1)) else return null;
                    let encoding_format : ?CreateEmbeddingRequestEncodingFormat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoding_format")) {
                        case (?encoding_format_field) (CreateEmbeddingRequestEncodingFormat.fromCandidValue(encoding_format_field.1));
                        case null null;
                    };
                    let dimensions : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dimensions")) {
                        case (?dimensions_field) ((switch (dimensions_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let user : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user")) {
                        case (?user_field) ((switch (user_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        input;
                        model;
                        encoding_format;
                        dimensions;
                        user;
                    };
                };
                case _ null;
            };
    };
};
