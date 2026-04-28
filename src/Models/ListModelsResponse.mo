
import { type ListAuditLogsResponseObject; JSON = ListAuditLogsResponseObject } "./ListAuditLogsResponseObject";

import { type Model; JSON = Model } "./Model";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ListModelsResponse.mo

module {
    public type ListModelsResponse = {
        object_ : ListAuditLogsResponseObject;
        data : [Model];
    };

    public module JSON {
        public func toCandidValue(value : ListModelsResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("object", ListAuditLogsResponseObject.toCandidValue(value.object_)));
            List.add(buf, ("data", #Array(Array.map<Model, Candid.Candid>(value.data, Model.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListModelsResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (ListAuditLogsResponseObject.fromCandidValue(object__field.1)) else return null;
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Model>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Model.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        object_;
                        data;
                    };
                };
                case _ null;
            };
    };
};
