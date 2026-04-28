/// The type of the event. Always `transcript.text.done`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TranscriptTextDoneEventType.mo
/// Enum values: #transcript_text_done

module {
    public type TranscriptTextDoneEventType = {
        #transcript_text_done;
    };

    public module JSON {
        public func toCandidValue(value : TranscriptTextDoneEventType) : Candid.Candid =
            switch (value) {
                case (#transcript_text_done) #Text("transcript.text.done");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptTextDoneEventType =
            switch (candid) {
                case (#Text("transcript.text.done")) ?#transcript_text_done;
                case _ null;
            };

        public func toText(value : TranscriptTextDoneEventType) : Text =
            switch (value) {
                case (#transcript_text_done) "transcript.text.done";
            };
    };
};
