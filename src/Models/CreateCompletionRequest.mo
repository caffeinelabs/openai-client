
import { type ChatCompletionStreamOptions; JSON = ChatCompletionStreamOptions } "./ChatCompletionStreamOptions";

import { type CreateCompletionRequestModel; JSON = CreateCompletionRequestModel } "./CreateCompletionRequestModel";

import { type CreateCompletionRequestPrompt; JSON = CreateCompletionRequestPrompt } "./CreateCompletionRequestPrompt";

import { type StopConfiguration; JSON = StopConfiguration } "./StopConfiguration";
import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// CreateCompletionRequest.mo

module {
    /// The required-fields slice of CreateCompletionRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        model : CreateCompletionRequestModel;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateCompletionRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        prompt : ?CreateCompletionRequestPrompt;
        best_of : ?Nat;
        echo : ?Bool;
        frequency_penalty : ?Float;
        logit_bias : ?Map<Text, Int>;
        logprobs : ?Nat;
        max_tokens : ?Nat;
        n : ?Nat;
        presence_penalty : ?Float;
        seed : ?Int;
        stop : ?StopConfiguration;
        stream : ?Bool;
        stream_options : ?ChatCompletionStreamOptions;
        suffix : ?Text;
        temperature : ?Float;
        top_p : ?Float;
        user : ?Text;
    };

    public type CreateCompletionRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateCompletionRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateCompletionRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateCompletionRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateCompletionRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateCompletionRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("model", CreateCompletionRequestModel.toCandidValue(value.model)));
            switch (value.prompt) {
                case (?v__) List.add(buf, ("prompt", CreateCompletionRequestPrompt.toCandidValue(v__)));
                case null ();
            };
            switch (value.best_of) {
                case (?v__) List.add(buf, ("best_of", #Nat(v__)));
                case null ();
            };
            switch (value.echo) {
                case (?v__) List.add(buf, ("echo", #Bool(v__)));
                case null ();
            };
            switch (value.frequency_penalty) {
                case (?v__) List.add(buf, ("frequency_penalty", #Float(v__)));
                case null ();
            };
            switch (value.logit_bias) {
                case (?v__) List.add(buf, ("logit_bias", #Record(Array.map<(Text, Int), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Int)) : (Text, Candid.Candid) = (k, #Int(v))))));
                case null ();
            };
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Nat(v__)));
                case null ();
            };
            switch (value.max_tokens) {
                case (?v__) List.add(buf, ("max_tokens", #Nat(v__)));
                case null ();
            };
            switch (value.n) {
                case (?v__) List.add(buf, ("n", #Nat(v__)));
                case null ();
            };
            switch (value.presence_penalty) {
                case (?v__) List.add(buf, ("presence_penalty", #Float(v__)));
                case null ();
            };
            switch (value.seed) {
                case (?v__) List.add(buf, ("seed", #Int(v__)#Int(v__)));
                case null ();
            };
            switch (value.stop) {
                case (?v__) List.add(buf, ("stop", StopConfiguration.toCandidValue(v__)));
                case null ();
            };
            switch (value.stream) {
                case (?v__) List.add(buf, ("stream", #Bool(v__)));
                case null ();
            };
            switch (value.stream_options) {
                case (?v__) List.add(buf, ("stream_options", ChatCompletionStreamOptions.toCandidValue(v__)));
                case null ();
            };
            switch (value.suffix) {
                case (?v__) List.add(buf, ("suffix", #Text(v__)));
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
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = (CreateCompletionRequestModel.fromCandidValue(model_field.1)) else return null;
                    let prompt : ?CreateCompletionRequestPrompt = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prompt")) {
                        case (?prompt_field) (CreateCompletionRequestPrompt.fromCandidValue(prompt_field.1));
                        case null null;
                    };
                    let best_of : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "best_of")) {
                        case (?best_of_field) ((switch (best_of_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let echo : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "echo")) {
                        case (?echo_field) ((switch (echo_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let frequency_penalty : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "frequency_penalty")) {
                        case (?frequency_penalty_field) ((switch (frequency_penalty_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
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
                    let logprobs : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) ((switch (logprobs_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let max_tokens : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "max_tokens")) {
                        case (?max_tokens_field) ((switch (max_tokens_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let n : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "n")) {
                        case (?n_field) ((switch (n_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let presence_penalty : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "presence_penalty")) {
                        case (?presence_penalty_field) ((switch (presence_penalty_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let seed : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "seed")) {
                        case (?seed_field) ((switch (seed_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })(switch (seed_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let stop : ?StopConfiguration = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stop")) {
                        case (?stop_field) (StopConfiguration.fromCandidValue(stop_field.1));
                        case null null;
                    };
                    let stream : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stream")) {
                        case (?stream_field) ((switch (stream_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let stream_options : ?ChatCompletionStreamOptions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stream_options")) {
                        case (?stream_options_field) (ChatCompletionStreamOptions.fromCandidValue(stream_options_field.1));
                        case null null;
                    };
                    let suffix : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "suffix")) {
                        case (?suffix_field) ((switch (suffix_field.1) { case (#Text(s)) ?s; case _ null }));
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
                    ?{
                        model;
                        prompt;
                        best_of;
                        echo;
                        frequency_penalty;
                        logit_bias;
                        logprobs;
                        max_tokens;
                        n;
                        presence_penalty;
                        seed;
                        stop;
                        stream;
                        stream_options;
                        suffix;
                        temperature;
                        top_p;
                        user;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
