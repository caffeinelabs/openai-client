
import { type ListAuditLogsResponseObject; JSON = ListAuditLogsResponseObject } "./ListAuditLogsResponseObject";

import { type Model; JSON = Model } "./Model";

// ListModelsResponse.mo

module {
    // User-facing type: what application code uses
    public type ListModelsResponse = {
        object_ : ListAuditLogsResponseObject;
        data : [Model];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListModelsResponse type
        public type JSON = {
            object_ : ListAuditLogsResponseObject.JSON;
            data : [Model];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListModelsResponse) : JSON = { value with
            object_ = ListAuditLogsResponseObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListModelsResponse {
            let ?object_ = ListAuditLogsResponseObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };
    }
}
