
import { type CreateImageRequestBackground; JSON = CreateImageRequestBackground } "./CreateImageRequestBackground";

import { type CreateImageRequestModel; JSON = CreateImageRequestModel } "./CreateImageRequestModel";

import { type CreateImageRequestModeration; JSON = CreateImageRequestModeration } "./CreateImageRequestModeration";

import { type CreateImageRequestOutputFormat; JSON = CreateImageRequestOutputFormat } "./CreateImageRequestOutputFormat";

import { type CreateImageRequestQuality; JSON = CreateImageRequestQuality } "./CreateImageRequestQuality";

import { type CreateImageRequestResponseFormat; JSON = CreateImageRequestResponseFormat } "./CreateImageRequestResponseFormat";

import { type CreateImageRequestSize; JSON = CreateImageRequestSize } "./CreateImageRequestSize";

import { type CreateImageRequestStyle; JSON = CreateImageRequestStyle } "./CreateImageRequestStyle";

import Int "mo:core/Int";

// CreateImageRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateImageRequest = {
        /// A text description of the desired image(s). The maximum length is 32000 characters for `gpt-image-1`, 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.
        prompt : Text;
        model : ?CreateImageRequestModel;
        /// The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.
        n : ?Nat;
        quality : ?CreateImageRequestQuality;
        response_format : ?CreateImageRequestResponseFormat;
        output_format : ?CreateImageRequestOutputFormat;
        /// The compression level (0-100%) for the generated images. This parameter is only supported for `gpt-image-1` with the `webp` or `jpeg` output formats, and defaults to 100.
        output_compression : ?Int;
        size : ?CreateImageRequestSize;
        moderation : ?CreateImageRequestModeration;
        background : ?CreateImageRequestBackground;
        style : ?CreateImageRequestStyle;
        /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids). 
        user : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateImageRequest type
        public type JSON = {
            prompt : Text;
            model : ?CreateImageRequestModel;
            n : ?Int;
            quality : ?CreateImageRequestQuality.JSON;
            response_format : ?CreateImageRequestResponseFormat.JSON;
            output_format : ?CreateImageRequestOutputFormat.JSON;
            output_compression : ?Int;
            size : ?CreateImageRequestSize.JSON;
            moderation : ?CreateImageRequestModeration.JSON;
            background : ?CreateImageRequestBackground.JSON;
            style : ?CreateImageRequestStyle.JSON;
            user : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateImageRequest) : JSON = { value with
            quality = do ? { CreateImageRequestQuality.toJSON(value.quality!) };
            response_format = do ? { CreateImageRequestResponseFormat.toJSON(value.response_format!) };
            output_format = do ? { CreateImageRequestOutputFormat.toJSON(value.output_format!) };
            size = do ? { CreateImageRequestSize.toJSON(value.size!) };
            moderation = do ? { CreateImageRequestModeration.toJSON(value.moderation!) };
            background = do ? { CreateImageRequestBackground.toJSON(value.background!) };
            style = do ? { CreateImageRequestStyle.toJSON(value.style!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateImageRequest {
            ?{ json with
                n = switch (json.n) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
                quality = do ? { CreateImageRequestQuality.fromJSON(json.quality!)! };
                response_format = do ? { CreateImageRequestResponseFormat.fromJSON(json.response_format!)! };
                output_format = do ? { CreateImageRequestOutputFormat.fromJSON(json.output_format!)! };
                size = do ? { CreateImageRequestSize.fromJSON(json.size!)! };
                moderation = do ? { CreateImageRequestModeration.fromJSON(json.moderation!)! };
                background = do ? { CreateImageRequestBackground.fromJSON(json.background!)! };
                style = do ? { CreateImageRequestStyle.fromJSON(json.style!)! };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(value : CreateImageRequest) : ?Text {
            switch (value.model) {
                case (?inner) switch (CreateImageRequestModel.validate(inner)) {
                    case (?msg) return ?msg;
                    case null ();
                };
                case null ();
            };
            null
        };
    }
}
