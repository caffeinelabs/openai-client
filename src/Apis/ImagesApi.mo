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
import { type Config } "../Config";

module {
    // Management Canister interface for HTTP outcalls
    // Based on https://github.com/dfinity/interface-spec/blob/master/spec/ic.did
    type http_header = {
        name : Text;
        value : Text;
    };

    type http_method = {
        #get;
        #head;
        #post;
        #put;    // Non-replicated only (is_replicated forced to ?false in generated code)
        #delete; // Non-replicated only (is_replicated forced to ?false in generated code)
    };

    type http_request_args = {
        url : Text;
        max_response_bytes : ?Nat64;
        method : http_method;
        headers : [http_header];
        body : ?Blob;
        transform : ?{
            function : shared query ({ response : http_request_result; context : Blob }) -> async http_request_result;
            context : Blob;
        };
        is_replicated : ?Bool;
    };

    type http_request_result = {
        status : Nat;
        headers : [http_header];
        body : Blob;
    };

    let http_request = (actor "aaaaa-aa" : actor { http_request : (http_request_args) -> async http_request_result }).http_request;


    /// Creates an image given a prompt. [Learn more](/docs/guides/images). 
    public func createImage(config : Config, createImageRequest : CreateImageRequest) : async* ImagesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/generations";

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
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

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
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
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to ImagesResponse");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Creates an edited or extended image given one or more source images and a prompt. This endpoint only supports `gpt-image-1` and `dall-e-2`.
    public func createImageEdit(config : Config, image : CreateImageEditRequestImage, prompt : Text, mask : Blob, model : ?CreateImageEditRequestModel, n : ?Nat, size : ?CreateImageEditRequestSize, responseFormat : ?CreateImageEditRequestResponseFormat, user : Text, quality : ?CreateImageEditRequestQuality) : async* ImagesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/edits";

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
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

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to ImagesResponse");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// Creates a variation of a given image. This endpoint only supports `dall-e-2`.
    public func createImageVariation(config : Config, image : Blob, model : ?CreateImageVariationRequestModel, n : ?Nat, responseFormat : ?CreateImageVariationRequestResponseFormat, size : ?CreateImageVariationRequestSize, user : Text) : async* ImagesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/images/variations";

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
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

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.toCandid(_)) {
                case (#ok(c__)) c__;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to parse JSON: " # msg);
            }) |>
            (switch (ImagesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to ImagesResponse");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected error" #
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
