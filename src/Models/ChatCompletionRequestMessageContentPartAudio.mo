/// Learn about [audio inputs](/docs/guides/audio). 

import { type ChatCompletionRequestMessageContentPartAudioInputAudio; JSON = ChatCompletionRequestMessageContentPartAudioInputAudio } "./ChatCompletionRequestMessageContentPartAudioInputAudio";

import { type ChatCompletionRequestMessageContentPartAudioType; JSON = ChatCompletionRequestMessageContentPartAudioType } "./ChatCompletionRequestMessageContentPartAudioType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartAudio.mo

module {
    /// The required-fields slice of ChatCompletionRequestMessageContentPartAudio — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : ChatCompletionRequestMessageContentPartAudioType;
        input_audio : ChatCompletionRequestMessageContentPartAudioInputAudio;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestMessageContentPartAudio as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionRequestMessageContentPartAudio = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestMessageContentPartAudio from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestMessageContentPartAudio.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestMessageContentPartAudio {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestMessageContentPartAudio else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestMessageContentPartAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionRequestMessageContentPartAudioType.toCandidValue(value.type_)));
            List.add(buf, ("input_audio", ChatCompletionRequestMessageContentPartAudioInputAudio.toCandidValue(value.input_audio)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionRequestMessageContentPartAudioType.fromCandidValue(type__field.1)) else return null;
                    let ?input_audio_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input_audio") else return null;
                    let ?input_audio = (ChatCompletionRequestMessageContentPartAudioInputAudio.fromCandidValue(input_audio_field.1)) else return null;
                    ?{
                        type_;
                        input_audio;
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
