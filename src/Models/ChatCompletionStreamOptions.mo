/// Options for streaming response. Only set this when you set `stream: true`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionStreamOptions.mo

module {
    public type ChatCompletionStreamOptions = {
        /// If set, an additional chunk will be streamed before the `data: [DONE]` message. The `usage` field on this chunk shows the token usage statistics for the entire request, and the `choices` field will always be an empty array.   All other chunks will also include a `usage` field, but with a null value. **NOTE:** If the stream is interrupted, you may not receive the final usage chunk which contains the total token usage for the request. 
        include_usage : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionStreamOptions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.include_usage) {
                case (?v__) List.add(buf, ("include_usage", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionStreamOptions =
            switch (candid) {
                case (#Record(fields)) {
                    let include_usage : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "include_usage")) {
                        case (?include_usage_field) ((switch (include_usage_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        include_usage;
                    };
                };
                case _ null;
            };
    };
};
