/// The content moderation model you would like to use. Learn more in [the moderation guide](/docs/guides/moderation), and learn about available models [here](/docs/models#moderation). 

import { type CreateModerationRequestModelAnyOf; JSON = CreateModerationRequestModelAnyOf } "./CreateModerationRequestModelAnyOf";

// CreateModerationRequestModel.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationRequestModel = {
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestModel type
        public type JSON = {
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestModel) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestModel = ?json;
    }
}
