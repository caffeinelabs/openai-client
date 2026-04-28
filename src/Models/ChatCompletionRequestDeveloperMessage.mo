/// Developer-provided instructions that the model should follow, regardless of messages sent by the user. With o1 models and newer, `developer` messages replace the previous `system` messages. 

import { type ChatCompletionRequestDeveloperMessageContent; JSON = ChatCompletionRequestDeveloperMessageContent } "./ChatCompletionRequestDeveloperMessageContent";

import { type ChatCompletionRequestDeveloperMessageRole; JSON = ChatCompletionRequestDeveloperMessageRole } "./ChatCompletionRequestDeveloperMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestDeveloperMessage.mo

module {
    public type ChatCompletionRequestDeveloperMessage = {
        content : ChatCompletionRequestDeveloperMessageContent;
        role : ChatCompletionRequestDeveloperMessageRole;
        /// An optional name for the participant. Provides the model information to differentiate between participants of the same role.
        name : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestDeveloperMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("content", ChatCompletionRequestDeveloperMessageContent.toCandidValue(value.content)));
            List.add(buf, ("role", ChatCompletionRequestDeveloperMessageRole.toCandidValue(value.role)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestDeveloperMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (ChatCompletionRequestDeveloperMessageContent.fromCandidValue(content_field.1)) else return null;
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestDeveloperMessageRole.fromCandidValue(role_field.1)) else return null;
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
