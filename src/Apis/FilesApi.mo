// FilesApi.mo

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
import { type CreateFileRequestPurpose; JSON = CreateFileRequestPurpose } "../Models/CreateFileRequestPurpose";
import { type DeleteFileResponse; JSON = DeleteFileResponse } "../Models/DeleteFileResponse";
import { type ListAssistantsOrderParameter; JSON = ListAssistantsOrderParameter } "../Models/ListAssistantsOrderParameter";
import { type ListFilesResponse; JSON = ListFilesResponse } "../Models/ListFilesResponse";
import { type OpenAIFile; JSON = OpenAIFile } "../Models/OpenAIFile";
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


    /// Upload a file that can be used across various endpoints. Individual files can be up to 512 MB, and the size of all files uploaded by one organization can be up to 100 GB.  The Assistants API supports files up to 2 million tokens and of specific file types. See the [Assistants Tools guide](/docs/assistants/tools) for details.  The Fine-tuning API only supports `.jsonl` files. The input also has certain required formats for fine-tuning [chat](/docs/api-reference/fine-tuning/chat-input) or [completions](/docs/api-reference/fine-tuning/completions-input) models.  The Batch API only supports `.jsonl` files up to 200 MB in size. The input also has a specific required [format](/docs/api-reference/batch/request-input).  Please [contact us](https://help.openai.com/) if you need to increase these storage limits. 
    public func createFile(config : Config, file : Blob, purpose : CreateFileRequestPurpose) : async* OpenAIFile {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/files";

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
            (switch (OpenAIFile.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to OpenAIFile");
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

    /// Delete a file.
    public func deleteFile(config : Config, fileId : Text) : async* DeleteFileResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/files/{file_id}"
            |> Text.replace(_, #text "{file_id}", fileId);

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
            (switch (DeleteFileResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to DeleteFileResponse");
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

    /// Returns the contents of the specified file.
    public func downloadFile(config : Config, fileId : Text) : async* Text {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/files/{file_id}/content"
            |> Text.replace(_, #text "{file_id}", fileId);

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
            (switch (_) {
                case (#Text(s__)) s__;
                case _ throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Unexpected primitive shape");
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

    /// Returns a list of files.
    public func listFiles(config : Config, purpose : Text, limit : Int, order : ListAssistantsOrderParameter, after : Text) : async* ListFilesResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/files"
            # "?" # "purpose=" # purpose # "&" # "limit=" # Int.toText(limit) # "&" # "order=" # ListAssistantsOrderParameter.toText(order) # "&" # "after=" # after;

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
            (switch (ListFilesResponse.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to ListFilesResponse");
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

    /// Returns information about a specific file.
    public func retrieveFile(config : Config, fileId : Text) : async* OpenAIFile {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/files/{file_id}"
            |> Text.replace(_, #text "{file_id}", fileId);

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
            (switch (OpenAIFile.fromCandidValue(_)) {
                case (?value) value;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # " body[" # Nat.toText(response.body.size()) # "B]=" # (switch (Text.decodeUtf8(response.body)) { case (?t) (if (t.size() > 100) Text.fromIter(Iter.take<Char>(t.chars(), 100)) # "..." else t); case null "(undecodable)" }) # ": Failed to convert response to OpenAIFile");
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
        createFile;
        deleteFile;
        downloadFile;
        listFiles;
        retrieveFile;
    };

    public module class FilesApi(config : Config) {
        /// Upload a file that can be used across various endpoints. Individual files can be up to 512 MB, and the size of all files uploaded by one organization can be up to 100 GB.  The Assistants API supports files up to 2 million tokens and of specific file types. See the [Assistants Tools guide](/docs/assistants/tools) for details.  The Fine-tuning API only supports `.jsonl` files. The input also has certain required formats for fine-tuning [chat](/docs/api-reference/fine-tuning/chat-input) or [completions](/docs/api-reference/fine-tuning/completions-input) models.  The Batch API only supports `.jsonl` files up to 200 MB in size. The input also has a specific required [format](/docs/api-reference/batch/request-input).  Please [contact us](https://help.openai.com/) if you need to increase these storage limits. 
        public func createFile(file : Blob, purpose : CreateFileRequestPurpose) : async OpenAIFile {
            await* operations__.createFile(config, file, purpose)
        };

        /// Delete a file.
        public func deleteFile(fileId : Text) : async DeleteFileResponse {
            await* operations__.deleteFile(config, fileId)
        };

        /// Returns the contents of the specified file.
        public func downloadFile(fileId : Text) : async Text {
            await* operations__.downloadFile(config, fileId)
        };

        /// Returns a list of files.
        public func listFiles(purpose : Text, limit : Int, order : ListAssistantsOrderParameter, after : Text) : async ListFilesResponse {
            await* operations__.listFiles(config, purpose, limit, order, after)
        };

        /// Returns information about a specific file.
        public func retrieveFile(fileId : Text) : async OpenAIFile {
            await* operations__.retrieveFile(config, fileId)
        };

    }
}
