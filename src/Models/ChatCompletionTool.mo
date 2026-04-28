
import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";

import { type FunctionObject; JSON = FunctionObject } "./FunctionObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionTool.mo

module {
    public type ChatCompletionTool = {
        type_ : ChatCompletionMessageToolCallType;
        function : FunctionObject;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionTool) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(value.type_)));
            List.add(buf, ("function", FunctionObject.toCandidValue(value.function)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionTool =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1)) else return null;
                    let ?function_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function") else return null;
                    let ?function = (FunctionObject.fromCandidValue(function_field.1)) else return null;
                    ?{
                        type_;
                        function;
                    };
                };
                case _ null;
            };
    };
};
