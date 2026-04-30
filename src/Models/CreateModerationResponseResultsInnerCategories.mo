/// A list of the categories, and whether they are flagged or not.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInnerCategories.mo

module {
    /// The required-fields slice of CreateModerationResponseResultsInnerCategories — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
        hate : Bool;
        /// Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
        hate/threatening : Bool;
        /// Content that expresses, incites, or promotes harassing language towards any target.
        harassment : Bool;
        /// Harassment content that also includes violence or serious harm towards any target.
        harassment/threatening : Bool;
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

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationResponseResultsInnerCategories as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        illicit : ?Bool;
        illicit/violent : ?Bool;
    };

    public type CreateModerationResponseResultsInnerCategories = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationResponseResultsInnerCategories from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationResponseResultsInnerCategories.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationResponseResultsInnerCategories {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationResponseResultsInnerCategories else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationResponseResultsInnerCategories) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hate", #Bool(value.hate)));
            List.add(buf, ("hate/threatening", #Bool(value.hate/threatening)));
            List.add(buf, ("harassment", #Bool(value.harassment)));
            List.add(buf, ("harassment/threatening", #Bool(value.harassment/threatening)));
            switch (value.illicit) {
                case (?v__) List.add(buf, ("illicit", #Bool(v__)));
                case null ();
            };
            switch (value.illicit/violent) {
                case (?v__) List.add(buf, ("illicit/violent", #Bool(v__)));
                case null ();
            };
            List.add(buf, ("self-harm", #Bool(value.self_harm)));
            List.add(buf, ("self-harm/intent", #Bool(value.self_harm/intent)));
            List.add(buf, ("self-harm/instructions", #Bool(value.self_harm/instructions)));
            List.add(buf, ("sexual", #Bool(value.sexual)));
            List.add(buf, ("sexual/minors", #Bool(value.sexual/minors)));
            List.add(buf, ("violence", #Bool(value.violence)));
            List.add(buf, ("violence/graphic", #Bool(value.violence/graphic)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInnerCategories =
            switch (candid) {
                case (#Record(fields)) {
                    let ?hate_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate") else return null;
                    let ?hate = ((switch (hate_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?hate/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate/threatening") else return null;
                    let ?hate/threatening = ((switch (hate/threatening_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?harassment_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment") else return null;
                    let ?harassment = ((switch (harassment_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?harassment/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment/threatening") else return null;
                    let ?harassment/threatening = ((switch (harassment/threatening_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let illicit : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit")) {
                        case (?illicit_field) ((switch (illicit_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let illicit/violent : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit/violent")) {
                        case (?illicit/violent_field) ((switch (illicit/violent_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let ?self_harm_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm") else return null;
                    let ?self_harm = ((switch (self_harm_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?self_harm/intent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/intent") else return null;
                    let ?self_harm/intent = ((switch (self_harm/intent_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?self_harm/instructions_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/instructions") else return null;
                    let ?self_harm/instructions = ((switch (self_harm/instructions_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?sexual_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual") else return null;
                    let ?sexual = ((switch (sexual_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?sexual/minors_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual/minors") else return null;
                    let ?sexual/minors = ((switch (sexual/minors_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?violence_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence") else return null;
                    let ?violence = ((switch (violence_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?violence/graphic_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence/graphic") else return null;
                    let ?violence/graphic = ((switch (violence/graphic_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
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
};
