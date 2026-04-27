/// A list of the categories along with the input type(s) that the score applies to.

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner";

import { type CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner; JSON = CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner } "./CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner";

// CreateModerationResponseResultsInnerCategoryAppliedInputTypes.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationResponseResultsInnerCategoryAppliedInputTypes = {
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponseResultsInnerCategoryAppliedInputTypes type
        public type JSON = {
            hate : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            hate/threatening : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            harassment : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            harassment/threatening : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            illicit : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            illicit/violent : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            self_harm : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
            self_harm/intent : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
            self_harm/instructions : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
            sexual : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
            sexual/minors : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesHateInner];
            violence : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
            violence/graphic : [CreateModerationResponseResultsInnerCategoryAppliedInputTypesSelfHarmInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponseResultsInnerCategoryAppliedInputTypes) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponseResultsInnerCategoryAppliedInputTypes = ?json;

        // Pre-flight validation (`diagnostics=true`): surface generator-known wire-format
        // gaps as `?Text`, so api.mustache can `throw Error.reject(msg)` instead of letting
        // bad JSON reach the upstream API and come back as an opaque 4xx.
        public func validate(_value : CreateModerationResponseResultsInnerCategoryAppliedInputTypes) : ?Text = null;
    }
}
