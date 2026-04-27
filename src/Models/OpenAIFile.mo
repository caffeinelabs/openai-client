/// The `File` object represents a document that has been uploaded to OpenAI.

import { type OpenAIFileObject; JSON = OpenAIFileObject } "./OpenAIFileObject";

import { type OpenAIFilePurpose; JSON = OpenAIFilePurpose } "./OpenAIFilePurpose";

import { type OpenAIFileStatus; JSON = OpenAIFileStatus } "./OpenAIFileStatus";

// OpenAIFile.mo

module {
    // User-facing type: what application code uses
    public type OpenAIFile = {
        /// The file identifier, which can be referenced in the API endpoints.
        id : Text;
        /// The size of the file, in bytes.
        bytes : Int;
        /// The Unix timestamp (in seconds) for when the file was created.
        created_at : Int;
        /// The Unix timestamp (in seconds) for when the file will expire.
        expires_at : ?Int;
        /// The name of the file.
        filename : Text;
        object_ : OpenAIFileObject;
        purpose : OpenAIFilePurpose;
        status : OpenAIFileStatus;
        /// Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine_tuning.job`.
        status_details : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer OpenAIFile type
        public type JSON = {
            id : Text;
            bytes : Int;
            created_at : Int;
            expires_at : ?Int;
            filename : Text;
            object_ : OpenAIFileObject.JSON;
            purpose : OpenAIFilePurpose.JSON;
            status : OpenAIFileStatus.JSON;
            status_details : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : OpenAIFile) : JSON = { value with
            object_ = OpenAIFileObject.toJSON(value.object_);
            purpose = OpenAIFilePurpose.toJSON(value.purpose);
            status = OpenAIFileStatus.toJSON(value.status);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?OpenAIFile {
            let ?object_ = OpenAIFileObject.fromJSON(json.object_) else return null;
            let ?purpose = OpenAIFilePurpose.fromJSON(json.purpose) else return null;
            let ?status = OpenAIFileStatus.fromJSON(json.status) else return null;
            ?{ json with
                object_;
                purpose;
                status;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : OpenAIFile) : ?Text = null;
    }
}
