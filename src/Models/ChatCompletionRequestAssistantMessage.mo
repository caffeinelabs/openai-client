/// Messages sent by the model in response to user messages. 

import { type ChatCompletionMessageToolCall; JSON = ChatCompletionMessageToolCall } "./ChatCompletionMessageToolCall";

import { type ChatCompletionRequestAssistantMessageAudio; JSON = ChatCompletionRequestAssistantMessageAudio } "./ChatCompletionRequestAssistantMessageAudio";

import { type ChatCompletionRequestAssistantMessageContent; JSON = ChatCompletionRequestAssistantMessageContent } "./ChatCompletionRequestAssistantMessageContent";

import { type ChatCompletionRequestAssistantMessageFunctionCall; JSON = ChatCompletionRequestAssistantMessageFunctionCall } "./ChatCompletionRequestAssistantMessageFunctionCall";

import { type ChatCompletionRequestAssistantMessageRole; JSON = ChatCompletionRequestAssistantMessageRole } "./ChatCompletionRequestAssistantMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestAssistantMessage.mo

module {
    /// The required-fields slice of ChatCompletionRequestAssistantMessage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        role : ChatCompletionRequestAssistantMessageRole;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestAssistantMessage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        content : ?ChatCompletionRequestAssistantMessageContent;
        refusal : ?Text;
        name : ?Text;
        audio : ?ChatCompletionRequestAssistantMessageAudio;
        tool_calls : ?[ChatCompletionMessageToolCall];
        function_call : ?ChatCompletionRequestAssistantMessageFunctionCall;
    };

    public type ChatCompletionRequestAssistantMessage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestAssistantMessage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestAssistantMessage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestAssistantMessage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestAssistantMessage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestAssistantMessage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.content) {
                case (?v__) List.add(buf, ("content", ChatCompletionRequestAssistantMessageContent.toCandidValue(v__)));
                case null ();
            };
            switch (value.refusal) {
                case (?v__) List.add(buf, ("refusal", #Text(v__)));
                case null ();
            };
            List.add(buf, ("role", ChatCompletionRequestAssistantMessageRole.toCandidValue(value.role)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.audio) {
                case (?v__) List.add(buf, ("audio", ChatCompletionRequestAssistantMessageAudio.toCandidValue(v__)));
                case null ();
            };
            switch (value.tool_calls) {
                case (?v__) List.add(buf, ("tool_calls", #Array(Array.map<ChatCompletionMessageToolCall, Candid.Candid>(v__, ChatCompletionMessageToolCall.toCandidValue))));
                case null ();
            };
            switch (value.function_call) {
                case (?v__) List.add(buf, ("function_call", ChatCompletionRequestAssistantMessageFunctionCall.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestAssistantMessage =
            switch (candid) {
                case (#Record(fields)) {
                    let content : ?ChatCompletionRequestAssistantMessageContent = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content")) {
                        case (?content_field) (ChatCompletionRequestAssistantMessageContent.fromCandidValue(content_field.1));
                        case null null;
                    };
                    let refusal : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "refusal")) {
                        case (?refusal_field) ((switch (refusal_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionRequestAssistantMessageRole.fromCandidValue(role_field.1)) else return null;
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let audio : ?ChatCompletionRequestAssistantMessageAudio = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audio")) {
                        case (?audio_field) (ChatCompletionRequestAssistantMessageAudio.fromCandidValue(audio_field.1));
                        case null null;
                    };
                    let tool_calls : ?[ChatCompletionMessageToolCall] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tool_calls")) {
                        case (?tool_calls_field) ((switch (tool_calls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionMessageToolCall>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionMessageToolCall.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let function_call : ?ChatCompletionRequestAssistantMessageFunctionCall = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function_call")) {
                        case (?function_call_field) (ChatCompletionRequestAssistantMessageFunctionCall.fromCandidValue(function_call_field.1));
                        case null null;
                    };
                    ?{
                        content;
                        refusal;
                        role;
                        name;
                        audio;
                        tool_calls;
                        function_call;
                    };
                };
                case _ null;
            };
    };
};
