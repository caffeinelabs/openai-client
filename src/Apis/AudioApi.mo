// AudioApi.mo

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
import { type AudioResponseFormat; JSON = AudioResponseFormat } "../Models/AudioResponseFormat";
import { type CreateSpeechRequest; JSON = CreateSpeechRequest } "../Models/CreateSpeechRequest";
import { type CreateTranscription200Response; JSON = CreateTranscription200Response } "../Models/CreateTranscription200Response";
import { type CreateTranscriptionRequestModel; JSON = CreateTranscriptionRequestModel } "../Models/CreateTranscriptionRequestModel";
import { type CreateTranscriptionRequestTimestampGranularitiesInner; JSON = CreateTranscriptionRequestTimestampGranularitiesInner } "../Models/CreateTranscriptionRequestTimestampGranularitiesInner";
import { type CreateTranscriptionResponseStreamEvent; JSON = CreateTranscriptionResponseStreamEvent } "../Models/CreateTranscriptionResponseStreamEvent";
import { type CreateTranslation200Response; JSON = CreateTranslation200Response } "../Models/CreateTranslation200Response";
import { type CreateTranslationRequestModel; JSON = CreateTranslationRequestModel } "../Models/CreateTranslationRequestModel";
import { type CreateTranslationRequestResponseFormat; JSON = CreateTranslationRequestResponseFormat } "../Models/CreateTranslationRequestResponseFormat";
import { type TranscriptionInclude; JSON = TranscriptionInclude } "../Models/TranscriptionInclude";
import { type Config; _Helpers; _Ic } "../Config";

module {
        // mo:core/Base64 provides `decode` (caffeinelabs/motoko-core#507); alias it
        // instead of inlining. `_`-prefixed so it never triggers an unused-identifier
        // warning in modules that import Base64 only for encoding.
        let _decode = Base64.decode;

    /// Generates audio from the input text.
    public func createSpeech(config : Config, createSpeechRequest : CreateSpeechRequest) : async* Blob {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/audio/speech";

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
                let candidValue : Candid.Candid = CreateSpeechRequest.toCandidValue(createSpeechRequest);
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
            (switch (_) {
                case (#Blob(b__)) b__;
                case _ throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Unexpected primitive shape"));
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

    /// Transcribes audio into the input language.
    public func createTranscription(config : Config, file : Blob, model : CreateTranscriptionRequestModel, language : Text, prompt : Text, responseFormat : ?AudioResponseFormat, temperature : Float, includeLeft_Square_BracketRight_Square_Bracket : [TranscriptionInclude], timestampGranularitiesLeft_Square_BracketRight_Square_Bracket : [CreateTranscriptionRequestTimestampGranularitiesInner], stream : ?Bool) : async* CreateTranscription200Response {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/audio/transcriptions";

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
            (switch (CreateTranscription200Response.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateTranscription200Response"));
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

    /// Translates audio into English.
    public func createTranslation(config : Config, file : Blob, model : CreateTranslationRequestModel, prompt : Text, responseFormat : ?CreateTranslationRequestResponseFormat, temperature : Float) : async* CreateTranslation200Response {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/audio/translations";

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
            (switch (CreateTranslation200Response.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateTranslation200Response"));
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
        createSpeech;
        createTranscription;
        createTranslation;
    };

    public module class AudioApi(config : Config) {
        /// Generates audio from the input text.
        public func createSpeech(createSpeechRequest : CreateSpeechRequest) : async Blob {
            await* operations__.createSpeech(config, createSpeechRequest)
        };

        /// Transcribes audio into the input language.
        public func createTranscription(file : Blob, model : CreateTranscriptionRequestModel, language : Text, prompt : Text, responseFormat : ?AudioResponseFormat, temperature : Float, includeLeft_Square_BracketRight_Square_Bracket : [TranscriptionInclude], timestampGranularitiesLeft_Square_BracketRight_Square_Bracket : [CreateTranscriptionRequestTimestampGranularitiesInner], stream : ?Bool) : async CreateTranscription200Response {
            await* operations__.createTranscription(config, file, model, language, prompt, responseFormat, temperature, includeLeft_Square_BracketRight_Square_Bracket, timestampGranularitiesLeft_Square_BracketRight_Square_Bracket, stream)
        };

        /// Translates audio into English.
        public func createTranslation(file : Blob, model : CreateTranslationRequestModel, prompt : Text, responseFormat : ?CreateTranslationRequestResponseFormat, temperature : Float) : async CreateTranslation200Response {
            await* operations__.createTranslation(config, file, model, prompt, responseFormat, temperature)
        };

    }
}
