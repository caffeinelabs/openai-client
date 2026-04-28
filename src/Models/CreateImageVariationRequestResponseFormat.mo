/// The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageVariationRequestResponseFormat.mo
/// Enum values: #url, #b64_json

module {
    public type CreateImageVariationRequestResponseFormat = {
        #url;
        #b64_json;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageVariationRequestResponseFormat) : Candid.Candid =
            switch (value) {
                case (#url) #Text("url");
                case (#b64_json) #Text("b64_json");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageVariationRequestResponseFormat =
            switch (candid) {
                case (#Text("url")) ?#url;
                case (#Text("b64_json")) ?#b64_json;
                case _ null;
            };

        public func toText(value : CreateImageVariationRequestResponseFormat) : Text =
            switch (value) {
                case (#url) "url";
                case (#b64_json) "b64_json";
            };
    };
};
