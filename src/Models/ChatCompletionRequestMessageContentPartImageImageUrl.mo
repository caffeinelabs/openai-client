
import { type ChatCompletionRequestMessageContentPartImageImageUrlDetail; JSON = ChatCompletionRequestMessageContentPartImageImageUrlDetail } "./ChatCompletionRequestMessageContentPartImageImageUrlDetail";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartImageImageUrl.mo

module {
    public type ChatCompletionRequestMessageContentPartImageImageUrl = {
        /// Either a URL of the image or the base64 encoded image data.
        url : Text;
        detail : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartImageImageUrl) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("url", #Text(value.url)));
            switch (value.detail) {
                case (?v__) List.add(buf, ("detail", ChatCompletionRequestMessageContentPartImageImageUrlDetail.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartImageImageUrl =
            switch (candid) {
                case (#Record(fields)) {
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let detail : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "detail")) {
                        case (?detail_field) (ChatCompletionRequestMessageContentPartImageImageUrlDetail.fromCandidValue(detail_field.1));
                        case null null;
                    };
                    ?{
                        url;
                        detail;
                    };
                };
                case _ null;
            };
    };
};
