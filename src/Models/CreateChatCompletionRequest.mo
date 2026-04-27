
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
import { type Map } "mo:core/pure/Map";

import Int "mo:core/Int";

// CreateChatCompletionRequest.mo

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateChatCompletionRequest type
        public type JSON = {
            metadata : ?Map<Text, Text>;
            temperature : ?Float;
            top_p : ?Float;
            user : ?Text;
            service_tier : ?ServiceTier.JSON;
            messages : [ChatCompletionRequestMessage];
            model : ModelIdsShared;
            modalities : ?[ChatCompletionModalitiesInner];
            reasoning_effort : ?ReasoningEffort.JSON;
            max_completion_tokens : ?Int;
            frequency_penalty : ?Float;
            presence_penalty : ?Float;
            web_search_options : ?WebSearch.JSON;
            top_logprobs : ?Int;
            response_format : ?CreateChatCompletionRequestAllOfResponseFormat.JSON;
            audio : ?CreateChatCompletionRequestAllOfAudio;
            store : ?Bool;
            stream : ?Bool;
            stop : ?StopConfiguration;
            logit_bias : ?Map<Text, Int>;
            logprobs : ?Bool;
            max_tokens : ?Int;
            n : ?Int;
            prediction : ?PredictionContent.JSON;
            seed : ?Int;
            stream_options : ?ChatCompletionStreamOptions;
            tools : ?[ChatCompletionTool];
            tool_choice : ?ChatCompletionToolChoiceOption.JSON;
            parallel_tool_calls : ?Bool;
            function_call : ?CreateChatCompletionRequestAllOfFunctionCall;
            functions : ?[ChatCompletionFunctions];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateChatCompletionRequest) : JSON = { value with
            service_tier = do ? { ServiceTier.toJSON(value.service_tier!) };
            reasoning_effort = do ? { ReasoningEffort.toJSON(value.reasoning_effort!) };
            web_search_options = do ? { WebSearch.toJSON(value.web_search_options!) };
            response_format = do ? { CreateChatCompletionRequestAllOfResponseFormat.toJSON(value.response_format!) };
            prediction = do ? { PredictionContent.toJSON(value.prediction!) };
            tool_choice = do ? { ChatCompletionToolChoiceOption.toJSON(value.tool_choice!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateChatCompletionRequest {
            ?{ json with
                service_tier = do ? { ServiceTier.fromJSON(json.service_tier!)! };
                reasoning_effort = do ? { ReasoningEffort.fromJSON(json.reasoning_effort!)! };
                web_search_options = do ? { WebSearch.fromJSON(json.web_search_options!)! };
                top_logprobs = switch (json.top_logprobs) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
                response_format = do ? { CreateChatCompletionRequestAllOfResponseFormat.fromJSON(json.response_format!)! };
                n = switch (json.n) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
                prediction = do ? { PredictionContent.fromJSON(json.prediction!)! };
                tool_choice = do ? { ChatCompletionToolChoiceOption.fromJSON(json.tool_choice!)! };
            }
        };

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateChatCompletionRequest) : ?Text = null;
    }
}
