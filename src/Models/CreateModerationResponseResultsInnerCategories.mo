/// A list of the categories, and whether they are flagged or not.

// CreateModerationResponseResultsInnerCategories.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationResponseResultsInnerCategories = {
        /// Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
        hate : Bool;
        /// Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
        hate/threatening : Bool;
        /// Content that expresses, incites, or promotes harassing language towards any target.
        harassment : Bool;
        /// Harassment content that also includes violence or serious harm towards any target.
        harassment/threatening : Bool;
        /// Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, \"how to shoplift\" would fit this category.
        illicit : Bool;
        /// Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
        illicit/violent : Bool;
        /// Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
        self_harm : Bool;
        /// Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
        self_harm/intent : Bool;
        /// Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
        self_harm/instructions : Bool;
        /// Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
        sexual : Bool;
        /// Sexual content that includes an individual who is under 18 years old.
        sexual/minors : Bool;
        /// Content that depicts death, violence, or physical injury.
        violence : Bool;
        /// Content that depicts death, violence, or physical injury in graphic detail.
        violence/graphic : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationResponseResultsInnerCategories type
        public type JSON = {
            hate : Bool;
            hate/threatening : Bool;
            harassment : Bool;
            harassment/threatening : Bool;
            illicit : Bool;
            illicit/violent : Bool;
            self_harm : Bool;
            self_harm/intent : Bool;
            self_harm/instructions : Bool;
            sexual : Bool;
            sexual/minors : Bool;
            violence : Bool;
            violence/graphic : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationResponseResultsInnerCategories) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationResponseResultsInnerCategories = ?json;
    }
}
