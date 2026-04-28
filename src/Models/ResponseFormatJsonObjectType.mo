/// The type of response format being defined. Always `json_object`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ResponseFormatJsonObjectType.mo
/// Enum values: #json_object

module {
    public type ResponseFormatJsonObjectType = {
        #json_object;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatJsonObjectType) : Candid.Candid =
            switch (value) {
                case (#json_object) #Text("json_object");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatJsonObjectType =
            switch (candid) {
                case (#Text("json_object")) ?#json_object;
                case _ null;
            };

        public func toText(value : ResponseFormatJsonObjectType) : Text =
            switch (value) {
                case (#json_object) "json_object";
            };
    };
};
