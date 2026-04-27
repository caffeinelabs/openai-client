/// Describes an OpenAI model offering that can be used with the API.

import { type ModelObject; JSON = ModelObject } "./ModelObject";

// Model.mo

module {
    // User-facing type: what application code uses
    public type Model = {
        /// The model identifier, which can be referenced in the API endpoints.
        id : Text;
        /// The Unix timestamp (in seconds) when the model was created.
        created : Int;
        object_ : ModelObject;
        /// The organization that owns the model.
        owned_by : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Model type
        public type JSON = {
            id : Text;
            created : Int;
            object_ : ModelObject.JSON;
            owned_by : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Model) : JSON = { value with
            object_ = ModelObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Model {
            let ?object_ = ModelObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : Model) : ?Text = null;
    }
}
