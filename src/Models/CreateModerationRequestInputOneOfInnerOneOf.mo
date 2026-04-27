/// An object describing an image to classify.

import { type CreateModerationRequestInputOneOfInnerOneOfImageUrl; JSON = CreateModerationRequestInputOneOfInnerOneOfImageUrl } "./CreateModerationRequestInputOneOfInnerOneOfImageUrl";

import { type CreateModerationRequestInputOneOfInnerOneOfType; JSON = CreateModerationRequestInputOneOfInnerOneOfType } "./CreateModerationRequestInputOneOfInnerOneOfType";

// CreateModerationRequestInputOneOfInnerOneOf.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationRequestInputOneOfInnerOneOf = {
        type_ : CreateModerationRequestInputOneOfInnerOneOfType;
        image_url : CreateModerationRequestInputOneOfInnerOneOfImageUrl;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInnerOneOf type
        public type JSON = {
            type_ : CreateModerationRequestInputOneOfInnerOneOfType.JSON;
            image_url : CreateModerationRequestInputOneOfInnerOneOfImageUrl;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInnerOneOf) : JSON = { value with
            type_ = CreateModerationRequestInputOneOfInnerOneOfType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInnerOneOf {
            let ?type_ = CreateModerationRequestInputOneOfInnerOneOfType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateModerationRequestInputOneOfInnerOneOf) : ?Text = null;
    }
}
