/// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them. 

import { type CreateCompletionRequestModelAnyOf; JSON = CreateCompletionRequestModelAnyOf } "./CreateCompletionRequestModelAnyOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateCompletionRequestModel.mo
// anyOf / oneOf where every branch produces a JSON string on the wire — flattened to `Text`.

module {
    public type CreateCompletionRequestModel = Text;

    public module JSON {
        public func toCandidValue(value : CreateCompletionRequestModel) : Candid.Candid = #Text(value);
        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionRequestModel =
            switch (candid) {
                case (#Text(s)) ?s;
                case _ null;
            };
        public func toText(value : CreateCompletionRequestModel) : Text = value;
    };
};
