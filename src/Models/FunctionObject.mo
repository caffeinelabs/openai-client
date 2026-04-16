import { type Map } "mo:core/pure/Map";

// FunctionObject.mo

module {
    // User-facing type: what application code uses
    public type FunctionObject = {
        /// A description of what the function does, used by the model to choose when and how to call the function.
        description : ?Text;
        /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
        name : Text;
        /// The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.   Omitting `parameters` defines a function with an empty parameter list.
        parameters : ?Map<Text, Text>;
        /// Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](docs/guides/function-calling).
        strict : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FunctionObject type
        public type JSON = {
            description : ?Text;
            name : Text;
            parameters : ?Map<Text, Text>;
            strict : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FunctionObject) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FunctionObject = ?json;
    }
}
