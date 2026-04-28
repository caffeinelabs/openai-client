/// Static predicted output content, such as the content of a text file that is being regenerated. 

import { type PredictionContentContent; JSON = PredictionContentContent } "./PredictionContentContent";

import { type PredictionContentType; JSON = PredictionContentType } "./PredictionContentType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PredictionContent.mo

module {
    public type PredictionContent = {
        type_ : PredictionContentType;
        content : PredictionContentContent;
    };

    public module JSON {
        public func toCandidValue(value : PredictionContent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", PredictionContentType.toCandidValue(value.type_)));
            List.add(buf, ("content", PredictionContentContent.toCandidValue(value.content)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PredictionContent =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (PredictionContentType.fromCandidValue(type__field.1)) else return null;
                    let ?content_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content") else return null;
                    let ?content = (PredictionContentContent.fromCandidValue(content_field.1)) else return null;
                    ?{
                        type_;
                        content;
                    };
                };
                case _ null;
            };
    };
};
