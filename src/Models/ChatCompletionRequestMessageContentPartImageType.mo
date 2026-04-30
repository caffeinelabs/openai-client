/// The type of the content part.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartImageType.mo
/// Enum values: #image_url

module {
    public type ChatCompletionRequestMessageContentPartImageType = {
        #image_url;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartImageType) : Candid.Candid =
            switch (value) {
                case (#image_url) #Text("image_url");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartImageType =
            switch (candid) {
                case (#Text("image_url")) ?#image_url;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartImageType) : Text =
            switch (value) {
                case (#image_url) "image_url";
            };
    };
};
