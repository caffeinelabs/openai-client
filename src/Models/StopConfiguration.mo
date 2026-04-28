/// Not supported with latest reasoning models `o3` and `o4-mini`.  Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// StopConfiguration.mo
// oneOf<Text, [Text]> on the wire — emit as
// `#string : Text` or `#array : [...]` user-side, projected to JSON string-or-array directly.

module {
    public type StopConfiguration = {
        #string : Text;
        #array : [Text];
    };

    public module JSON {
        public func toCandidValue(value : StopConfiguration) : Candid.Candid =
            switch (value) {
                case (#string(s)) #Text(s);
                case (#array(xs)) #Array(Array.map<Text, Candid.Candid>(
                    xs,
                    func(s : Text) : Candid.Candid = #Text(s)
                ));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?StopConfiguration =
            switch (candid) {
                case (#Text(s)) ?#string(s);
                case (#Array(xs)) {
                    let buf = List.empty<Text>();
                    for (c in xs.values()) {
                        let ?p = (switch c { case (#Text(s)) ?s; case _ null }) else return null;
                        List.add(buf, p);
                    };
                    ?#array(List.toArray(buf));
                };
                case _ null;
            };
    };
};
