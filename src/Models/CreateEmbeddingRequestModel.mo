/// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them. 

import { type CreateEmbeddingRequestModelAnyOf; JSON = CreateEmbeddingRequestModelAnyOf } "./CreateEmbeddingRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateEmbeddingRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateEmbeddingRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateEmbeddingRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateEmbeddingRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateEmbeddingRequestModel) : Text = value;
    };
};
