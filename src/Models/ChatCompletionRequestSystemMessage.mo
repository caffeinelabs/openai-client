/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, use `developer` messages for this purpose instead. 

import { type ChatCompletionRequestSystemMessageContent; JSON = ChatCompletionRequestSystemMessageContent } "./ChatCompletionRequestSystemMessageContent";

import { type ChatCompletionRequestSystemMessageRole; JSON = ChatCompletionRequestSystemMessageRole } "./ChatCompletionRequestSystemMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestSystemMessage.mo

module {
    public type ChatCompletionRequestSystemMessage = {
        content : ChatCompletionRequestSystemMessageContent;
        role : ChatCompletionRequestSystemMessageRole;
        /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
        name : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestSystemMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("content", ChatCompletionRequestSystemMessageContent.toCandidValue(value.content)));
            List.add(buf, ("role", ChatCompletionRequestSystemMessageRole.toCandidValue(value.role)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestSystemMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestSystemMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestSystemMessageRole.fromCandidValue(role_field.1)) else return null;
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        content;
                        role;
                        name;
                    };
                };
                case _ null;
            };
    };
};
