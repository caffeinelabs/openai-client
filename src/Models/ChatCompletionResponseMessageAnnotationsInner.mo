/// A URL citation when using web search. 

import { type ChatCompletionResponseMessageAnnotationsInnerType; JSON = ChatCompletionResponseMessageAnnotationsInnerType } "./ChatCompletionResponseMessageAnnotationsInnerType";

import { type ChatCompletionResponseMessageAnnotationsInnerUrlCitation; JSON = ChatCompletionResponseMessageAnnotationsInnerUrlCitation } "./ChatCompletionResponseMessageAnnotationsInnerUrlCitation";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionResponseMessageAnnotationsInner.mo

module {
    /// The required-fields slice of ChatCompletionResponseMessageAnnotationsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : ChatCompletionResponseMessageAnnotationsInnerType;
        url_citation : ChatCompletionResponseMessageAnnotationsInnerUrlCitation;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionResponseMessageAnnotationsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionResponseMessageAnnotationsInner = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionResponseMessageAnnotationsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionResponseMessageAnnotationsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionResponseMessageAnnotationsInner {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionResponseMessageAnnotationsInner else Runtime.unreachable();
            res
        };

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
