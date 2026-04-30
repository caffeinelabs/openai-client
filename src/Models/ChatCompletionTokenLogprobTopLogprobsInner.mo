import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionTokenLogprobTopLogprobsInner.mo

module {
    /// The required-fields slice of ChatCompletionTokenLogprobTopLogprobsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionTokenLogprobTopLogprobsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        bytes : ?[Int];
    };

    public type ChatCompletionTokenLogprobTopLogprobsInner = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionTokenLogprobTopLogprobsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionTokenLogprobTopLogprobsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionTokenLogprobTopLogprobsInner {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionTokenLogprobTopLogprobsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionTokenLogprobTopLogprobsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("token", #Text(value.token)));
            List.add(buf, ("logprob", #Float(value.logprob)));
            switch (value.bytes) {
                case (?v__) List.add(buf, ("bytes", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionTokenLogprobTopLogprobsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?token_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token") else return null;
                    let ?token = ((switch (token_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?logprob_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "logprob") else return null;
                    let ?logprob = ((switch (logprob_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null })) else return null;
                    let bytes : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes")) {
                        case (?bytes_field) ((switch (bytes_field.1) {
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
                    ?{
                        token;
                        logprob;
                        bytes;
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
