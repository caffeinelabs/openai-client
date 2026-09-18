// ChatApi.mo

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
import { type ChatCompletionDeleted; JSON = ChatCompletionDeleted } "../Models/ChatCompletionDeleted";
import { type ChatCompletionList; JSON = ChatCompletionList } "../Models/ChatCompletionList";
import { type ChatCompletionMessageList; JSON = ChatCompletionMessageList } "../Models/ChatCompletionMessageList";
import { type CreateChatCompletionRequest; JSON = CreateChatCompletionRequest } "../Models/CreateChatCompletionRequest";
import { type CreateChatCompletionResponse; JSON = CreateChatCompletionResponse } "../Models/CreateChatCompletionResponse";
import { type CreateChatCompletionStreamResponse; JSON = CreateChatCompletionStreamResponse } "../Models/CreateChatCompletionStreamResponse";
import { type ListChatCompletionsOrderParameter; JSON = ListChatCompletionsOrderParameter } "../Models/ListChatCompletionsOrderParameter";
import { type UpdateChatCompletionRequest; JSON = UpdateChatCompletionRequest } "../Models/UpdateChatCompletionRequest";
import { type Map; fromIter } "mo:core/pure/Map";
import { type Config; _Helpers; _Ic } "../Config";

module {
        // mo:core/Base64 provides `decode` (caffeinelabs/motoko-core#507); alias it
        // instead of inlining. `_`-prefixed so it never triggers an unused-identifier
        // warning in modules that import Base64 only for encoding.
        let _decode = Base64.decode;

    /// **Starting a new project?** We recommend trying [Responses](/docs/api-reference/responses)  to take advantage of the latest OpenAI platform features. Compare [Chat Completions with Responses](/docs/guides/responses-vs-chat-completions?api-mode=responses).  ---  Creates a model response for the given chat conversation. Learn more in the [text generation](/docs/guides/text-generation), [vision](/docs/guides/vision), and [audio](/docs/guides/audio) guides.  Parameter support can differ depending on the model used to generate the response, particularly for newer reasoning models. Parameters that are only supported for reasoning models are noted below. For the current state of  unsupported parameters in reasoning models,  [refer to the reasoning guide](/docs/guides/reasoning). 
    public func createChatCompletion(config : Config, createChatCompletionRequest : CreateChatCompletionRequest) : async* CreateChatCompletionResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions";

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
                let candidValue : Candid.Candid = CreateChatCompletionRequest.toCandidValue(createChatCompletionRequest);
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
            (switch (CreateChatCompletionResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateChatCompletionResponse"));
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

    /// Delete a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` can be deleted. 
    public func deleteChatCompletion(config : Config, completionId : Text) : async* ChatCompletionDeleted {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions/{completion_id}"
            |> Text.replace(_, #text "{completion_id}", _Helpers.encodeComponent(completionId));

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
            method = #delete;
            headers;
            is_replicated = ?false; // DELETE requires non-replicated mode on IC
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
            (switch (ChatCompletionDeleted.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ChatCompletionDeleted"));
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

    /// Get a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` will be returned. 
    public func getChatCompletion(config : Config, completionId : Text) : async* CreateChatCompletionResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions/{completion_id}"
            |> Text.replace(_, #text "{completion_id}", _Helpers.encodeComponent(completionId));

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
            method = #get;
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
            (switch (CreateChatCompletionResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateChatCompletionResponse"));
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

    /// Get the messages in a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` will be returned. 
    public func getChatCompletionMessages(config : Config, completionId : Text, after : Text, limit : Int, order : ?ListChatCompletionsOrderParameter) : async* ChatCompletionMessageList {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions/{completion_id}/messages"
            |> Text.replace(_, #text "{completion_id}", _Helpers.encodeComponent(completionId))
            # (do {
                // Build the query string from fragments so optional params can
                // be omitted individually. Empty optional strings and zero-valued
                // optional integers are dropped (Google-style APIs reject empty
                // `key=` and `max*=0`); required params and array items always
                // emit. The leading separator flips from "?" to "&" per param.
                var query__ = "";
                var sep__ = "?";
                let frag_after__ : Text = (if (after == "") "" else "after=" # _Helpers.encodeComponent(after));
                if (frag_after__ != "") { query__ #= sep__ # frag_after__; sep__ := "&" };
                let frag_limit__ : Text = (if (limit == 0) "" else "limit=" # Int.toText(limit));
                if (frag_limit__ != "") { query__ #= sep__ # frag_limit__; sep__ := "&" };
                let frag_order__ : Text = (switch (order) { case (?v__) "order=" # ListChatCompletionsOrderParameter.toText(v__); case null "" });
                if (frag_order__ != "") { query__ #= sep__ # frag_order__; sep__ := "&" };
                query__;
              });

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
            method = #get;
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
            (switch (ChatCompletionMessageList.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ChatCompletionMessageList"));
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

    /// List stored Chat Completions. Only Chat Completions that have been stored with the `store` parameter set to `true` will be returned. 
    public func listChatCompletions(config : Config, model : Text, metadata : ?Map<Text, Text>, after : Text, limit : Int, order : ?ListChatCompletionsOrderParameter) : async* ChatCompletionList {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions"
            # (do {
                // Build the query string from fragments so optional params can
                // be omitted individually. Empty optional strings and zero-valued
                // optional integers are dropped (Google-style APIs reject empty
                // `key=` and `max*=0`); required params and array items always
                // emit. The leading separator flips from "?" to "&" per param.
                var query__ = "";
                var sep__ = "?";
                let frag_model__ : Text = (if (model == "") "" else "model=" # _Helpers.encodeComponent(model));
                if (frag_model__ != "") { query__ #= sep__ # frag_model__; sep__ := "&" };
                let frag_metadata__ : Text = "metadata=" # debug_show(metadata);
                if (frag_metadata__ != "") { query__ #= sep__ # frag_metadata__; sep__ := "&" };
                let frag_after__ : Text = (if (after == "") "" else "after=" # _Helpers.encodeComponent(after));
                if (frag_after__ != "") { query__ #= sep__ # frag_after__; sep__ := "&" };
                let frag_limit__ : Text = (if (limit == 0) "" else "limit=" # Int.toText(limit));
                if (frag_limit__ != "") { query__ #= sep__ # frag_limit__; sep__ := "&" };
                let frag_order__ : Text = (switch (order) { case (?v__) "order=" # ListChatCompletionsOrderParameter.toText(v__); case null "" });
                if (frag_order__ != "") { query__ #= sep__ # frag_order__; sep__ := "&" };
                query__;
              });

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
            method = #get;
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
            (switch (ChatCompletionList.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to ChatCompletionList"));
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

    /// Modify a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` can be modified. Currently, the only supported modification is to update the `metadata` field. 
    public func updateChatCompletion(config : Config, completionId : Text, updateChatCompletionRequest : UpdateChatCompletionRequest) : async* CreateChatCompletionResponse {
        // x-server-override (set by spec-merge per input) pins this
        // operation to the right host for multi-spec merged clients;
        // when absent we use config.baseUrl as before.
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/chat/completions/{completion_id}"
            |> Text.replace(_, #text "{completion_id}", _Helpers.encodeComponent(completionId));

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
                let candidValue : Candid.Candid = UpdateChatCompletionRequest.toCandidValue(updateChatCompletionRequest);
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
            (switch (CreateChatCompletionResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject(_Helpers.rejectMessage(response.status, response.body, "Failed to convert response to CreateChatCompletionResponse"));
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
        createChatCompletion;
        deleteChatCompletion;
        getChatCompletion;
        getChatCompletionMessages;
        listChatCompletions;
        updateChatCompletion;
    };

    public module class ChatApi(config : Config) {
        /// **Starting a new project?** We recommend trying [Responses](/docs/api-reference/responses)  to take advantage of the latest OpenAI platform features. Compare [Chat Completions with Responses](/docs/guides/responses-vs-chat-completions?api-mode=responses).  ---  Creates a model response for the given chat conversation. Learn more in the [text generation](/docs/guides/text-generation), [vision](/docs/guides/vision), and [audio](/docs/guides/audio) guides.  Parameter support can differ depending on the model used to generate the response, particularly for newer reasoning models. Parameters that are only supported for reasoning models are noted below. For the current state of  unsupported parameters in reasoning models,  [refer to the reasoning guide](/docs/guides/reasoning). 
        public func createChatCompletion(createChatCompletionRequest : CreateChatCompletionRequest) : async CreateChatCompletionResponse {
            await* operations__.createChatCompletion(config, createChatCompletionRequest)
        };

        /// Delete a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` can be deleted. 
        public func deleteChatCompletion(completionId : Text) : async ChatCompletionDeleted {
            await* operations__.deleteChatCompletion(config, completionId)
        };

        /// Get a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` will be returned. 
        public func getChatCompletion(completionId : Text) : async CreateChatCompletionResponse {
            await* operations__.getChatCompletion(config, completionId)
        };

        /// Get the messages in a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` will be returned. 
        public func getChatCompletionMessages(completionId : Text, after : Text, limit : Int, order : ?ListChatCompletionsOrderParameter) : async ChatCompletionMessageList {
            await* operations__.getChatCompletionMessages(config, completionId, after, limit, order)
        };

        /// List stored Chat Completions. Only Chat Completions that have been stored with the `store` parameter set to `true` will be returned. 
        public func listChatCompletions(model : Text, metadata : ?Map<Text, Text>, after : Text, limit : Int, order : ?ListChatCompletionsOrderParameter) : async ChatCompletionList {
            await* operations__.listChatCompletions(config, model, metadata, after, limit, order)
        };

        /// Modify a stored chat completion. Only Chat Completions that have been created with the `store` parameter set to `true` can be modified. Currently, the only supported modification is to update the `metadata` field. 
        public func updateChatCompletion(completionId : Text, updateChatCompletionRequest : UpdateChatCompletionRequest) : async CreateChatCompletionResponse {
            await* operations__.updateChatCompletion(config, completionId, updateChatCompletionRequest)
        };

    }
}
