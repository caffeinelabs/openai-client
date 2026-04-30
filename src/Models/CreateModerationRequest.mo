
import { type CreateModerationRequestInput; JSON = CreateModerationRequestInput } "./CreateModerationRequestInput";

import { type CreateModerationRequestModel; JSON = CreateModerationRequestModel } "./CreateModerationRequestModel";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateModerationRequest.mo

module {
    /// The required-fields slice of CreateModerationRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        input : CreateModerationRequestInput;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateModerationRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        model : ?CreateModerationRequestModel;
    };

    public type CreateModerationRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateModerationRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateModerationRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateModerationRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateModerationRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateModerationRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("input", CreateModerationRequestInput.toCandidValue(value.input)));
            switch (value.model) {
                case (?v__) List.add(buf, ("model", CreateModerationRequestModel.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateModerationRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?input_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "input") else return null;
                    let ?input = (CreateModerationRequestInput.fromCandidValue(input_field.1)) else return null;
                    let model : ?CreateModerationRequestModel = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model")) {
                        case (?model_field) (CreateModerationRequestModel.fromCandidValue(model_field.1));
                        case null null;
                    };
                    ?{
                        input;
                        model;
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
