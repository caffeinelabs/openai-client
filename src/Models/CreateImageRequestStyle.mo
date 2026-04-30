/// The style of the generated images. This parameter is only supported for `dall-e-3`. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateImageRequestStyle.mo
/// Enum values: #vivid, #natural

module {
    public type CreateImageRequestStyle = {
        #vivid;
        #natural;
    };

    public module JSON {
        public func toCandidValue(value : CreateImageRequestStyle) : Candid.Candid =
            switch (value) {
                case (#vivid) #Text("vivid");
                case (#natural) #Text("natural");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequestStyle =
            switch (candid) {
                case (#Text("vivid")) ?#vivid;
                case (#Text("natural")) ?#natural;
                case _ null;
            };

        public func toText(value : CreateImageRequestStyle) : Text =
            switch (value) {
                case (#vivid) "vivid";
                case (#natural) "natural";
            };
    };
};
