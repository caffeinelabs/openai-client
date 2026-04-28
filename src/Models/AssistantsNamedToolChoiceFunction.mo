import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AssistantsNamedToolChoiceFunction.mo

module {
    public type AssistantsNamedToolChoiceFunction = {
        /// The name of the function to call.
        name : Text;
    };

    public module JSON {
        public func toCandidValue(value : AssistantsNamedToolChoiceFunction) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("name", #Text(value.name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AssistantsNamedToolChoiceFunction =
            switch (candid) {
                case (#Record(fields)) {
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        name;
                    };
                };
                case _ null;
            };
    };
};
