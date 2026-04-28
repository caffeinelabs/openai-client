/// A URL citation when using web search.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionResponseMessageAnnotationsInnerUrlCitation.mo

module {
    public type ChatCompletionResponseMessageAnnotationsInnerUrlCitation = {
        /// The index of the last character of the URL citation in the message.
        end_index : Int;
        /// The index of the first character of the URL citation in the message.
        start_index : Int;
        /// The URL of the web resource.
        url : Text;
        /// The title of the web resource.
        title : Text;
    };

    public module JSON {
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
                    let ?end_index = ((switch (end_index_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let ?start_index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start_index") else return null;
                    let ?start_index = ((switch (start_index_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
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
