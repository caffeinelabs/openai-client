/// Specifies a tool the model should use. Use to force the model to call a specific function.

import { type AssistantsNamedToolChoiceFunction; JSON = AssistantsNamedToolChoiceFunction } "./AssistantsNamedToolChoiceFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionNamedToolChoice.mo

module {
    public type ChatCompletionNamedToolChoice = {
        type_ : ChatCompletionMessageToolCallType;
        function : AssistantsNamedToolChoiceFunction;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionNamedToolChoice) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(value.type_)));
            List.add(buf, ("function", AssistantsNamedToolChoiceFunction.toCandidValue(value.function)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionNamedToolChoice =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1)) else return null;
                    let ?function_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function") else return null;
                    let ?function = (AssistantsNamedToolChoiceFunction.fromCandidValue(function_field.1)) else return null;
                    ?{
                        type_;
                        function;
                    };
                };
                case _ null;
            };
    };
};
