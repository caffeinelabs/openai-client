/// An object representing a list of Chat Completions. 

import { type ChatCompletionListObject; JSON = ChatCompletionListObject } "./ChatCompletionListObject";

import { type CreateChatCompletionResponse; JSON = CreateChatCompletionResponse } "./CreateChatCompletionResponse";

// ChatCompletionList.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionList = {
        object_ : ChatCompletionListObject;
        /// An array of chat completion objects. 
        data : [CreateChatCompletionResponse];
        /// The identifier of the first chat completion in the data array.
        first_id : Text;
        /// The identifier of the last chat completion in the data array.
        last_id : Text;
        /// Indicates whether there are more Chat Completions available.
        has_more : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionList type
        public type JSON = {
            object_ : ChatCompletionListObject.JSON;
            data : [CreateChatCompletionResponse];
            first_id : Text;
            last_id : Text;
            has_more : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionList) : JSON = { value with
            object_ = ChatCompletionListObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionList {
            let ?object_ = ChatCompletionListObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : ChatCompletionList) : ?Text = null;
    }
}
