// ImagesApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Nat "mo:core/Nat";
import Iter "mo:core/Iter";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import List "mo:core/List";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import Char "mo:core/Char";
import Nat8 "mo:core/Nat8";
import Nat32 "mo:core/Nat32";
import { JSON; Candid } "mo:serde-core";
import { type CreateImageEditRequestImage; JSON = CreateImageEditRequestImage } "../Models/CreateImageEditRequestImage";
import { type CreateImageEditRequestModel; JSON = CreateImageEditRequestModel } "../Models/CreateImageEditRequestModel";
import { type CreateImageEditRequestQuality; JSON = CreateImageEditRequestQuality } "../Models/CreateImageEditRequestQuality";
import { type CreateImageEditRequestResponseFormat; JSON = CreateImageEditRequestResponseFormat } "../Models/CreateImageEditRequestResponseFormat";
import { type CreateImageEditRequestSize; JSON = CreateImageEditRequestSize } "../Models/CreateImageEditRequestSize";
import { type CreateImageRequest; JSON = CreateImageRequest } "../Models/CreateImageRequest";
import { type CreateImageVariationRequestModel; JSON = CreateImageVariationRequestModel } "../Models/CreateImageVariationRequestModel";
import { type CreateImageVariationRequestResponseFormat; JSON = CreateImageVariationRequestResponseFormat } "../Models/CreateImageVariationRequestResponseFormat";
import { type CreateImageVariationRequestSize; JSON = CreateImageVariationRequestSize } "../Models/CreateImageVariationRequestSize";
import { type ImagesResponse; JSON = ImagesResponse } "../Models/ImagesResponse";
import { type Config; _Helpers; _Ic } "../Config";

module {
        // mo:core/Base64 provides `decode` (caffeinelabs/motoko-core#507); alias it
        // instead of inlining. `_`-prefixed so it never triggers an unused-identifier
        // warning in modules that import Base64 only for encoding.
        let _decode = Base64.decode;

    /// Creates an image given a prompt. [Learn more](/docs/guides/images). 
    public func createImage(config : Config, createImageRequest : CreateImageRequest) : async* ImagesResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/generations";

        // Add API key as query parameter if using apiKey auth
        let url__ = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<_Ic.HttpHeader>([
            baseHeaders,
            authHeaders
        ]);

        let request : _Ic.HttpRequestArgs = { config with
            url = url__;
            method = #post;
            headers;
            body = do ? {
                let candidValue : Candid.Candid = CreateImageRequest.toCandidValue(createImageRequest);
                let #ok(jsonText) = JSON.fromCandid(candidValue)
                    else throw Error.reject("Failed to serialize body to JSON");
                Text.encodeUtf8(jsonText)
            };
        };

        // Call the management canister's http_request method with cycles
        let response : _Ic.HttpRequestResult = await (with cycles) _Ic.http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to decode response body as UTF-8"));
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to parse JSON: ") # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ImagesResponse"));
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Unexpected error") #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Creates an edited or extended image given one or more source images and a prompt. This endpoint only supports `gpt-image-1` and `dall-e-2`.
    public func createImageEdit(config : Config, image : CreateImageEditRequestImage, prompt : Text, mask : Blob, model : ?CreateImageEditRequestModel, n : ?Nat, size : ?CreateImageEditRequestSize, responseFormat : ?CreateImageEditRequestResponseFormat, user : Text, quality : ?CreateImageEditRequestQuality) : async* ImagesResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/edits";

        // Add API key as query parameter if using apiKey auth
        let url__ = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<_Ic.HttpHeader>([
            baseHeaders,
            authHeaders
        ]);

        let request : _Ic.HttpRequestArgs = { config with
            url = url__;
            method = #post;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : _Ic.HttpRequestResult = await (with cycles) _Ic.http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to decode response body as UTF-8"));
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to parse JSON: ") # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ImagesResponse"));
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Unexpected error") #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Creates a variation of a given image. This endpoint only supports `dall-e-2`.
    public func createImageVariation(config : Config, image : Blob, model : ?CreateImageVariationRequestModel, n : ?Nat, responseFormat : ?CreateImageVariationRequestResponseFormat, size : ?CreateImageVariationRequestSize, user : Text) : async* ImagesResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/variations";

        // Add API key as query parameter if using apiKey auth
        let url__ = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<_Ic.HttpHeader>([
            baseHeaders,
            authHeaders
        ]);

        let request : _Ic.HttpRequestArgs = { config with
            url = url__;
            method = #post;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : _Ic.HttpRequestResult = await (with cycles) _Ic.http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to decode response body as UTF-8"));
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to parse JSON: ") # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ImagesResponse"));
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Unexpected error") #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };


    let operations__ = {
        createImage;
        createImageEdit;
        createImageVariation;
    };

    public module class ImagesApi(config : Config) {
        /// Creates an image given a prompt. [Learn more](/docs/guides/images). 
        public func createImage(createImageRequest : CreateImageRequest) : async ImagesResponse {
            await* operations__.createImage(config, createImageRequest)
        };

        /// Creates an edited or extended image given one or more source images and a prompt. This endpoint only supports `gpt-image-1` and `dall-e-2`.
        public func createImageEdit(image : CreateImageEditRequestImage, prompt : Text, mask : Blob, model : ?CreateImageEditRequestModel, n : ?Nat, size : ?CreateImageEditRequestSize, responseFormat : ?CreateImageEditRequestResponseFormat, user : Text, quality : ?CreateImageEditRequestQuality) : async ImagesResponse {
            await* operations__.createImageEdit(config, image, prompt, mask, model, n, size, responseFormat, user, quality)
        };

        /// Creates a variation of a given image. This endpoint only supports `dall-e-2`.
        public func createImageVariation(image : Blob, model : ?CreateImageVariationRequestModel, n : ?Nat, responseFormat : ?CreateImageVariationRequestResponseFormat, size : ?CreateImageVariationRequestSize, user : Text) : async ImagesResponse {
            await* operations__.createImageVariation(config, image, model, n, responseFormat, size, user)
        };

    }
}
