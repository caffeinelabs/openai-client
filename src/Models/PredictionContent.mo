/// Static predicted output content, such as the content of a text file that is being regenerated. 

import { type PredictionContentContent; JSON = PredictionContentContent } "./PredictionContentContent";

import { type PredictionContentType; JSON = PredictionContentType } "./PredictionContentType";

// PredictionContent.mo

module {
    // User-facing type: what application code uses
    public type PredictionContent = {
        type_ : PredictionContentType;
        content : PredictionContentContent;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PredictionContent type
        public type JSON = {
            type_ : PredictionContentType.JSON;
            content : PredictionContentContent;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PredictionContent) : JSON = { value with
            type_ = PredictionContentType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PredictionContent {
            let ?type_ = PredictionContentType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
