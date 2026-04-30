/// The type of response format being defined. Always `json_schema`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ResponseFormatJsonSchemaType.mo
/// Enum values: #json_schema

module {
    public type ResponseFormatJsonSchemaType = {
        #json_schema;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatJsonSchemaType) : Candid.Candid =
            switch (value) {
                case (#json_schema) #Text("json_schema");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatJsonSchemaType =
            switch (candid) {
                case (#Text("json_schema")) ?#json_schema;
                case _ null;
            };

        public func toText(value : ResponseFormatJsonSchemaType) : Text =
            switch (value) {
                case (#json_schema) "json_schema";
            };
    };
};
