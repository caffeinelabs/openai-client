/// A URL citation when using web search.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionResponseMessageAnnotationsInnerUrlCitation.mo

module {
    /// The required-fields slice of ChatCompletionResponseMessageAnnotationsInnerUrlCitation — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The index of the last character of the URL citation in the message.
        end_index : Int;
        /// The index of the first character of the URL citation in the message.
        start_index : Int;
        /// The URL of the web resource.
        url : Text;
        /// The title of the web resource.
        title : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionResponseMessageAnnotationsInnerUrlCitation as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionResponseMessageAnnotationsInnerUrlCitation = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionResponseMessageAnnotationsInnerUrlCitation from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionResponseMessageAnnotationsInnerUrlCitation.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionResponseMessageAnnotationsInnerUrlCitation {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionResponseMessageAnnotationsInnerUrlCitation else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionResponseMessageAnnotationsInnerUrlCitation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end_index", #Int(value.end_index)));
            List.add(buf, ("start_index", #Int(value.start_index)));
            List.add(buf, ("url", #Text(value.url)));
            List.add(buf, ("title", #Text(value.title)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionResponseMessageAnnotationsInnerUrlCitation =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end_index") else return null;
                    let ?end_index = ((switch (end_index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?start_index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start_index") else return null;
                    let ?start_index = ((switch (start_index_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?title_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title") else return null;
                    let ?title = ((switch (title_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        end_index;
                        start_index;
                        url;
                        title;
                    };
                };
                case _ null;
            };
    };
};
