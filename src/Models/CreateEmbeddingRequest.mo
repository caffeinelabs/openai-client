
import { type CreateEmbeddingRequestEncodingFormat; JSON = CreateEmbeddingRequestEncodingFormat } "./CreateEmbeddingRequestEncodingFormat";

import { type CreateEmbeddingRequestInput; JSON = CreateEmbeddingRequestInput } "./CreateEmbeddingRequestInput";

import { type CreateEmbeddingRequestModel; JSON = CreateEmbeddingRequestModel } "./CreateEmbeddingRequestModel";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Int "mo:core/Int";

// CreateEmbeddingRequest.mo

module {
    public type CreateEmbeddingRequest = {
        input : CreateEmbeddingRequestInput;
        model : CreateEmbeddingRequestModel;
        encoding_format : ?CreateEmbeddingRequestEncodingFormat;
        /// The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models. 
        dimensions : ?Nat;
        /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids). 
        user : ?Text;
    };

    public module JSON {
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
