/// The format in which generated images with `dall-e-2` and `dall-e-3` are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter isn't supported for `gpt-image-1` which will always return base64-encoded images.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateImageRequestResponseFormat.mo
/// Enum values: #url, #b64_json

module {
    public type CreateImageRequestResponseFormat = {
        #url;
        #b64_json;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestResponseFormat) : Candid.Candid =
            switch (value) {
                case (#url) #Text("url");
                case (#b64_json) #Text("b64_json");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestResponseFormat =
            switch (candid) {
                case (#Text("url")) ?#url;
                case (#Text("b64_json")) ?#b64_json;
                case _ null;
            };

        public func toText(value : CreateImageRequestResponseFormat) : Text =
            switch (value) {
                case (#url) "url";
                case (#b64_json) "b64_json";
            };
    };
};
