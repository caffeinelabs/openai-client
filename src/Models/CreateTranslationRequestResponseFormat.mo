/// The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, or `vtt`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTranslationRequestResponseFormat.mo
/// Enum values: #json, #text_, #srt, #verbose_json, #vtt

module {
    public type CreateTranslationRequestResponseFormat = {
        #json;
        #text_;
        #srt;
        #verbose_json;
        #vtt;
    };

    public module JSON {
        public func toCandidValue(value : CreateTranslationRequestResponseFormat) : Candid.Candid =
            switch (value) {
                case (#json) #Text("json");
                case (#text_) #Text("text");
                case (#srt) #Text("srt");
                case (#verbose_json) #Text("verbose_json");
                case (#vtt) #Text("vtt");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTranslationRequestResponseFormat =
            switch (candid) {
                case (#Text("json")) ?#json;
                case (#Text("text")) ?#text_;
                case (#Text("srt")) ?#srt;
                case (#Text("verbose_json")) ?#verbose_json;
                case (#Text("vtt")) ?#vtt;
                case _ null;
            };

        public func toText(value : CreateTranslationRequestResponseFormat) : Text =
            switch (value) {
                case (#json) "json";
                case (#text_) "text";
                case (#srt) "srt";
                case (#verbose_json) "verbose_json";
                case (#vtt) "vtt";
            };
    };
};
