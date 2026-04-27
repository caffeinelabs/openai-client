
import { type ChatCompletionRequestMessageContentPartImageImageUrlDetail; JSON = ChatCompletionRequestMessageContentPartImageImageUrlDetail } "./ChatCompletionRequestMessageContentPartImageImageUrlDetail";

// ChatCompletionRequestMessageContentPartImageImageUrl.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartImageImageUrl = {
        /// Either a URL of the image or the base64 encoded image data.
        url : Text;
        detail : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartImageImageUrl type
        public type JSON = {
            url : Text;
            detail : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartImageImageUrl) : JSON = { value with
            detail = do ? { ChatCompletionRequestMessageContentPartImageImageUrlDetail.toJSON(value.detail!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartImageImageUrl {
            ?{ json with
                detail = do ? { ChatCompletionRequestMessageContentPartImageImageUrlDetail.fromJSON(json.detail!)! };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionRequestMessageContentPartImageImageUrl) : ?Text = null;
    }
}
