
import { type CreateModerationResponseResultsInnerCategories; JSON = CreateModerationResponseResultsInnerCategories } "./CreateModerationResponseResultsInnerCategories";

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypes; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypes } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypes";

import { type CreateModerationResponseResultsInnerCategoryScores; JSON = CreateModerationResponseResultsInnerCategoryScores } "./CreateModerationResponseResultsInnerCategoryScores";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInner.mo

module {
    /// The required-fields slice of CreateModerationResponseResultsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Whether any of the below categories are flagged.
        flagged : Bool;
        categories : CreateModerationResponseResultsInnerCategories;
        category_scores : CreateModerationResponseResultsInnerCategoryScores;
        category_applied_input_types : CreateModerationResponseResultsInnerCategoryAppliedInputTypes;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationResponseResultsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateModerationResponseResultsInner = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationResponseResultsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationResponseResultsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationResponseResultsInner {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationResponseResultsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationResponseResultsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("flagged", #Bool(value.flagged)));
            List.add(buf, ("categories", CreateModerationResponseResultsInnerCategories.toCandidValue(value.categories)));
            List.add(buf, ("category_scores", CreateModerationResponseResultsInnerCategoryScores.toCandidValue(value.category_scores)));
            List.add(buf, ("category_applied_input_types", CreateModerationResponseResultsInnerCategoryAppliedInputTypes.toCandidValue(value.category_applied_input_types)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?flagged_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "flagged") else return null;
                    let ?flagged = ((switch (flagged_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?categories_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "categories") else return null;
                    let ?categories = (CreateModerationResponseResultsInnerCategories.fromCandidValue(categories_field.1)) else return null;
                    let ?category_scores_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category_scores") else return null;
                    let ?category_scores = (CreateModerationResponseResultsInnerCategoryScores.fromCandidValue(category_scores_field.1)) else return null;
                    let ?category_applied_input_types_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category_applied_input_types") else return null;
                    let ?category_applied_input_types = (CreateModerationResponseResultsInnerCategoryAppliedInputTypes.fromCandidValue(category_applied_input_types_field.1)) else return null;
                    ?{
                        flagged;
                        categories;
                        category_scores;
                        category_applied_input_types;
                    };
                };
                case _ null;
            };
    };
};
