/// JSON Schema response format. Used to generate structured JSON responses. Learn more about [Structured Outputs](/docs/guides/structured-outputs). 

import { type JSONSchema; JSON = JSONSchema } "./JSONSchema";

import { type ResponseFormatJsonSchemaType; JSON = ResponseFormatJsonSchemaType } "./ResponseFormatJsonSchemaType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ResponseFormatJsonSchema.mo

module {
    public type ResponseFormatJsonSchema = {
        type_ : ResponseFormatJsonSchemaType;
        json_schema : JSONSchema;
    };

    public module JSON {
        public func toCandidValue(value : ResponseFormatJsonSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ResponseFormatJsonSchemaType.toCandidValue(value.type_)));
            List.add(buf, ("json_schema", JSONSchema.toCandidValue(value.json_schema)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ResponseFormatJsonSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ResponseFormatJsonSchemaType.fromCandidValue(type__field.1)) else return null;
                    let ?json_schema_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "json_schema") else return null;
                    let ?json_schema = (JSONSchema.fromCandidValue(json_schema_field.1)) else return null;
                    ?{
                        type_;
                        json_schema;
                    };
                };
                case _ null;
            };
    };
};
