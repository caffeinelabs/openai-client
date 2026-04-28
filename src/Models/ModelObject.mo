/// The object type, which is always \"model\".
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ModelObject.mo
/// Enum values: #model

module {
    public type ModelObject = {
        #model;
    };

    public module JSON {
        public func toCandidValue(value : ModelObject) : Candid.Candid =
            switch (value) {
                case (#model) #Text("model");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ModelObject =
            switch (candid) {
                case (#Text("model")) ?#model;
                case _ null;
            };

        public func toText(value : ModelObject) : Text =
            switch (value) {
                case (#model) "model";
            };
    };
};
