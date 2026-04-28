
import { type ChatCompletionDeletedObject; JSON = ChatCompletionDeletedObject } "./ChatCompletionDeletedObject";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionDeleted.mo

module {
    public type ChatCompletionDeleted = {
        object_ : ChatCompletionDeletedObject;
        /// The ID of the chat completion that was deleted.
        id : Text;
        /// Whether the chat completion was deleted.
        deleted : Bool;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionDeleted) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("object", ChatCompletionDeletedObject.toCandidValue(value.object_)));
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("deleted", #Bool(value.deleted)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionDeleted =
            switch (candid) {
                case (#Record(fields)) {
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (ChatCompletionDeletedObject.fromCandidValue(object__field.1)) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        object_;
                        id;
                        deleted;
                    };
                };
                case _ null;
            };
    };
};
