import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequestModelAnyOf.mo
/// Enum values: #omni_moderation_latest, #omni_moderation_2024_09_26, #text_moderation_latest, #text_moderation_stable

module {
    public type CreateModerationRequestModelAnyOf = {
        #omni_moderation_latest;
        #omni_moderation_2024_09_26;
        #text_moderation_latest;
        #text_moderation_stable;
    };

    public module JSON {
        public func toCandidValue(value : CreateModerationRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#omni_moderation_latest) #Text("omni-moderation-latest");
                case (#omni_moderation_2024_09_26) #Text("omni-moderation-2024-09-26");
                case (#text_moderation_latest) #Text("text-moderation-latest");
                case (#text_moderation_stable) #Text("text-moderation-stable");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequestModelAnyOf =
            switch (candid) {
                case (#Text("omni-moderation-latest")) ?#omni_moderation_latest;
                case (#Text("omni-moderation-2024-09-26")) ?#omni_moderation_2024_09_26;
                case (#Text("text-moderation-latest")) ?#text_moderation_latest;
                case (#Text("text-moderation-stable")) ?#text_moderation_stable;
                case _ null;
            };

        public func toText(value : CreateModerationRequestModelAnyOf) : Text =
            switch (value) {
                case (#omni_moderation_latest) "omni-moderation-latest";
                case (#omni_moderation_2024_09_26) "omni-moderation-2024-09-26";
                case (#text_moderation_latest) "text-moderation-latest";
                case (#text_moderation_stable) "text-moderation-stable";
            };
    };
};
