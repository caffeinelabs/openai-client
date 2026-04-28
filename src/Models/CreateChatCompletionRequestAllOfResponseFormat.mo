/// An object specifying the format that the model must output.  Setting to `{ \"type\": \"json_schema\", \"json_schema\": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).  Setting to `{ \"type\": \"json_object\" }` enables the older JSON mode, which ensures the message the model generates is valid JSON. Using `json_schema` is preferred for models that support it. 

import { type JSONSchema; JSON = JSONSchema } "./JSONSchema";

import { type ResponseFormatJsonObject; JSON = ResponseFormatJsonObject } "./ResponseFormatJsonObject";

import { type ResponseFormatJsonObjectType; JSON = ResponseFormatJsonObjectType } "./ResponseFormatJsonObjectType";

import { type ResponseFormatJsonSchema; JSON = ResponseFormatJsonSchema } "./ResponseFormatJsonSchema";

import { type ResponseFormatText; JSON = ResponseFormatText } "./ResponseFormatText";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionRequestAllOfResponseFormat.mo
// Discriminator-oneOf — wire is a flat object whose `type`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type CreateChatCompletionRequestAllOfResponseFormat = {
        #text_ : ResponseFormatText;
        #json_schema : ResponseFormatJsonSchema;
        #json_object : ResponseFormatJsonObject;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionRequestAllOfResponseFormat) : Candid.Candid =
            switch (value) {
                case (#text_(v)) ResponseFormatText.toCandidValue(v);
                case (#json_schema(v)) ResponseFormatJsonSchema.toCandidValue(v);
                case (#json_object(v)) ResponseFormatJsonObject.toCandidValue(v);
            };

        public func toText(value : CreateChatCompletionRequestAllOfResponseFormat) : Text =
            switch (value) {
                case (#text_(_)) "text";
                case (#json_schema(_)) "json_schema";
                case (#json_object(_)) "json_object";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionRequestAllOfResponseFormat =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("text") {
                                    let ?inner = ResponseFormatText.fromCandidValue(candid) else return null;
                                    ?#text_(inner);
                                };
                                case ("json_schema") {
                                    let ?inner = ResponseFormatJsonSchema.fromCandidValue(candid) else return null;
                                    ?#json_schema(inner);
                                };
                                case ("json_object") {
                                    let ?inner = ResponseFormatJsonObject.fromCandidValue(candid) else return null;
                                    ?#json_object(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
