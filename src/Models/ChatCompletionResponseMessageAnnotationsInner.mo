/// A URL citation when using web search. 

import { type ChatCompletionResponseMessageAnnotationsInnerType; JSON = ChatCompletionResponseMessageAnnotationsInnerType } "./ChatCompletionResponseMessageAnnotationsInnerType";

import { type ChatCompletionResponseMessageAnnotationsInnerUrlCitation; JSON = ChatCompletionResponseMessageAnnotationsInnerUrlCitation } "./ChatCompletionResponseMessageAnnotationsInnerUrlCitation";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionResponseMessageAnnotationsInner.mo

module {
    public type ChatCompletionResponseMessageAnnotationsInner = {
        type_ : ChatCompletionResponseMessageAnnotationsInnerType;
        url_citation : ChatCompletionResponseMessageAnnotationsInnerUrlCitation;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionResponseMessageAnnotationsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionResponseMessageAnnotationsInnerType.toCandidValue(value.type_)));
            List.add(buf, ("url_citation", ChatCompletionResponseMessageAnnotationsInnerUrlCitation.toCandidValue(value.url_citation)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionResponseMessageAnnotationsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionResponseMessageAnnotationsInnerType.fromCandidValue(type__field.1)) else return null;
                    let ?url_citation_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url_citation") else return null;
                    let ?url_citation = (ChatCompletionResponseMessageAnnotationsInnerUrlCitation.fromCandidValue(url_citation_field.1)) else return null;
                    ?{
                        type_;
                        url_citation;
                    };
                };
                case _ null;
            };
    };
};
