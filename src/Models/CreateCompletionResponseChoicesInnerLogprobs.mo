import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateCompletionResponseChoicesInnerLogprobs.mo

module {
    /// The required-fields slice of CreateCompletionResponseChoicesInnerLogprobs — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateCompletionResponseChoicesInnerLogprobs as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        text_offset : ?[Int];
        token_logprobs : ?[Float];
        tokens : ?[Text];
        top_logprobs : ?[Map<Text, Float>];
    };

    public type CreateCompletionResponseChoicesInnerLogprobs = Required and Optional;

    public module JSON {
        // `init` constructs a CreateCompletionResponseChoicesInnerLogprobs from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateCompletionResponseChoicesInnerLogprobs.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateCompletionResponseChoicesInnerLogprobs {
            let ?res = from_candid(to_candid(required)) : ?CreateCompletionResponseChoicesInnerLogprobs else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateCompletionResponseChoicesInnerLogprobs) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.text_offset) {
                case (?v__) List.add(buf, ("text_offset", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            switch (value.token_logprobs) {
                case (?v__) List.add(buf, ("token_logprobs", #Array(Array.map<Float, Candid.Candid>(v__, func(f : Float) : Candid.Candid = #Float(f)))));
                case null ();
            };
            switch (value.tokens) {
                case (?v__) List.add(buf, ("tokens", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.top_logprobs) {
                case (?v__) List.add(buf, ("top_logprobs", #Array(Array.map<Map<Text, Float>, Candid.Candid>(v__, func(_ : Map<Text, Float>) : Candid.Candid = Runtime.unreachable()))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseChoicesInnerLogprobs =
            switch (candid) {
                case (#Record(fields)) {
                    let text_offset : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text_offset")) {
                        case (?text_offset_field) ((switch (text_offset_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let ?i__ = (switch (c__) { case (#Int(j)) ?j; case (#Nat(k)) ?k; case _ null }) else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let token_logprobs : ?[Float] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token_logprobs")) {
                        case (?token_logprobs_field) ((switch (token_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let ?f__ = (switch (c__) { case (#Float(g)) ?g; case (#Int(j)) ?Float.fromInt(j); case (#Nat(k)) ?Float.fromInt(k); case _ null }) else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let tokens : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tokens")) {
                        case (?tokens_field) ((switch (tokens_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let top_logprobs : ?[Map<Text, Float>] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_logprobs")) {
                        case (?top_logprobs_field) ((switch (top_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Map<Text, Float>>();
                            for (c__ in xs__.values()) {
                                let m__ : Map<Text, Float> = Runtime.unreachable();
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        text_offset;
                        token_logprobs;
                        tokens;
                        top_logprobs;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
