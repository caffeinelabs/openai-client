
import { type CreateSpeechRequestModel; JSON = CreateSpeechRequestModel } "./CreateSpeechRequestModel";

import { type CreateSpeechRequestResponseFormat; JSON = CreateSpeechRequestResponseFormat } "./CreateSpeechRequestResponseFormat";

import { type VoiceIdsShared; JSON = VoiceIdsShared } "./VoiceIdsShared";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateSpeechRequest.mo

module {
    public type CreateSpeechRequest = {
        model : CreateSpeechRequestModel;
        /// The text to generate audio for. The maximum length is 4096 characters.
        input : Text;
        /// Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
        instructions : ?Text;
        voice : VoiceIdsShared;
        response_format : ?CreateSpeechRequestResponseFormat;
        /// The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
        speed : ?Float;
    };

    public module JSON {
        public func toCandidValue(value : CreateSpeechRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("model", CreateSpeechRequestModel.toCandidValue(value.model)));
            List.add(buf, ("input", #Text(value.input)));
            switch (value.instructions) {
                case (?v__) List.add(buf, ("instructions", #Text(v__)));
                case null ();
            };
            List.add(buf, ("voice", VoiceIdsShared.toCandidValue(value.voice)));
            switch (value.response_format) {
                case (?v__) List.add(buf, ("response_format", CreateSpeechRequestResponseFormat.toCandidValue(v__)));
                case null ();
            };
            switch (value.speed) {
                case (?v__) List.add(buf, ("speed", #Float(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateSpeechRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?model_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model") else return null;
                    let ?model = (CreateSpeechRequestModel.fromCandidValue(model_field.1)) else return null;
                    let ?input_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input") else return null;
                    let ?input = ((switch (input_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let instructions : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "instructions")) {
                        case (?instructions_field) ((switch (instructions_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?voice_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "voice") else return null;
                    let ?voice = (VoiceIdsShared.fromCandidValue(voice_field.1)) else return null;
                    let response_format : ?CreateSpeechRequestResponseFormat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "response_format")) {
                        case (?response_format_field) (CreateSpeechRequestResponseFormat.fromCandidValue(response_format_field.1));
                        case null null;
                    };
                    let speed : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "speed")) {
                        case (?speed_field) ((switch (speed_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    ?{
                        model;
                        input;
                        instructions;
                        voice;
                        response_format;
                        speed;
                    };
                };
                case _ null;
            };
    };
};
