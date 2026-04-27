
// AssistantsNamedToolChoiceFunction.mo

module {
    // User-facing type: what application code uses
    public type AssistantsNamedToolChoiceFunction = {
        /// The name of the function to call.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AssistantsNamedToolChoiceFunction type
        public type JSON = {
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AssistantsNamedToolChoiceFunction) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AssistantsNamedToolChoiceFunction = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : AssistantsNamedToolChoiceFunction) : ?Text = null;
    }
}
