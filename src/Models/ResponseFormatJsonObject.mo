/// JSON object response format. An older method of generating JSON responses. Using `json_schema` is recommended for models that support it. Note that the model will not generate JSON without a system or user message instructing it to do so. 

import { type ResponseFormatJsonObjectType; JSON = ResponseFormatJsonObjectType } "./ResponseFormatJsonObjectType";

// ResponseFormatJsonObject.mo

module {
    // User-facing type: what application code uses
    public type ResponseFormatJsonObject = {
        type_ : ResponseFormatJsonObjectType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatJsonObject type
        public type JSON = {
            type_ : ResponseFormatJsonObjectType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatJsonObject) : JSON = {
            type_ = ResponseFormatJsonObjectType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatJsonObject {
            let ?type_ = ResponseFormatJsonObjectType.fromJSON(json.type_) else return null;
            ?{
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ResponseFormatJsonObject) : ?Text = null;
    }
}
