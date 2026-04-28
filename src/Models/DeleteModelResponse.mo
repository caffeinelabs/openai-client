import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DeleteModelResponse.mo

module {
    public type DeleteModelResponse = {
        id : Text;
        deleted : Bool;
        object_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : DeleteModelResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("deleted", #Bool(value.deleted)));
            List.add(buf, ("object", #Text(value.object_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteModelResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = ((switch (object__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                        deleted;
                        object_;
                    };
                };
                case _ null;
            };
    };
};
