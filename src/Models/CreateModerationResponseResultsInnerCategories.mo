/// A list of the categories, and whether they are flagged or not.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateModerationResponseResultsInnerCategories.mo

module {
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

    public module JSON {
        public func toCandidValue(value : CreateModerationResponseResultsInnerCategories) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hate", #Bool(value.hate)));
            List.add(buf, ("hate/threatening", #Bool(value.hate/threatening)));
            List.add(buf, ("harassment", #Bool(value.harassment)));
            List.add(buf, ("harassment/threatening", #Bool(value.harassment/threatening)));
            List.add(buf, ("illicit", #Bool(value.illicit)));
            List.add(buf, ("illicit/violent", #Bool(value.illicit/violent)));
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
                    let ?illicit_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit") else return null;
                    let ?illicit = ((switch (illicit_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?illicit/violent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit/violent") else return null;
                    let ?illicit/violent = ((switch (illicit/violent_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
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
