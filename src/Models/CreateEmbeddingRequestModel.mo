/// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them. 

import { type CreateEmbeddingRequestModelAnyOf; JSON = CreateEmbeddingRequestModelAnyOf } "./CreateEmbeddingRequestModelAnyOf";

// CreateEmbeddingRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened
// to `Text` directly so `to_candid` doesn't wrap the value as `{"<tag>": …}`.

module {
    public type CreateEmbeddingRequestModel = Text;

    public module JSON {
        public type JSON = Text;

        public func toJSON(value : CreateEmbeddingRequestModel) : JSON = value;
        public func fromJSON(json : JSON) : ?CreateEmbeddingRequestModel = ?json;

        public func validate(_value : CreateEmbeddingRequestModel) : ?Text = null;
    }
}
