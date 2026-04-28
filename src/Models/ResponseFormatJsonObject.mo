/// JSON object response format. An older method of generating JSON responses. Using `json_schema` is recommended for models that support it. Note that the model will not generate JSON without a system or user message instructing it to do so. 

import { type ResponseFormatJsonObjectType; JSON = ResponseFormatJsonObjectType } "./ResponseFormatJsonObjectType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ResponseFormatJsonObject.mo

module {
    public type ResponseFormatJsonObject = {
        type_ : ResponseFormatJsonObjectType;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatJsonObject) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ResponseFormatJsonObjectType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatJsonObject =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ResponseFormatJsonObjectType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        type_;
                    };
                };
                case _ null;
            };
    };
};
