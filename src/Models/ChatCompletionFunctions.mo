import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionFunctions.mo

module {
    public type ChatCompletionFunctions = {
        /// A description of what the function does, used by the model to choose when and how to call the function.
        description : ?Text;
        /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
        name : Text;
        /// The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.   Omitting `parameters` defines a function with an empty parameter list.
        parameters : ?Map<Text, Text>;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionFunctions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            List.add(buf, ("name", #Text(value.name)));
            switch (value.parameters) {
                case (?v__) List.add(buf, ("parameters", #Record(Array.map<(Text, Text), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, Text)) : (Text, Candid.Candid) = (k, #Text(v))))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionFunctions =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let parameters : ?Map<Text, Text> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "parameters")) {
                        case (?parameters_field) ((switch (parameters_field.1) {
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
                        description;
                        name;
                        parameters;
                    };
                };
                case _ null;
            };
    };
};
