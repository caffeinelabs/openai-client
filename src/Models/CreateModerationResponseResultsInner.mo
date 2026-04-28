
import { type CreateModerationResponseResultsInnerCategories; JSON = CreateModerationResponseResultsInnerCategories } "./CreateModerationResponseResultsInnerCategories";

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypes; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypes } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypes";

import { type CreateModerationResponseResultsInnerCategoryScores; JSON = CreateModerationResponseResultsInnerCategoryScores } "./CreateModerationResponseResultsInnerCategoryScores";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationResponseResultsInner.mo

module {
    public type CreateModerationResponseResultsInner = {
        /// Whether any of the below categories are flagged.
        flagged : Bool;
        categories : CreateModerationResponseResultsInnerCategories;
        category_scores : CreateModerationResponseResultsInnerCategoryScores;
        category_applied_input_types : CreateModerationResponseResultsInnerCategoryAppliedInputTypes;
    };

    public module JSON {
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
