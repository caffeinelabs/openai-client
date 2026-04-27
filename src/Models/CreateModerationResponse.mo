/// Represents if a given text input is potentially harmful.

import { type CreateModerationResponseResultsInner; JSON = CreateModerationResponseResultsInner } "./CreateModerationResponseResultsInner";

// CreateModerationResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationResponse = {
        /// The unique identifier for the moderation request.
        id : Text;
        /// The model used to generate the moderation results.
        model : Text;
        /// A list of moderation objects.
        results : [CreateModerationResponseResultsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponse type
        public type JSON = {
            id : Text;
            model : Text;
            results : [CreateModerationResponseResultsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponse = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateModerationResponse) : ?Text = null;
    }
}
