// CompletionsApi.mo

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
import { type CreateCompletionRequest; JSON = CreateCompletionRequest } "../Models/CreateCompletionRequest";
import { type CreateCompletionResponse; JSON = CreateCompletionResponse } "../Models/CreateCompletionResponse";
import { type Config; _Helpers; _Ic } "../Config";

module {
        // mo:core/Base64 provides `decode` (caffeinelabs/motoko-core#507); alias it
        // instead of inlining. `_`-prefixed so it never triggers an unused-identifier
        // warning in modules that import Base64 only for encoding.
        let _decode = Base64.decode;

    /// Creates a completion for the provided prompt and parameters.
    public func createCompletion(config : Config, createCompletionRequest : CreateCompletionRequest) : async* CreateCompletionResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/completions";

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
                let candidValue : Candid.Candid = CreateCompletionRequest.toCandidValue(createCompletionRequest);
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
            (switch (CreateCompletionResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateCompletionResponse"));
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
        createCompletion;
    };

    public module class CompletionsApi(config : Config) {
        /// Creates a completion for the provided prompt and parameters.
        public func createCompletion(createCompletionRequest : CreateCompletionRequest) : async CreateCompletionResponse {
            await* operations__.createCompletion(config, createCompletionRequest)
        };

    }
}
