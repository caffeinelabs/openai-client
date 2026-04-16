/// Learn about [image inputs](/docs/guides/vision). 

import { type ChatCompletionRequestMessageContentPartImageImageUrl; JSON = ChatCompletionRequestMessageContentPartImageImageUrl } "./ChatCompletionRequestMessageContentPartImageImageUrl";

import { type ChatCompletionRequestMessageContentPartImageType; JSON = ChatCompletionRequestMessageContentPartImageType } "./ChatCompletionRequestMessageContentPartImageType";

// ChatCompletionRequestMessageContentPartImage.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionRequestMessageContentPartImage = {
        type_ : ChatCompletionRequestMessageContentPartImageType;
        image_url : ChatCompletionRequestMessageContentPartImageImageUrl;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionRequestMessageContentPartImage type
        public type JSON = {
            type_ : ChatCompletionRequestMessageContentPartImageType.JSON;
            image_url : ChatCompletionRequestMessageContentPartImageImageUrl.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionRequestMessageContentPartImage) : JSON = {
            type_ = ChatCompletionRequestMessageContentPartImageType.toJSON(value.type_);
            image_url = ChatCompletionRequestMessageContentPartImageImageUrl.toJSON(value.image_url);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionRequestMessageContentPartImage {
            let ?type_ = ChatCompletionRequestMessageContentPartImageType.fromJSON(json.type_) else return null;
            let ?image_url = ChatCompletionRequestMessageContentPartImageImageUrl.fromJSON(json.image_url) else return null;
            ?{
                type_;
                image_url;
            }
        };
    }
}
