/// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence, `length` if the maximum number of tokens specified in the request was reached, or `content_filter` if content was omitted due to a flag from our content filters. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateCompletionResponseChoicesInnerFinishReason.mo
/// Enum values: #stop, #length, #content_filter

module {
    public type CreateCompletionResponseChoicesInnerFinishReason = {
        #stop;
        #length;
        #content_filter;
    };

    public module JSON {
        public func toCandidValue(value : CreateCompletionResponseChoicesInnerFinishReason) : Candid.Candid =
            switch (value) {
                case (#stop) #Text("stop");
                case (#length) #Text("length");
                case (#content_filter) #Text("content_filter");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseChoicesInnerFinishReason =
            switch (candid) {
                case (#Text("stop")) ?#stop;
                case (#Text("length")) ?#length;
                case (#Text("content_filter")) ?#content_filter;
                case _ null;
            };

        public func toText(value : CreateCompletionResponseChoicesInnerFinishReason) : Text =
            switch (value) {
                case (#stop) "stop";
                case (#length) "length";
                case (#content_filter) "content_filter";
            };
    };
};
