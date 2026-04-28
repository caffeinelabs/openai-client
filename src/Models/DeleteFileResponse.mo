
import { type DeleteFileResponseObject; JSON = DeleteFileResponseObject } "./DeleteFileResponseObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DeleteFileResponse.mo

module {
    public type DeleteFileResponse = {
        id : Text;
        object_ : DeleteFileResponseObject;
        deleted : Bool;
    };

    public module JSON {
        public func toCandidValue(value : DeleteFileResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("object", DeleteFileResponseObject.toCandidValue(value.object_)));
            List.add(buf, ("deleted", #Bool(value.deleted)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteFileResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (DeleteFileResponseObject.fromCandidValue(object__field.1)) else return null;
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        id;
                        object_;
                        deleted;
                    };
                };
                case _ null;
            };
    };
};
