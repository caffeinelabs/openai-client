/// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, `content_filter` if content was omitted due to a flag from our content filters, `tool_calls` if the model called a tool, or `function_call` (deprecated) if the model called a function. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionResponseChoicesInnerFinishReason.mo
/// Enum values: #stop, #length, #tool_calls, #content_filter, #function_call

module {
    public type CreateChatCompletionResponseChoicesInnerFinishReason = {
        #stop;
        #length;
        #tool_calls;
        #content_filter;
        #function_call;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionResponseChoicesInnerFinishReason) : Candid.Candid =
            switch (value) {
                case (#stop) #Text("stop");
                case (#length) #Text("length");
                case (#tool_calls) #Text("tool_calls");
                case (#content_filter) #Text("content_filter");
                case (#function_call) #Text("function_call");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseChoicesInnerFinishReason =
            switch (candid) {
                case (#Text("stop")) ?#stop;
                case (#Text("length")) ?#length;
                case (#Text("tool_calls")) ?#tool_calls;
                case (#Text("content_filter")) ?#content_filter;
                case (#Text("function_call")) ?#function_call;
                case _ null;
            };

        public func toText(value : CreateChatCompletionResponseChoicesInnerFinishReason) : Text =
            switch (value) {
                case (#stop) "stop";
                case (#length) "length";
                case (#tool_calls) "tool_calls";
                case (#content_filter) "content_filter";
                case (#function_call) "function_call";
            };
    };
};
