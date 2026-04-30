/// Learn about [image inputs](/docs/guides/vision). 

import { type ChatCompletionRequestMessageContentPartImageImageUrl; JSON = ChatCompletionRequestMessageContentPartImageImageUrl } "./ChatCompletionRequestMessageContentPartImageImageUrl";

import { type ChatCompletionRequestMessageContentPartImageType; JSON = ChatCompletionRequestMessageContentPartImageType } "./ChatCompletionRequestMessageContentPartImageType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartImage.mo

module {
    /// The required-fields slice of ChatCompletionRequestMessageContentPartImage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : ChatCompletionRequestMessageContentPartImageType;
        image_url : ChatCompletionRequestMessageContentPartImageImageUrl;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestMessageContentPartImage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionRequestMessageContentPartImage = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestMessageContentPartImage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestMessageContentPartImage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestMessageContentPartImage {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestMessageContentPartImage else Runtime.unreachable();
            res
        };

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
