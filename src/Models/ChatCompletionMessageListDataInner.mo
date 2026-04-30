
import { type ChatCompletionMessageToolCall; JSON = ChatCompletionMessageToolCall } "./ChatCompletionMessageToolCall";

import { type ChatCompletionResponseMessageAnnotationsInner; JSON = ChatCompletionResponseMessageAnnotationsInner } "./ChatCompletionResponseMessageAnnotationsInner";

import { type ChatCompletionResponseMessageAudio; JSON = ChatCompletionResponseMessageAudio } "./ChatCompletionResponseMessageAudio";

import { type ChatCompletionResponseMessageFunctionCall; JSON = ChatCompletionResponseMessageFunctionCall } "./ChatCompletionResponseMessageFunctionCall";

import { type ChatCompletionResponseMessageRole; JSON = ChatCompletionResponseMessageRole } "./ChatCompletionResponseMessageRole";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionMessageListDataInner.mo

module {
    /// The required-fields slice of ChatCompletionMessageListDataInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        role : ChatCompletionResponseMessageRole;
        /// The identifier of the chat message.
        id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionMessageListDataInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        content : ?Text;
        refusal : ?Text;
        tool_calls : ?[ChatCompletionMessageToolCall];
        annotations : ?[ChatCompletionResponseMessageAnnotationsInner];
        function_call : ?ChatCompletionResponseMessageFunctionCall;
        audio : ?ChatCompletionResponseMessageAudio;
    };

    public type ChatCompletionMessageListDataInner = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionMessageListDataInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionMessageListDataInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionMessageListDataInner {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionMessageListDataInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionMessageListDataInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.content) {
                case (?v__) List.add(buf, ("content", #Text(v__)));
                case null ();
            };
            switch (value.refusal) {
                case (?v__) List.add(buf, ("refusal", #Text(v__)));
                case null ();
            };
            switch (value.tool_calls) {
                case (?v__) List.add(buf, ("tool_calls", #Array(Array.map<ChatCompletionMessageToolCall, Candid.Candid>(v__, ChatCompletionMessageToolCall.toCandidValue))));
                case null ();
            };
            switch (value.annotations) {
                case (?v__) List.add(buf, ("annotations", #Array(Array.map<ChatCompletionResponseMessageAnnotationsInner, Candid.Candid>(v__, ChatCompletionResponseMessageAnnotationsInner.toCandidValue))));
                case null ();
            };
            List.add(buf, ("role", ChatCompletionResponseMessageRole.toCandidValue(value.role)));
            switch (value.function_call) {
                case (?v__) List.add(buf, ("function_call", ChatCompletionResponseMessageFunctionCall.toCandidValue(v__)));
                case null ();
            };
            switch (value.audio) {
                case (?v__) List.add(buf, ("audio", ChatCompletionResponseMessageAudio.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageListDataInner =
            switch (candid) {
                case (#Record(fields)) {
                    let content : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content")) {
                        case (?content_field) ((switch (content_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let refusal : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "refusal")) {
                        case (?refusal_field) ((switch (refusal_field.1) { case (#Text(s)) ?s; case _ null }));
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
                    let annotations : ?[ChatCompletionResponseMessageAnnotationsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "annotations")) {
                        case (?annotations_field) ((switch (annotations_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionResponseMessageAnnotationsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionResponseMessageAnnotationsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?role_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "role") else return null;
                    let ?role = (ChatCompletionResponseMessageRole.fromCandidValue(role_field.1)) else return null;
                    let function_call : ?ChatCompletionResponseMessageFunctionCall = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function_call")) {
                        case (?function_call_field) (ChatCompletionResponseMessageFunctionCall.fromCandidValue(function_call_field.1));
                        case null null;
                    };
                    let audio : ?ChatCompletionResponseMessageAudio = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audio")) {
                        case (?audio_field) (ChatCompletionResponseMessageAudio.fromCandidValue(audio_field.1));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        content;
                        refusal;
                        tool_calls;
                        annotations;
                        role;
                        function_call;
                        audio;
                        id;
                    };
                };
                case _ null;
            };
    };
};
