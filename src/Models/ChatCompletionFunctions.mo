import { type Map } "mo:core/pure/Map";

// ChatCompletionFunctions.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionFunctions = {
        /// A description of what the function does, used by the model to choose when and how to call the function.
        description : ?Text;
        /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
        name : Text;
        /// The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.   Omitting `parameters` defines a function with an empty parameter list.
        parameters : ?Map<Text, Text>;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionFunctions type
        public type JSON = {
            description : ?Text;
            name : Text;
            parameters : ?Map<Text, Text>;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionFunctions) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionFunctions = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionFunctions) : ?Text = null;
    }
}
