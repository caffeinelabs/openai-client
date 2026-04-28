/// Input (or inputs) to classify. Can be a single string, an array of strings, or an array of multi-modal input objects similar to other models. 

import { type CreateModerationRequestInputOneOfInner; JSON = CreateModerationRequestInputOneOfInner } "./CreateModerationRequestInputOneOfInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateModerationRequestInput.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type CreateModerationRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #CreateModerationRequestInputOneOfInner : [CreateModerationRequestInputOneOfInner];
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateModerationRequestInput) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#CreateModerationRequestInputOneOfInner(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : CreateModerationRequestInput) : Candid.Candid =
            switch (value) {
                case (#one_of_0(v)) #Variant(("one_of_0", Text.toCandidValue(v)));
                case (#one_of_1(v)) #Variant(("one_of_1", [Text].toCandidValue(v)));
                case (#CreateModerationRequestInputOneOfInner(v)) #Variant(("CreateModerationRequestInputOneOfInner", [CreateModerationRequestInputOneOfInner].toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestInput =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("one_of_0") {
                            let ?inner = Text.fromCandidValue(tagAndVal.1) else return null;
                            ?#one_of_0(inner)
                        };
                        case ("one_of_1") {
                            let ?inner = [Text].fromCandidValue(tagAndVal.1) else return null;
                            ?#one_of_1(inner)
                        };
                        case ("CreateModerationRequestInputOneOfInner") {
                            let ?inner = [CreateModerationRequestInputOneOfInner].fromCandidValue(tagAndVal.1) else return null;
                            ?#CreateModerationRequestInputOneOfInner(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
