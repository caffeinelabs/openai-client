
import { type ChatCompletionRequestFunctionMessageRole; JSON = ChatCompletionRequestFunctionMessageRole } "./ChatCompletionRequestFunctionMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestFunctionMessage.mo

module {
    public type ChatCompletionRequestFunctionMessage = {
        role : ChatCompletionRequestFunctionMessageRole;
        /// The contents of the function message.
        content : Text;
        /// The name of the function to call.
        name : Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestFunctionMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("role", ChatCompletionRequestFunctionMessageRole.toCandidValue(value.role)));
            List.add(buf, ("content", #Text(value.content)));
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestFunctionMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestFunctionMessageRole.fromCandidValue(role_field.1)) else return null;
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = ((switch (content_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        role;
                        content;
                        name;
                    };
                };
                case _ null;
            };
    };
};
