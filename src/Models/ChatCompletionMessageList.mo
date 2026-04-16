/// An object representing a list of chat completion messages. 

import { type ChatCompletionListObject; JSON = ChatCompletionListObject } "./ChatCompletionListObject";

import { type ChatCompletionMessageListDataInner; JSON = ChatCompletionMessageListDataInner } "./ChatCompletionMessageListDataInner";

// ChatCompletionMessageList.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionMessageList = {
        object_ : ChatCompletionListObject;
        /// An array of chat completion message objects. 
        data : [ChatCompletionMessageListDataInner];
        /// The identifier of the first chat message in the data array.
        first_id : Text;
        /// The identifier of the last chat message in the data array.
        last_id : Text;
        /// Indicates whether there are more chat messages available.
        has_more : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionMessageList type
        public type JSON = {
            object_ : ChatCompletionListObject.JSON;
            data : [ChatCompletionMessageListDataInner];
            first_id : Text;
            last_id : Text;
            has_more : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionMessageList) : JSON = { value with
            object_ = ChatCompletionListObject.toJSON(value.object_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionMessageList {
            let ?object_ = ChatCompletionListObject.fromJSON(json.object_) else return null;
            ?{ json with
                object_;
            }
        };
    }
}
