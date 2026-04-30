/// The type of the event. Always `transcript.text.delta`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TranscriptTextDeltaEventType.mo
/// Enum values: #transcript_text_delta

module {
    public type TranscriptTextDeltaEventType = {
        #transcript_text_delta;
    };

    public module JSON {
        public func toCandidValue(value : TranscriptTextDeltaEventType) : Candid.Candid =
            switch (value) {
                case (#transcript_text_delta) #Text("transcript.text.delta");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptTextDeltaEventType =
            switch (candid) {
                case (#Text("transcript.text.delta")) ?#transcript_text_delta;
                case _ null;
            };

        public func toText(value : TranscriptTextDeltaEventType) : Text =
            switch (value) {
                case (#transcript_text_delta) "transcript.text.delta";
            };
    };
};
