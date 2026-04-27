
import { type CreateModerationResponseResultsInnerCategories; JSON = CreateModerationResponseResultsInnerCategories } "./CreateModerationResponseResultsInnerCategories";

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypes; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypes } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypes";

import { type CreateModerationResponseResultsInnerCategoryScores; JSON = CreateModerationResponseResultsInnerCategoryScores } "./CreateModerationResponseResultsInnerCategoryScores";

// CreateModerationResponseResultsInner.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationResponseResultsInner = {
        /// Whether any of the below categories are flagged.
        flagged : Bool;
        categories : CreateModerationResponseResultsInnerCategories;
        category_scores : CreateModerationResponseResultsInnerCategoryScores;
        category_applied_input_types : CreateModerationResponseResultsInnerCategoryAppliedInputTypes;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponseResultsInner type
        public type JSON = {
            flagged : Bool;
            categories : CreateModerationResponseResultsInnerCategories;
            category_scores : CreateModerationResponseResultsInnerCategoryScores;
            category_applied_input_types : CreateModerationResponseResultsInnerCategoryAppliedInputTypes;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponseResultsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponseResultsInner = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateModerationResponseResultsInner) : ?Text = null;
    }
}
