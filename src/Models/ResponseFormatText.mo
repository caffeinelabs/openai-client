/// Default response format. Used to generate text responses. 

import { type ResponseFormatTextType; JSON = ResponseFormatTextType } "./ResponseFormatTextType";

// ResponseFormatText.mo

module {
    // User-facing type: what application code uses
    public type ResponseFormatText = {
        type_ : ResponseFormatTextType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResponseFormatText type
        public type JSON = {
            type_ : ResponseFormatTextType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResponseFormatText) : JSON = {
            type_ = ResponseFormatTextType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResponseFormatText {
            let ?type_ = ResponseFormatTextType.fromJSON(json.type_) else return null;
            ?{
                type_;
            }
        };
    }
}
