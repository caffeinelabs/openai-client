
import { type ChatCompletionRequestToolMessageContent; JSON = ChatCompletionRequestToolMessageContent } "./ChatCompletionRequestToolMessageContent";

import { type ChatCompletionRequestToolMessageRole; JSON = ChatCompletionRequestToolMessageRole } "./ChatCompletionRequestToolMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestToolMessage.mo

module {
    public type ChatCompletionRequestToolMessage = {
        role : ChatCompletionRequestToolMessageRole;
        content : ChatCompletionRequestToolMessageContent;
        /// Tool call that this message is responding to.
        tool_call_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestToolMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("role", ChatCompletionRequestToolMessageRole.toCandidValue(value.role)));
            List.add(buf, ("content", ChatCompletionRequestToolMessageContent.toCandidValue(value.content)));
            List.add(buf, ("tool_call_id", #Text(value.tool_call_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestToolMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestToolMessageRole.fromCandidValue(role_field.1)) else return null;
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestToolMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?tool_call_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tool_call_id") else return null;
                    let ?tool_call_id = ((switch (tool_call_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        role;
                        content;
                        tool_call_id;
                    };
                };
                case _ null;
            };
    };
};
