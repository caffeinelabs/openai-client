/// A list of the categories along with their scores as predicted by model.

// CreateModerationResponseResultsInnerCategoryScores.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationResponseResultsInnerCategoryScores = {
        /// The score for the category 'hate'.
        hate : Float;
        /// The score for the category 'hate/threatening'.
        hate/threatening : Float;
        /// The score for the category 'harassment'.
        harassment : Float;
        /// The score for the category 'harassment/threatening'.
        harassment/threatening : Float;
        /// The score for the category 'illicit'.
        illicit : Float;
        /// The score for the category 'illicit/violent'.
        illicit/violent : Float;
        /// The score for the category 'self-harm'.
        self_harm : Float;
        /// The score for the category 'self-harm/intent'.
        self_harm/intent : Float;
        /// The score for the category 'self-harm/instructions'.
        self_harm/instructions : Float;
        /// The score for the category 'sexual'.
        sexual : Float;
        /// The score for the category 'sexual/minors'.
        sexual/minors : Float;
        /// The score for the category 'violence'.
        violence : Float;
        /// The score for the category 'violence/graphic'.
        violence/graphic : Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponseResultsInnerCategoryScores type
        public type JSON = {
            hate : Float;
            hate/threatening : Float;
            harassment : Float;
            harassment/threatening : Float;
            illicit : Float;
            illicit/violent : Float;
            self_harm : Float;
            self_harm/intent : Float;
            self_harm/instructions : Float;
            sexual : Float;
            sexual/minors : Float;
            violence : Float;
            violence/graphic : Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponseResultsInnerCategoryScores) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponseResultsInnerCategoryScores = ?json;
    }
}
