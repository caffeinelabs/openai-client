
import { type CreateTranscriptionResponseJson; JSON = CreateTranscriptionResponseJson } "./CreateTranscriptionResponseJson";

import { type CreateTranscriptionResponseJsonLogprobsInner; JSON = CreateTranscriptionResponseJsonLogprobsInner } "./CreateTranscriptionResponseJsonLogprobsInner";

import { type CreateTranscriptionResponseVerboseJson; JSON = CreateTranscriptionResponseVerboseJson } "./CreateTranscriptionResponseVerboseJson";

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";

import { type TranscriptionWord; JSON = TranscriptionWord } "./TranscriptionWord";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateTranscription200Response.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type CreateTranscription200Response = {
        #CreateTranscriptionResponseJson : CreateTranscriptionResponseJson;
        #CreateTranscriptionResponseVerboseJson : CreateTranscriptionResponseVerboseJson;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateTranscription200Response) : Text =
            switch (value) {
                case (#CreateTranscriptionResponseJson(v)) Runtime.unreachable();
                case (#CreateTranscriptionResponseVerboseJson(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateTranscription200Response) : Candid.Candid =
            switch (value) {
                case (#CreateTranscriptionResponseJson(v)) #Variant(("CreateTranscriptionResponseJson", CreateTranscriptionResponseJson.toCandidValue(v)));
                case (#CreateTranscriptionResponseVerboseJson(v)) #Variant(("CreateTranscriptionResponseVerboseJson", CreateTranscriptionResponseVerboseJson.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranscription200Response =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("CreateTranscriptionResponseJson") {
                            let ?inner = CreateTranscriptionResponseJson.fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateTranscriptionResponseJson(inner)
                        };
                        case ("CreateTranscriptionResponseVerboseJson") {
                            let ?inner = CreateTranscriptionResponseVerboseJson.fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateTranscriptionResponseVerboseJson(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
