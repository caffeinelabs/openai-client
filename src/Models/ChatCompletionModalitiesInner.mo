import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionModalitiesInner.mo
/// Enum values: #text_, #audio

module {
    public type ChatCompletionModalitiesInner = {
        #text_;
        #audio;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionModalitiesInner) : Candid.Candid =
            switch (value) {
                case (#text_) #Text("text");
                case (#audio) #Text("audio");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionModalitiesInner =
            switch (candid) {
                case (#Text("text")) ?#text_;
                case (#Text("audio")) ?#audio;
                case _ null;
            };

        public func toText(value : ChatCompletionModalitiesInner) : Text =
            switch (value) {
                case (#text_) "text";
                case (#audio) "audio";
            };
    };
};
