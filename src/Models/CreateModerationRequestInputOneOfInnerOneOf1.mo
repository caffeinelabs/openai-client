/// An object describing text to classify.

import { type CreateModerationRequestInputOneOfInnerOneOf1Type; JSON = CreateModerationRequestInputOneOfInnerOneOf1Type } "./CreateModerationRequestInputOneOfInnerOneOf1Type";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateModerationRequestInputOneOfInnerOneOf1.mo

module {
    public type CreateModerationRequestInputOneOfInnerOneOf1 = {
        type_ : CreateModerationRequestInputOneOfInnerOneOf1Type;
        /// A string of text to classify.
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestInputOneOfInnerOneOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", CreateModerationRequestInputOneOfInnerOneOf1Type.toCandidValue(value.type_)));
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInputOneOfInnerOneOf1 =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (CreateModerationRequestInputOneOfInnerOneOf1Type.fromCandidValue(type__field.1)) else return null;
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        type_;
                        text_;
                    };
                };
                case _ null;
            };
    };
};
