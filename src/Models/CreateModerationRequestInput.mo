/// Input (or inputs) to classify. Can be a single string, an array of strings, or an array of multi-modal input objects similar to other models. 

import { type CreateModerationRequestInputOneOfInner; JSON = CreateModerationRequestInputOneOfInner } "./CreateModerationRequestInputOneOfInner";

// CreateModerationRequestInput.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateModerationRequestInput = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
        #CreateModerationRequestInputOneOfInner : [CreateModerationRequestInputOneOfInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateModerationRequestInput) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
                case (#CreateModerationRequestInputOneOfInner(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInput type
        public type JSON = {
            #one_of_0 : Text;
            #one_of_1 : [Text];
            #CreateModerationRequestInputOneOfInner : [CreateModerationRequestInputOneOfInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInput) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#one_of_1(v)) #one_of_1(v);
                case (#CreateModerationRequestInputOneOfInner(v)) #CreateModerationRequestInputOneOfInner(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInput =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#one_of_1(v)) ?#one_of_1(v);
                case (#CreateModerationRequestInputOneOfInner(v)) ?#CreateModerationRequestInputOneOfInner(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : CreateModerationRequestInput) : ?Text = null;
    }
}
