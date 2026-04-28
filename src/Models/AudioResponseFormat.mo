/// The format of the output, in one of these options: `json`, `text`, `srt`, `verbose_json`, or `vtt`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// AudioResponseFormat.mo
/// Enum values: #json, #text_, #srt, #verbose_json, #vtt

module {
    public type AudioResponseFormat = {
        #json;
        #text_;
        #srt;
        #verbose_json;
        #vtt;
    };

    public module JSON {
        public func toCandidValue(value : AudioResponseFormat) : Candid.Candid =
            switch (value) {
                case (#json) #Text("json");
                case (#text_) #Text("text");
                case (#srt) #Text("srt");
                case (#verbose_json) #Text("verbose_json");
                case (#vtt) #Text("vtt");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?AudioResponseFormat =
            switch (candid) {
                case (#Text("json")) ?#json;
                case (#Text("text")) ?#text_;
                case (#Text("srt")) ?#srt;
                case (#Text("verbose_json")) ?#verbose_json;
                case (#Text("vtt")) ?#vtt;
                case _ null;
            };

        public func toText(value : AudioResponseFormat) : Text =
            switch (value) {
                case (#json) "json";
                case (#text_) "text";
                case (#srt) "srt";
                case (#verbose_json) "verbose_json";
                case (#vtt) "vtt";
            };
    };
};
