/// An object describing text to classify.

import { type CreateModerationRequestInputOneOfInnerOneOf1Type; JSON = CreateModerationRequestInputOneOfInnerOneOf1Type } "./CreateModerationRequestInputOneOfInnerOneOf1Type";

// CreateModerationRequestInputOneOfInnerOneOf1.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationRequestInputOneOfInnerOneOf1 = {
        type_ : CreateModerationRequestInputOneOfInnerOneOf1Type;
        /// A string of text to classify.
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInnerOneOf1 type
        public type JSON = {
            type_ : CreateModerationRequestInputOneOfInnerOneOf1Type.JSON;
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInnerOneOf1) : JSON = { value with
            type_ = CreateModerationRequestInputOneOfInnerOneOf1Type.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInnerOneOf1 {
            let ?type_ = CreateModerationRequestInputOneOfInnerOneOf1Type.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateModerationRequestInputOneOfInnerOneOf1) : ?Text = null;
    }
}
