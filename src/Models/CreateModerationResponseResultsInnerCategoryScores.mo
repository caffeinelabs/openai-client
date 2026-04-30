/// A list of the categories along with their scores as predicted by model.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationResponseResultsInnerCategoryScores.mo

module {
    /// The required-fields slice of CreateModerationResponseResultsInnerCategoryScores — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
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

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationResponseResultsInnerCategoryScores as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateModerationResponseResultsInnerCategoryScores = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationResponseResultsInnerCategoryScores from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationResponseResultsInnerCategoryScores.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationResponseResultsInnerCategoryScores {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationResponseResultsInnerCategoryScores else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationResponseResultsInnerCategoryScores) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hate", #Float(value.hate)));
            List.add(buf, ("hate/threatening", #Float(value.hate/threatening)));
            List.add(buf, ("harassment", #Float(value.harassment)));
            List.add(buf, ("harassment/threatening", #Float(value.harassment/threatening)));
            List.add(buf, ("illicit", #Float(value.illicit)));
            List.add(buf, ("illicit/violent", #Float(value.illicit/violent)));
            List.add(buf, ("self-harm", #Float(value.self_harm)));
            List.add(buf, ("self-harm/intent", #Float(value.self_harm/intent)));
            List.add(buf, ("self-harm/instructions", #Float(value.self_harm/instructions)));
            List.add(buf, ("sexual", #Float(value.sexual)));
            List.add(buf, ("sexual/minors", #Float(value.sexual/minors)));
            List.add(buf, ("violence", #Float(value.violence)));
            List.add(buf, ("violence/graphic", #Float(value.violence/graphic)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationResponseResultsInnerCategoryScores =
            switch (candid) {
                case (#Record(fields)) {
                    let ?hate_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate") else return null;
                    let ?hate = ((switch (hate_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?hate/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hate/threatening") else return null;
                    let ?hate/threatening = ((switch (hate/threatening_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?harassment_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment") else return null;
                    let ?harassment = ((switch (harassment_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?harassment/threatening_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "harassment/threatening") else return null;
                    let ?harassment/threatening = ((switch (harassment/threatening_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?illicit_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit") else return null;
                    let ?illicit = ((switch (illicit_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?illicit/violent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "illicit/violent") else return null;
                    let ?illicit/violent = ((switch (illicit/violent_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?self_harm_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm") else return null;
                    let ?self_harm = ((switch (self_harm_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?self_harm/intent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/intent") else return null;
                    let ?self_harm/intent = ((switch (self_harm/intent_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?self_harm/instructions_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "self-harm/instructions") else return null;
                    let ?self_harm/instructions = ((switch (self_harm/instructions_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?sexual_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual") else return null;
                    let ?sexual = ((switch (sexual_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?sexual/minors_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sexual/minors") else return null;
                    let ?sexual/minors = ((switch (sexual/minors_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?violence_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence") else return null;
                    let ?violence = ((switch (violence_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let ?violence/graphic_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "violence/graphic") else return null;
                    let ?violence/graphic = ((switch (violence/graphic_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
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
