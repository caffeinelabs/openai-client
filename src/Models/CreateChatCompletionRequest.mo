
import { type ChatCompletionFunctions; JSON = ChatCompletionFunctions } "./ChatCompletionFunctions";

import { type ChatCompletionModalitiesInner; JSON = ChatCompletionModalitiesInner } "./ChatCompletionModalitiesInner";

import { type ChatCompletionRequestMessage; JSON = ChatCompletionRequestMessage } "./ChatCompletionRequestMessage";

import { type ChatCompletionStreamOptions; JSON = ChatCompletionStreamOptions } "./ChatCompletionStreamOptions";

import { type ChatCompletionTool; JSON = ChatCompletionTool } "./ChatCompletionTool";

import { type ChatCompletionToolChoiceOption; JSON = ChatCompletionToolChoiceOption } "./ChatCompletionToolChoiceOption";

import { type CreateChatCompletionRequestAllOfAudio; JSON = CreateChatCompletionRequestAllOfAudio } "./CreateChatCompletionRequestAllOfAudio";

import { type CreateChatCompletionRequestAllOfFunctionCall; JSON = CreateChatCompletionRequestAllOfFunctionCall } "./CreateChatCompletionRequestAllOfFunctionCall";

import { type CreateChatCompletionRequestAllOfResponseFormat; JSON = CreateChatCompletionRequestAllOfResponseFormat } "./CreateChatCompletionRequestAllOfResponseFormat";

import { type ModelIdsShared; JSON = ModelIdsShared } "./ModelIdsShared";

import { type PredictionContent; JSON = PredictionContent } "./PredictionContent";

import { type ReasoningEffort; JSON = ReasoningEffort } "./ReasoningEffort";

import { type ServiceTier; JSON = ServiceTier } "./ServiceTier";

import { type StopConfiguration; JSON = StopConfiguration } "./StopConfiguration";

import { type WebSearch; JSON = WebSearch } "./WebSearch";
import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// CreateChatCompletionRequest.mo

