/// JSON Schema response format. Used to generate structured JSON responses. Learn more about [Structured Outputs](/docs/guides/structured-outputs). 

import { type JSONSchema; JSON = JSONSchema } "./JSONSchema";

import { type ResponseFormatJsonSchemaType; JSON = ResponseFormatJsonSchemaType } "./ResponseFormatJsonSchemaType";

// ResponseFormatJsonSchema.mo

module {
    // User-facing type: what application code uses
    public type ResponseFormatJsonSchema = {
        type_ : ResponseFormatJsonSchemaType;
        json_schema : JSONSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatJsonSchema type
        public type JSON = {
            type_ : ResponseFormatJsonSchemaType.JSON;
            json_schema : JSONSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatJsonSchema) : JSON = { value with
            type_ = ResponseFormatJsonSchemaType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatJsonSchema {
            let ?type_ = ResponseFormatJsonSchemaType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
