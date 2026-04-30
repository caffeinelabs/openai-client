
import { type ChatCompletionMessageToolCall; JSON = ChatCompletionMessageToolCall } "./ChatCompletionMessageToolCall";

import { type ChatCompletionRequestAssistantMessage; JSON = ChatCompletionRequestAssistantMessage } "./ChatCompletionRequestAssistantMessage";

import { type ChatCompletionRequestAssistantMessageAudio; JSON = ChatCompletionRequestAssistantMessageAudio } "./ChatCompletionRequestAssistantMessageAudio";

import { type ChatCompletionRequestAssistantMessageFunctionCall; JSON = ChatCompletionRequestAssistantMessageFunctionCall } "./ChatCompletionRequestAssistantMessageFunctionCall";

import { type ChatCompletionRequestDeveloperMessage; JSON = ChatCompletionRequestDeveloperMessage } "./ChatCompletionRequestDeveloperMessage";

import { type ChatCompletionRequestFunctionMessage; JSON = ChatCompletionRequestFunctionMessage } "./ChatCompletionRequestFunctionMessage";

import { type ChatCompletionRequestFunctionMessageRole; JSON = ChatCompletionRequestFunctionMessageRole } "./ChatCompletionRequestFunctionMessageRole";

import { type ChatCompletionRequestSystemMessage; JSON = ChatCompletionRequestSystemMessage } "./ChatCompletionRequestSystemMessage";

import { type ChatCompletionRequestToolMessage; JSON = ChatCompletionRequestToolMessage } "./ChatCompletionRequestToolMessage";

import { type ChatCompletionRequestUserMessage; JSON = ChatCompletionRequestUserMessage } "./ChatCompletionRequestUserMessage";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessage.mo
// Discriminator-oneOf — wire is a flat object whose `role`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type ChatCompletionRequestMessage = {
        #developer : ChatCompletionRequestDeveloperMessage;
        #system_ : ChatCompletionRequestSystemMessage;
        #user : ChatCompletionRequestUserMessage;
        #assistant : ChatCompletionRequestAssistantMessage;
        #tool : ChatCompletionRequestToolMessage;
        #function : ChatCompletionRequestFunctionMessage;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessage) : Candid.Candid =
            switch (value) {
                case (#developer(v)) ChatCompletionRequestDeveloperMessage.toCandidValue(v);
                case (#system_(v)) ChatCompletionRequestSystemMessage.toCandidValue(v);
                case (#user(v)) ChatCompletionRequestUserMessage.toCandidValue(v);
                case (#assistant(v)) ChatCompletionRequestAssistantMessage.toCandidValue(v);
                case (#tool(v)) ChatCompletionRequestToolMessage.toCandidValue(v);
                case (#function(v)) ChatCompletionRequestFunctionMessage.toCandidValue(v);
            };

        public func toText(value : ChatCompletionRequestMessage) : Text =
            switch (value) {
                case (#developer(_)) "developer";
                case (#system_(_)) "system";
                case (#user(_)) "user";
                case (#assistant(_)) "assistant";
                case (#tool(_)) "tool";
                case (#function(_)) "function";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("developer") {
                                    let ?inner = ChatCompletionRequestDeveloperMessage.fromCandidValue(candid) else return null;
                                    ?#developer(inner);
                                };
                                case ("system") {
                                    let ?inner = ChatCompletionRequestSystemMessage.fromCandidValue(candid) else return null;
                                    ?#system_(inner);
                                };
                                case ("user") {
                                    let ?inner = ChatCompletionRequestUserMessage.fromCandidValue(candid) else return null;
                                    ?#user(inner);
                                };
                                case ("assistant") {
                                    let ?inner = ChatCompletionRequestAssistantMessage.fromCandidValue(candid) else return null;
                                    ?#assistant(inner);
                                };
                                case ("tool") {
                                    let ?inner = ChatCompletionRequestToolMessage.fromCandidValue(candid) else return null;
                                    ?#tool(inner);
                                };
                                case ("function") {
                                    let ?inner = ChatCompletionRequestFunctionMessage.fromCandidValue(candid) else return null;
                                    ?#function(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
