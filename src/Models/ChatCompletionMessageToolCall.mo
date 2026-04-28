
import { type ChatCompletionMessageToolCallFunction; JSON = ChatCompletionMessageToolCallFunction } "./ChatCompletionMessageToolCallFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionMessageToolCall.mo

module {
    public type ChatCompletionMessageToolCall = {
        /// The ID of the tool call.
        id : Text;
        type_ : ChatCompletionMessageToolCallType;
        function : ChatCompletionMessageToolCallFunction;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionMessageToolCall) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(value.type_)));
            List.add(buf, ("function", ChatCompletionMessageToolCallFunction.toCandidValue(value.function)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCall =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1)) else return null;
                    let ?function_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function") else return null;
                    let ?function = (ChatCompletionMessageToolCallFunction.fromCandidValue(function_field.1)) else return null;
                    ?{
                        id;
                        type_;
                        function;
                    };
                };
                case _ null;
            };
    };
};
