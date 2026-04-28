import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UpdateChatCompletionRequest.mo

module {
    public type UpdateChatCompletionRequest = {
        /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.   Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters. 
        metadata : ?Map<Text, Text>;
    };

    public module JSON {
        public func toCandidValue(value : UpdateChatCompletionRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.metadata) {
                case (?v__) List.add(buf, ("metadata", #Record(Array.map<(Text, Text), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Text)) : (Text, Candid.Candid) = (k, #Text(v))))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UpdateChatCompletionRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let metadata : ?Map<Text, Text> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metadata")) {
                        case (?metadata_field) ((switch (metadata_field.1) {
                        case (#Record(pairs__)) {
                            let buf__ = List.empty<(Text, Text)>();
                            for ((k__, c__) in pairs__.values()) {
                                let #Text(v__) = c__ else return null;
                                List.add(buf__, (k__, v__));
                            };
                            ?fromIter<Text, Text>(List.toArray(buf__).values(), Text.compare);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        metadata;
                    };
                };
                case _ null;
            };
    };
};
