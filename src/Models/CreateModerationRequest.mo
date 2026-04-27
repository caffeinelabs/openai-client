
import { type CreateModerationRequestInput; JSON = CreateModerationRequestInput } "./CreateModerationRequestInput";

import { type CreateModerationRequestModel; JSON = CreateModerationRequestModel } "./CreateModerationRequestModel";

// CreateModerationRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationRequest = {
        input : CreateModerationRequestInput;
        model : ?CreateModerationRequestModel;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequest type
        public type JSON = {
            input : CreateModerationRequestInput;
            model : ?CreateModerationRequestModel;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequest = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(value : CreateModerationRequest) : ?Text {
            switch (value.model) {
                case (?inner) switch (CreateModerationRequestModel.validate(inner)) {
                    case (?msg) return ?msg;
                    case null ();
                };
                case null ();
            };
            null
        };
    }
}
