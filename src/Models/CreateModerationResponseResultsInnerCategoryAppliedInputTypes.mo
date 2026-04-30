/// A list of the categories along with the input type(s) that the score applies to.

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner";

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInnerCategoryAppliedInputTypes.mo

module {
    /// The required-fields slice of CreateModerationResponseResultsInnerCategoryAppliedInputTypes — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The applied input type(s) for the category 'hate'.
        hate : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'hate/threatening'.
        hate/threatening : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'harassment'.
        harassment : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'harassment/threatening'.
        harassment/threatening : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'illicit'.
        illicit : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'illicit/violent'.
        illicit/violent : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'self-harm'.
        self_harm : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        /// The applied input type(s) for the category 'self-harm/intent'.
        self_harm/intent : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        /// The applied input type(s) for the category 'self-harm/instructions'.
        self_harm/instructions : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        /// The applied input type(s) for the category 'sexual'.
        sexual : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        /// The applied input type(s) for the category 'sexual/minors'.
        sexual/minors : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
        /// The applied input type(s) for the category 'violence'.
        violence : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        /// The applied input type(s) for the category 'violence/graphic'.
        violence/graphic : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationResponseResultsInnerCategoryAppliedInputTypes as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateModerationResponseResultsInnerCategoryAppliedInputTypes = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationResponseResultsInnerCategoryAppliedInputTypes from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationResponseResultsInnerCategoryAppliedInputTypes.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationResponseResultsInnerCategoryAppliedInputTypes {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypes else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypes) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hate", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.hate, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("hate/threatening", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.hate/threatening, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("harassment", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.harassment, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("harassment/threatening", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.harassment/threatening, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("illicit", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.illicit, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("illicit/violent", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.illicit/violent, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("self-harm", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.self_harm, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            List.add(buf, ("self-harm/intent", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.self_harm/intent, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            List.add(buf, ("self-harm/instructions", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.self_harm/instructions, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            List.add(buf, ("sexual", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.sexual, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            List.add(buf, ("sexual/minors", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner, Candid.Candid>(value.sexual/minors, CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.toCandidValue))));
            List.add(buf, ("violence", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.violence, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            List.add(buf, ("violence/graphic", #Array(Array.map<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner, Candid.Candid>(value.violence/graphic, CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypes =
            switch (candid) {
                case (#Record(fields)) {
                    let ?hate_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate") else return null;
                    let ?hate = ((switch (hate_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?hate/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate/threatening") else return null;
                    let ?hate/threatening = ((switch (hate/threatening_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?harassment_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment") else return null;
                    let ?harassment = ((switch (harassment_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?harassment/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment/threatening") else return null;
                    let ?harassment/threatening = ((switch (harassment/threatening_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?illicit_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit") else return null;
                    let ?illicit = ((switch (illicit_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?illicit/violent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit/violent") else return null;
                    let ?illicit/violent = ((switch (illicit/violent_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?self_harm_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm") else return null;
                    let ?self_harm = ((switch (self_harm_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?self_harm/intent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/intent") else return null;
                    let ?self_harm/intent = ((switch (self_harm/intent_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?self_harm/instructions_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/instructions") else return null;
                    let ?self_harm/instructions = ((switch (self_harm/instructions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?sexual_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual") else return null;
                    let ?sexual = ((switch (sexual_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?sexual/minors_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual/minors") else return null;
                    let ?sexual/minors = ((switch (sexual/minors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?violence_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence") else return null;
                    let ?violence = ((switch (violence_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?violence/graphic_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence/graphic") else return null;
                    let ?violence/graphic = ((switch (violence/graphic_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        hate;
                        hate/threatening;
                        harassment;
                        harassment/threatening;
                        illicit;
                        illicit/violent;
                        self_harm;
                        self_harm/intent;
                        self_harm/instructions;
                        sexual;
                        sexual/minors;
                        violence;
                        violence/graphic;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
