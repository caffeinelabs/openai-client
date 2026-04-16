/// An object specifying the format that the model must output.  Setting to `{ \"type\": \"json_schema\", \"json_schema\": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).  Setting to `{ \"type\": \"json_object\" }` enables the older JSON mode, which ensures the message the model generates is valid JSON. Using `json_schema` is preferred for models that support it. 

import { type JSONSchema; JSON = JSONSchema } "./JSONSchema";

import { type ResponseFormatJsonObject; JSON = ResponseFormatJsonObject } "./ResponseFormatJsonObject";

import { type ResponseFormatJsonObjectType; JSON = ResponseFormatJsonObjectType } "./ResponseFormatJsonObjectType";

import { type ResponseFormatJsonSchema; JSON = ResponseFormatJsonSchema } "./ResponseFormatJsonSchema";

import { type ResponseFormatText; JSON = ResponseFormatText } "./ResponseFormatText";

// CreateChatCompletionRequestAllOfResponseFormat.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateChatCompletionRequestAllOfResponseFormat = {
        #ResponseFormatText : ResponseFormatText;
        #ResponseFormatJsonSchema : ResponseFormatJsonSchema;
        #ResponseFormatJsonObject : ResponseFormatJsonObject;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateChatCompletionRequestAllOfResponseFormat) : Text =
            switch (value) {
                case (#ResponseFormatText(v)) Runtime.unreachable();
                case (#ResponseFormatJsonSchema(v)) Runtime.unreachable();
                case (#ResponseFormatJsonObject(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionRequestAllOfResponseFormat type
        public type JSON = {
            #ResponseFormatText : ResponseFormatText;
            #ResponseFormatJsonSchema : ResponseFormatJsonSchema;
            #ResponseFormatJsonObject : ResponseFormatJsonObject;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionRequestAllOfResponseFormat) : JSON =
            switch (value) {
                case (#ResponseFormatText(v)) #ResponseFormatText(v);
                case (#ResponseFormatJsonSchema(v)) #ResponseFormatJsonSchema(v);
                case (#ResponseFormatJsonObject(v)) #ResponseFormatJsonObject(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionRequestAllOfResponseFormat =
            switch (json) {
                case (#ResponseFormatText(v)) ?#ResponseFormatText(v);
                case (#ResponseFormatJsonSchema(v)) ?#ResponseFormatJsonSchema(v);
                case (#ResponseFormatJsonObject(v)) ?#ResponseFormatJsonObject(v);
            };
    }
}
