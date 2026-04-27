/// This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](/docs/guides/tools-web-search?api-mode=chat). 

import { type WebSearchContextSize; JSON = WebSearchContextSize } "./WebSearchContextSize";

import { type WebSearchUserLocation; JSON = WebSearchUserLocation } "./WebSearchUserLocation";

// WebSearch.mo

module {
    // User-facing type: what application code uses
    public type WebSearch = {
        user_location : ?WebSearchUserLocation;
        search_context_size : ?WebSearchContextSize;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebSearch type
        public type JSON = {
            user_location : ?WebSearchUserLocation;
            search_context_size : ?WebSearchContextSize.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebSearch) : JSON = { value with
            search_context_size = do ? { WebSearchContextSize.toJSON(value.search_context_size!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebSearch {
            ?{ json with
                search_context_size = do ? { WebSearchContextSize.fromJSON(json.search_context_size!)! };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : WebSearch) : ?Text = null;
    }
}
