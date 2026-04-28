/// Default response format. Used to generate text responses. 

import { type ResponseFormatTextType; JSON = ResponseFormatTextType } "./ResponseFormatTextType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ResponseFormatText.mo

module {
    public type ResponseFormatText = {
        type_ : ResponseFormatTextType;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatText) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ResponseFormatTextType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatText =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ResponseFormatTextType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        type_;
                    };
                };
                case _ null;
            };
    };
};
