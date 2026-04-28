/// Data about a previous audio response from the model.  [Learn more](/docs/guides/audio). 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestAssistantMessageAudio.mo

module {
    public type ChatCompletionRequestAssistantMessageAudio = {
        /// Unique identifier for a previous audio response from the model. 
        id : Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionRequestAssistantMessageAudio) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestAssistantMessageAudio =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                    };
                };
                case _ null;
            };
    };
};
