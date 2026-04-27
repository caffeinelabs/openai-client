
import { type CreateModerationRequestInputOneOfInnerOneOf; JSON = CreateModerationRequestInputOneOfInnerOneOf } "./CreateModerationRequestInputOneOfInnerOneOf";

import { type CreateModerationRequestInputOneOfInnerOneOf1; JSON = CreateModerationRequestInputOneOfInnerOneOf1 } "./CreateModerationRequestInputOneOfInnerOneOf1";

import { type CreateModerationRequestInputOneOfInnerOneOf1Type; JSON = CreateModerationRequestInputOneOfInnerOneOf1Type } "./CreateModerationRequestInputOneOfInnerOneOf1Type";

import { type CreateModerationRequestInputOneOfInnerOneOfImageUrl; JSON = CreateModerationRequestInputOneOfInnerOneOfImageUrl } "./CreateModerationRequestInputOneOfInnerOneOfImageUrl";

// CreateModerationRequestInputOneOfInner.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type CreateModerationRequestInputOneOfInner = {
        #CreateModerationRequestInputOneOfInnerOneOf : CreateModerationRequestInputOneOfInnerOneOf;
        #CreateModerationRequestInputOneOfInnerOneOf1 : CreateModerationRequestInputOneOfInnerOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : CreateModerationRequestInputOneOfInner) : Text =
            switch (value) {
                case (#CreateModerationRequestInputOneOfInnerOneOf(v)) Runtime.unreachable();
                case (#CreateModerationRequestInputOneOfInnerOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInner type
        public type JSON = {
            #CreateModerationRequestInputOneOfInnerOneOf : CreateModerationRequestInputOneOfInnerOneOf;
            #CreateModerationRequestInputOneOfInnerOneOf1 : CreateModerationRequestInputOneOfInnerOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInner) : JSON =
            switch (value) {
                case (#CreateModerationRequestInputOneOfInnerOneOf(v)) #CreateModerationRequestInputOneOfInnerOneOf(v);
                case (#CreateModerationRequestInputOneOfInnerOneOf1(v)) #CreateModerationRequestInputOneOfInnerOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInner =
            switch (json) {
                case (#CreateModerationRequestInputOneOfInnerOneOf(v)) ?#CreateModerationRequestInputOneOfInnerOneOf(v);
                case (#CreateModerationRequestInputOneOfInnerOneOf1(v)) ?#CreateModerationRequestInputOneOfInnerOneOf1(v);
            };

        // Pre-flight validation (`diagnostics=true`): oneOf variants currently
        // pass through (recursive variant inspection is a v2 follow-up).
        public func validate(_value : CreateModerationRequestInputOneOfInner) : ?Text = null;
    }
}
