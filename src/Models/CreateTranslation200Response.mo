
import { type CreateTranslationResponseJson; JSON = CreateTranslationResponseJson } "./CreateTranslationResponseJson";

import { type CreateTranslationResponseVerboseJson; JSON = CreateTranslationResponseVerboseJson } "./CreateTranslationResponseVerboseJson";

import { type TranscriptionSegment; JSON = TranscriptionSegment } "./TranscriptionSegment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateTranslation200Response.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type CreateTranslation200Response = {
        #CreateTranslationResponseJson : CreateTranslationResponseJson;
        #CreateTranslationResponseVerboseJson : CreateTranslationResponseVerboseJson;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateTranslation200Response) : Text =
            switch (value) {
                case (#CreateTranslationResponseJson(v)) Runtime.unreachable();
                case (#CreateTranslationResponseVerboseJson(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateTranslation200Response) : Candid.Candid =
            switch (value) {
                case (#CreateTranslationResponseJson(v)) #Variant(("CreateTranslationResponseJson", CreateTranslationResponseJson.toCandidValue(v)));
                case (#CreateTranslationResponseVerboseJson(v)) #Variant(("CreateTranslationResponseVerboseJson", CreateTranslationResponseVerboseJson.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslation200Response =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("CreateTranslationResponseJson") {
                            let ?inner = CreateTranslationResponseJson.fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateTranslationResponseJson(inner)
                        };
                        case ("CreateTranslationResponseVerboseJson") {
                            let ?inner = CreateTranslationResponseVerboseJson.fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateTranslationResponseVerboseJson(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