module {
    public type CreateChatCompletionRequest = {
        /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.   Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters. 
        metadata : ?Map<Text, Text>;
        /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or `top_p` but not both. 
        temperature : ?Float;
        /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.  We generally recommend altering this or `temperature` but not both. 
        top_p : ?Float;
        /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids). 
        user : ?Text;
        service_tier : ?ServiceTier;
        /// A list of messages comprising the conversation so far. Depending on the [model](/docs/models) you use, different message types (modalities) are supported, like [text](/docs/guides/text-generation), [images](/docs/guides/vision), and [audio](/docs/guides/audio). 
        messages : [ChatCompletionRequestMessage];
        model : ModelIdsShared;
        /// Output types that you would like the model to generate. Most models are capable of generating text, which is the default:  `[\"text\"]`  The `gpt-4o-audio-preview` model can also be used to  [generate audio](/docs/guides/audio). To request that this model generate  both text and audio responses, you can use:  `[\"text\", \"audio\"]` 
        modalities : ?[ChatCompletionModalitiesInner];
        reasoning_effort : ?ReasoningEffort;
        /// An upper bound for the number of tokens that can be generated for a completion, including visible output tokens and [reasoning tokens](/docs/guides/reasoning). 
        max_completion_tokens : ?Int;
        /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim. 
        frequency_penalty : ?Float;
        /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics. 
        presence_penalty : ?Float;
        web_search_options : ?WebSearch;
        /// An integer between 0 and 20 specifying the number of most likely tokens to return at each token position, each with an associated log probability. `logprobs` must be set to `true` if this parameter is used. 
        top_logprobs : ?Nat;
        response_format : ?CreateChatCompletionRequestAllOfResponseFormat;
        audio : ?CreateChatCompletionRequestAllOfAudio;
        /// Whether or not to store the output of this chat completion request for  use in our [model distillation](/docs/guides/distillation) or [evals](/docs/guides/evals) products. 
        store : ?Bool;
        /// If set to true, the model response data will be streamed to the client as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format). See the [Streaming section below](/docs/api-reference/chat/streaming) for more information, along with the [streaming responses](/docs/guides/streaming-responses) guide for more information on how to handle the streaming events. 
        stream : ?Bool;
        stop : ?StopConfiguration;
        /// Modify the likelihood of specified tokens appearing in the completion.  Accepts a JSON object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token. 
        logit_bias : ?Map<Text, Int>;
        /// Whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of each output token returned in the `content` of `message`. 
        logprobs : ?Bool;
        /// The maximum number of [tokens](/tokenizer) that can be generated in the chat completion. This value can be used to control [costs](https://openai.com/api/pricing/) for text generated via API.  This value is now deprecated in favor of `max_completion_tokens`, and is not compatible with [o-series models](/docs/guides/reasoning). 
        max_tokens : ?Int;
        /// How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.
        n : ?Nat;
        /// Configuration for a [Predicted Output](/docs/guides/predicted-outputs), which can greatly improve response times when large parts of the model response are known ahead of time. This is most common when you are regenerating a file with only minor changes to most of the content. 
        prediction : ?PredictionContent;
        /// This feature is in Beta. If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result. Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to monitor changes in the backend. 
        seed : ?Int;
        stream_options : ?ChatCompletionStreamOptions;
        /// A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported. 
        tools : ?[ChatCompletionTool];
        tool_choice : ?ChatCompletionToolChoiceOption;
        /// Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
        parallel_tool_calls : ?Bool;
        function_call : ?CreateChatCompletionRequestAllOfFunctionCall;
        /// Deprecated in favor of `tools`.  A list of functions the model may generate JSON inputs for. 
        functions : ?[ChatCompletionFunctions];
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metadata) {
                case (?v__) List.add(buf, ("metadata", #Record(Array.map<(Text, Text), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Text)) : (Text, Candid.Candid) = (k, #Text(v))))));
                case null ();
            };
            switch (value.temperature) {
                case (?v__) List.add(buf, ("temperature", #Float(v__)));
                case null ();
            };
            switch (value.top_p) {
                case (?v__) List.add(buf, ("top_p", #Float(v__)));
                case null ();
            };
            switch (value.user) {
                case (?v__) List.add(buf, ("user", #Text(v__)));
                case null ();
            };
            switch (value.service_tier) {
                case (?v__) List.add(buf, ("service_tier", ServiceTier.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("messages", #Array(Array.map<ChatCompletionRequestMessage, Candid.Candid>(value.messages, ChatCompletionRequestMessage.toCandidValue))));
            List.add(buf, ("model", ModelIdsShared.toCandidValue(value.model)));
            switch (value.modalities) {
                case (?v__) List.add(buf, ("modalities", #Array(Array.map<ChatCompletionModalitiesInner, Candid.Candid>(v__, ChatCompletionModalitiesInner.toCandidValue))));
                case null ();
            };
            switch (value.reasoning_effort) {
                case (?v__) List.add(buf, ("reasoning_effort", ReasoningEffort.toCandidValue(v__)));
                case null ();
            };
            switch (value.max_completion_tokens) {
                case (?v__) List.add(buf, ("max_completion_tokens", #Int(v__)));
                case null ();
            };
            switch (value.frequency_penalty) {
                case (?v__) List.add(buf, ("frequency_penalty", #Float(v__)));
                case null ();
            };
            switch (value.presence_penalty) {
                case (?v__) List.add(buf, ("presence_penalty", #Float(v__)));
                case null ();
            };
            switch (value.web_search_options) {
                case (?v__) List.add(buf, ("web_search_options", WebSearch.toCandidValue(v__)));
                case null ();
            };
            switch (value.top_logprobs) {
                case (?v__) List.add(buf, ("top_logprobs", #Nat(v__)));
                case null ();
            };
            switch (value.response_format) {
                case (?v__) List.add(buf, ("response_format", CreateChatCompletionRequestAllOfResponseFormat.toCandidValue(v__)));
                case null ();
            };
            switch (value.audio) {
                case (?v__) List.add(buf, ("audio", CreateChatCompletionRequestAllOfAudio.toCandidValue(v__)));
                case null ();
            };
            switch (value.store) {
                case (?v__) List.add(buf, ("store", #Bool(v__)));
                case null ();
            };
            switch (value.stream) {
                case (?v__) List.add(buf, ("stream", #Bool(v__)));
                case null ();
            };
            switch (value.stop) {
                case (?v__) List.add(buf, ("stop", StopConfiguration.toCandidValue(v__)));
                case null ();
            };
            switch (value.logit_bias) {
                case (?v__) List.add(buf, ("logit_bias", #Record(Array.map<(Text, Int), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Int)) : (Text, Candid.Candid) = (k, #Int(v))))));
                case null ();
            };
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Bool(v__)));
                case null ();
            };
            switch (value.max_tokens) {
                case (?v__) List.add(buf, ("max_tokens", #Int(v__)));
                case null ();
            };
            switch (value.n) {
                case (?v__) List.add(buf, ("n", #Nat(v__)));
                case null ();
            };
            switch (value.prediction) {
                case (?v__) List.add(buf, ("prediction", PredictionContent.toCandidValue(v__)));
                case null ();
            };
            switch (value.seed) {
                case (?v__) List.add(buf, ("seed", #Int(v__)));
                case null ();
            };
            switch (value.stream_options) {
                case (?v__) List.add(buf, ("stream_options", ChatCompletionStreamOptions.toCandidValue(v__)));
                case null ();
            };
            switch (value.tools) {
                case (?v__) List.add(buf, ("tools", #Array(Array.map<ChatCompletionTool, Candid.Candid>(v__, ChatCompletionTool.toCandidValue))));
                case null ();
            };
            switch (value.tool_choice) {
                case (?v__) List.add(buf, ("tool_choice", ChatCompletionToolChoiceOption.toCandidValue(v__)));
                case null ();
            };
            switch (value.parallel_tool_calls) {
                case (?v__) List.add(buf, ("parallel_tool_calls", #Bool(v__)));
                case null ();
            };
            switch (value.function_call) {
                case (?v__) List.add(buf, ("function_call", CreateChatCompletionRequestAllOfFunctionCall.toCandidValue(v__)));
                case null ();
            };
            switch (value.functions) {
                case (?v__) List.add(buf, ("functions", #Array(Array.map<ChatCompletionFunctions, Candid.Candid>(v__, ChatCompletionFunctions.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let metadata : ?Map<Text, Text> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metadata")) {
                        case (?metadata_field) ((switch (metadata_field.1) {
                        case (#Record(pairs__)) {
                            let buf__ = List.empty<(Text, Text)>();
                            for ((k__, c__) in pairs__.values()) {
                                let #Text(v__) = c__ else return null;
                                List.add(buf__, (k__, v__));
                            };
                            ?fromIter<Text, Text>(List.toArray(buf__).values(), Text.compare);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let temperature : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "temperature")) {
                        case (?temperature_field) ((switch (temperature_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let top_p : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_p")) {
                        case (?top_p_field) ((switch (top_p_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let user : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user")) {
                        case (?user_field) ((switch (user_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let service_tier : ?ServiceTier = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "service_tier")) {
                        case (?service_tier_field) (ServiceTier.fromCandidValue(service_tier_field.1));
                        case null null;
                    };
                    let ?messages_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "messages") else return null;
                    let ?messages = ((switch (messages_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionRequestMessage>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionRequestMessage.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = (ModelIdsShared.fromCandidValue(model_field.1)) else return null;
                    let modalities : ?[ChatCompletionModalitiesInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "modalities")) {
                        case (?modalities_field) ((switch (modalities_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionModalitiesInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = ChatCompletionModalitiesInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let reasoning_effort : ?ReasoningEffort = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reasoning_effort")) {
                        case (?reasoning_effort_field) (ReasoningEffort.fromCandidValue(reasoning_effort_field.1));
                        case null null;
                    };
                    let max_completion_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "max_completion_tokens")) {
                        case (?max_completion_tokens_field) ((switch (max_completion_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let frequency_penalty : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "frequency_penalty")) {
                        case (?frequency_penalty_field) ((switch (frequency_penalty_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let presence_penalty : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "presence_penalty")) {
                        case (?presence_penalty_field) ((switch (presence_penalty_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let web_search_options : ?WebSearch = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "web_search_options")) {
                        case (?web_search_options_field) (WebSearch.fromCandidValue(web_search_options_field.1));
                        case null null;
                    };
                    let top_logprobs : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_logprobs")) {
                        case (?top_logprobs_field) ((switch (top_logprobs_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let response_format : ?CreateChatCompletionRequestAllOfResponseFormat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "response_format")) {
                        case (?response_format_field) (CreateChatCompletionRequestAllOfResponseFormat.fromCandidValue(response_format_field.1));
                        case null null;
                    };
                    let audio : ?CreateChatCompletionRequestAllOfAudio = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audio")) {
                        case (?audio_field) (CreateChatCompletionRequestAllOfAudio.fromCandidValue(audio_field.1));
                        case null null;
                    };
                    let store : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "store")) {
                        case (?store_field) ((switch (store_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let stream : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stream")) {
                        case (?stream_field) ((switch (stream_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let stop : ?StopConfiguration = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stop")) {
                        case (?stop_field) (StopConfiguration.fromCandidValue(stop_field.1));
                        case null null;
                    };
                    let logit_bias : ?Map<Text, Int> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logit_bias")) {
                        case (?logit_bias_field) ((switch (logit_bias_field.1) {
                        case (#Record(pairs__)) {
                            let buf__ = List.empty<(Text, Int)>();
                            for ((k__, c__) in pairs__.values()) {
                                let ?v__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, (k__, v__));
                            };
                            ?fromIter<Text, Int>(List.toArray(buf__).values(), Text.compare);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let logprobs : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) ((switch (logprobs_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let max_tokens : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "max_tokens")) {
                        case (?max_tokens_field) ((switch (max_tokens_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let n : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "n")) {
                        case (?n_field) ((switch (n_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let prediction : ?PredictionContent = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prediction")) {
                        case (?prediction_field) (PredictionContent.fromCandidValue(prediction_field.1));
                        case null null;
                    };
                    let seed : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "seed")) {
                        case (?seed_field) ((switch (seed_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let stream_options : ?ChatCompletionStreamOptions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stream_options")) {
                        case (?stream_options_field) (ChatCompletionStreamOptions.fromCandidValue(stream_options_field.1));
                        case null null;
                    };
                    let tools : ?[ChatCompletionTool] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tools")) {
                        case (?tools_field) ((switch (tools_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionTool>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionTool.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let tool_choice : ?ChatCompletionToolChoiceOption = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tool_choice")) {
                        case (?tool_choice_field) (ChatCompletionToolChoiceOption.fromCandidValue(tool_choice_field.1));
                        case null null;
                    };
                    let parallel_tool_calls : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "parallel_tool_calls")) {
                        case (?parallel_tool_calls_field) ((switch (parallel_tool_calls_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let function_call : ?CreateChatCompletionRequestAllOfFunctionCall = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function_call")) {
                        case (?function_call_field) (CreateChatCompletionRequestAllOfFunctionCall.fromCandidValue(function_call_field.1));
                        case null null;
                    };
                    let functions : ?[ChatCompletionFunctions] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "functions")) {
                        case (?functions_field) ((switch (functions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatCompletionFunctions>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatCompletionFunctions.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        metadata;
                        temperature;
                        top_p;
                        user;
                        service_tier;
                        messages;
                        model;
                        modalities;
                        reasoning_effort;
                        max_completion_tokens;
                        frequency_penalty;
                        presence_penalty;
                        web_search_options;
                        top_logprobs;
                        response_format;
                        audio;
                        store;
                        stream;
                        stop;
                        logit_bias;
                        logprobs;
                        max_tokens;
                        n;
                        prediction;
                        seed;
                        stream_options;
                        tools;
                        tool_choice;
                        parallel_tool_calls;
                        function_call;
                        functions;
                    };
                };
                case _ null;
            };
    };
};
