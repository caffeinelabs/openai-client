/// The type of the URL citation. Always `url_citation`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionResponseMessageAnnotationsInnerType.mo
/// Enum values: #url_citation

module {
    public type ChatCompletionResponseMessageAnnotationsInnerType = {
        #url_citation;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionResponseMessageAnnotationsInnerType) : Candid.Candid =
            switch (value) {
                case (#url_citation) #Text("url_citation");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionResponseMessageAnnotationsInnerType =
            switch (candid) {
                case (#Text("url_citation")) ?#url_citation;
                case _ null;
            };

        public func toText(value : ChatCompletionResponseMessageAnnotationsInnerType) : Text =
            switch (value) {
                case (#url_citation) "url_citation";
            };
    };
};
