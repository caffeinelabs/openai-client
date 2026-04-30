/// Parameters for audio output. Required when audio output is requested with `modalities: [\"audio\"]`. [Learn more](/docs/guides/audio). 

import { type VoiceIdsShared; JSON = VoiceIdsShared } "./VoiceIdsShared";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionRequestAllOfAudio.mo

module {
    /// The required-fields slice of CreateChatCompletionRequestAllOfAudio — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        voice : VoiceIdsShared;
        /// Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`, or `pcm16`. 
        format : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateChatCompletionRequestAllOfAudio as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateChatCompletionRequestAllOfAudio = Required and Optional;

    public module JSON {
        // `init` constructs a CreateChatCompletionRequestAllOfAudio from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateChatCompletionRequestAllOfAudio.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateChatCompletionRequestAllOfAudio {
            let ?res = from_candid(to_candid(required)) : ?CreateChatCompletionRequestAllOfAudio else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateChatCompletionRequestAllOfAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("voice", VoiceIdsShared.toCandidValue(value.voice)));
            List.add(buf, ("format", #Text(value.format)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?voice_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "voice") else return null;
                    let ?voice = (VoiceIdsShared.fromCandidValue(voice_field.1)) else return null;
                    let ?format_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "format") else return null;
                    let ?format = ((switch (format_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        voice;
                        format;
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
