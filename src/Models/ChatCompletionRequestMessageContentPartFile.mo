/// Learn about [file inputs](/docs/guides/text) for text generation. 

import { type ChatCompletionRequestMessageContentPartFileFile; JSON = ChatCompletionRequestMessageContentPartFileFile } "./ChatCompletionRequestMessageContentPartFileFile";

import { type ChatCompletionRequestMessageContentPartFileType; JSON = ChatCompletionRequestMessageContentPartFileType } "./ChatCompletionRequestMessageContentPartFileType";

// ChatCompletionRequestMessageContentPartFile.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartFile = {
        type_ : ChatCompletionRequestMessageContentPartFileType;
        file : ChatCompletionRequestMessageContentPartFileFile;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartFile type
        public type JSON = {
            type_ : ChatCompletionRequestMessageContentPartFileType.JSON;
            file : ChatCompletionRequestMessageContentPartFileFile;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartFile) : JSON = { value with
            type_ = ChatCompletionRequestMessageContentPartFileType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartFile {
            let ?type_ = ChatCompletionRequestMessageContentPartFileType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestMessageContentPartFile) : ?Text = null;
    }
}
