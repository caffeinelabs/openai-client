
import { type CreateModerationRequestInput; JSON = CreateModerationRequestInput } "./CreateModerationRequestInput";

import { type CreateModerationRequestModel; JSON = CreateModerationRequestModel } "./CreateModerationRequestModel";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateModerationRequest.mo

module {
    public type CreateModerationRequest = {
        input : CreateModerationRequestInput;
        model : ?CreateModerationRequestModel;
    };

    public module JSON {
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
};
