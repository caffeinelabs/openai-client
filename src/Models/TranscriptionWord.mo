import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TranscriptionWord.mo

module {
    public type TranscriptionWord = {
        /// The text content of the word.
        word : Text;
        /// Start time of the word in seconds.
        start : Float;
        /// End time of the word in seconds.
        end : Float;
    };

    public module JSON {
        public func toCandidValue(value : TranscriptionWord) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("word", #Text(value.word)));
            List.add(buf, ("start", #Float(value.start)));
            List.add(buf, ("end", #Float(value.end)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TranscriptionWord =
            switch (candid) {
                case (#Record(fields)) {
                    let ?word_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "word") else return null;
                    let ?word = ((switch (word_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    ?{
                        word;
                        start;
                        end;
                    };
                };
                case _ null;
            };
    };
};
