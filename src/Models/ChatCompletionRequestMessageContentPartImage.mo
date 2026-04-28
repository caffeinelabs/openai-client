/// Learn about [image inputs](/docs/guides/vision). 

import { type ChatCompletionRequestMessageContentPartImageImageUrl; JSON = ChatCompletionRequestMessageContentPartImageImageUrl } "./ChatCompletionRequestMessageContentPartImageImageUrl";

import { type ChatCompletionRequestMessageContentPartImageType; JSON = ChatCompletionRequestMessageContentPartImageType } "./ChatCompletionRequestMessageContentPartImageType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartImage.mo

module {
    public type ChatCompletionRequestMessageContentPartImage = {
        type_ : ChatCompletionRequestMessageContentPartImageType;
        image_url : ChatCompletionRequestMessageContentPartImageImageUrl;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartImage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionRequestMessageContentPartImageType.toCandidValue(value.type_)));
            List.add(buf, ("image_url", ChatCompletionRequestMessageContentPartImageImageUrl.toCandidValue(value.image_url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartImage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionRequestMessageContentPartImageType.fromCandidValue(type__field.1)) else return null;
                    let ?image_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "image_url") else return null;
                    let ?image_url = (ChatCompletionRequestMessageContentPartImageImageUrl.fromCandidValue(image_url_field.1)) else return null;
                    ?{
                        type_;
                        image_url;
                    };
                };
                case _ null;
            };
    };
};
