import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// VoiceIdsSharedAnyOf.mo
/// Enum values: #alloy, #ash, #ballad, #coral, #echo, #fable, #onyx, #nova, #sage, #shimmer, #verse

module {
    public type VoiceIdsSharedAnyOf = {
        #alloy;
        #ash;
        #ballad;
        #coral;
        #echo;
        #fable;
        #onyx;
        #nova;
        #sage;
        #shimmer;
        #verse;
    };

    public module JSON {
        public func toCandidValue(value : VoiceIdsSharedAnyOf) : Candid.Candid =
            switch (value) {
                case (#alloy) #Text("alloy");
                case (#ash) #Text("ash");
                case (#ballad) #Text("ballad");
                case (#coral) #Text("coral");
                case (#echo) #Text("echo");
                case (#fable) #Text("fable");
                case (#onyx) #Text("onyx");
                case (#nova) #Text("nova");
                case (#sage) #Text("sage");
                case (#shimmer) #Text("shimmer");
                case (#verse) #Text("verse");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?VoiceIdsSharedAnyOf =
            switch (candid) {
                case (#Text("alloy")) ?#alloy;
                case (#Text("ash")) ?#ash;
                case (#Text("ballad")) ?#ballad;
                case (#Text("coral")) ?#coral;
                case (#Text("echo")) ?#echo;
                case (#Text("fable")) ?#fable;
                case (#Text("onyx")) ?#onyx;
                case (#Text("nova")) ?#nova;
                case (#Text("sage")) ?#sage;
                case (#Text("shimmer")) ?#shimmer;
                case (#Text("verse")) ?#verse;
                case _ null;
            };

        public func toText(value : VoiceIdsSharedAnyOf) : Text =
            switch (value) {
                case (#alloy) "alloy";
                case (#ash) "ash";
                case (#ballad) "ballad";
                case (#coral) "coral";
                case (#echo) "echo";
                case (#fable) "fable";
                case (#onyx) "onyx";
                case (#nova) "nova";
                case (#sage) "sage";
                case (#shimmer) "shimmer";
                case (#verse) "verse";
            };
    };
};
