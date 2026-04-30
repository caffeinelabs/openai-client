/// The type of the predicted content you want to provide. This type is currently always `content`. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PredictionContentType.mo
/// Enum values: #content

module {
    public type PredictionContentType = {
        #content;
    };

    public module JSON {
        public func toCandidValue(value : PredictionContentType) : Candid.Candid =
            switch (value) {
                case (#content) #Text("content");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?PredictionContentType =
            switch (candid) {
                case (#Text("content")) ?#content;
                case _ null;
            };

        public func toText(value : PredictionContentType) : Text =
            switch (value) {
                case (#content) "content";
            };
    };
};
