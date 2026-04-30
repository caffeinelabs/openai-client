// ModelsApi.mo

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
import { type DeleteModelResponse; JSON = DeleteModelResponse } "../Models/DeleteModelResponse";
import { type ListModelsResponse; JSON = ListModelsResponse } "../Models/ListModelsResponse";
import { type Model; JSON = Model } "../Models/Model";
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


    /// Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
    public func deleteModel(config : Config, model : Text) : async* DeleteModelResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/models/{model}"
            |> Text.replace(_, #text "{model}", model);

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
            method = #delete;
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
            (switch (DeleteModelResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to DeleteModelResponse");
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

    /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
    public func listModels(config : Config) : async* ListModelsResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/models";

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
            method = #get;
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
            (switch (ListModelsResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to ListModelsResponse");
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

    /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
    public func retrieveModel(config : Config, model : Text) : async* Model {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/models/{model}"
            |> Text.replace(_, #text "{model}", model);

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
            method = #get;
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
            (switch (Model.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to Model");
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
        deleteModel;
        listModels;
        retrieveModel;
    };

    public module class ModelsApi(config : Config) {
        /// Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
        public func deleteModel(model : Text) : async DeleteModelResponse {
            await* operations__.deleteModel(config, model)
        };

        /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
        public func listModels() : async ListModelsResponse {
            await* operations__.listModels(config)
        };

        /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
        public func retrieveModel(model : Text) : async Model {
            await* operations__.retrieveModel(config, model)
        };

    }
}
