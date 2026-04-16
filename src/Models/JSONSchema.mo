/// Structured Outputs configuration options, including a JSON Schema. 
import { type Map } "mo:core/pure/Map";

// JSONSchema.mo

module {
    // User-facing type: what application code uses
    public type JSONSchema = {
        /// A description of what the response format is for, used by the model to determine how to respond in the format. 
        description : ?Text;
        /// The name of the response format. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64. 
        name : Text;
        /// The schema for the response format, described as a JSON Schema object. Learn how to build JSON schemas [here](https://json-schema.org/). 
        schema : ?Map<Text, Text>;
        /// Whether to enable strict schema adherence when generating the output. If set to true, the model will always follow the exact schema defined in the `schema` field. Only a subset of JSON Schema is supported when `strict` is `true`. To learn more, read the [Structured Outputs guide](/docs/guides/structured-outputs). 
        strict : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer JSONSchema type
        public type JSON = {
            description : ?Text;
            name : Text;
            schema : ?Map<Text, Text>;
            strict : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : JSONSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?JSONSchema = ?json;
    }
}
