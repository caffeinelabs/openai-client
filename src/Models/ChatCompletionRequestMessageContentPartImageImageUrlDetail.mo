/// Specifies the detail level of the image. Learn more in the [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestMessageContentPartImageImageUrlDetail.mo
/// Enum values: #auto, #low, #high

module {
    public type ChatCompletionRequestMessageContentPartImageImageUrlDetail = {
        #auto;
        #low;
        #high;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestMessageContentPartImageImageUrlDetail) : Candid.Candid =
            switch (value) {
                case (#auto) #Text("auto");
                case (#low) #Text("low");
                case (#high) #Text("high");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartImageImageUrlDetail =
            switch (candid) {
                case (#Text("auto")) ?#auto;
                case (#Text("low")) ?#low;
                case (#Text("high")) ?#high;
                case _ null;
            };

        public func toText(value : ChatCompletionRequestMessageContentPartImageImageUrlDetail) : Text =
            switch (value) {
                case (#auto) "auto";
                case (#low) "low";
                case (#high) "high";
            };
    };
};
