/// Represents a transcription response returned by model, based on the provided input.

import { type CreateTranscriptionResponseJsonLogprobsInner; JSON = CreateTranscriptionResponseJsonLogprobsInner } "./CreateTranscriptionResponseJsonLogprobsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranscriptionResponseJson.mo

module {
    public type CreateTranscriptionResponseJson = {
        /// The transcribed text.
        text_ : Text;
        /// The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array. 
        logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner];
    };

    public module JSON {
        public func toCandidValue(value : CreateTranscriptionResponseJson) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("text", #Text(value.text_)));
            switch (value.logprobs) {
                case (?v__) List.add(buf, ("logprobs", #Array(Array.map<CreateTranscriptionResponseJsonLogprobsInner, Candid.Candid>(v__, CreateTranscriptionResponseJsonLogprobsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscriptionResponseJson =
            switch (candid) {
                case (#Record(fields)) {
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let logprobs : ?[CreateTranscriptionResponseJsonLogprobsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprobs")) {
                        case (?logprobs_field) ((switch (logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateTranscriptionResponseJsonLogprobsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateTranscriptionResponseJsonLogprobsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        text_;
                        logprobs;
                    };
                };
                case _ null;
            };
    };
};
