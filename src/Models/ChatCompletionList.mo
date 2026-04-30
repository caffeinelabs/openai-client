/// An object representing a list of Chat Completions. 

import { type ChatCompletionListObject; JSON = ChatCompletionListObject } "./ChatCompletionListObject";

import { type CreateChatCompletionResponse; JSON = CreateChatCompletionResponse } "./CreateChatCompletionResponse";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionList.mo

module {
    /// The required-fields slice of ChatCompletionList — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        object_ : ChatCompletionListObject;
        /// An array of chat completion objects. 
        data : [CreateChatCompletionResponse];
        /// The identifier of the first chat completion in the data array.
        first_id : Text;
        /// The identifier of the last chat completion in the data array.
        last_id : Text;
        /// Indicates whether there are more Chat Completions available.
        has_more : Bool;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionList as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionList = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionList from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionList.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionList {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionList else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionList) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("object", ChatCompletionListObject.toCandidValue(value.object_)));
            List.add(buf, ("data", #Array(Array.map<CreateChatCompletionResponse, Candid.Candid>(value.data, CreateChatCompletionResponse.toCandidValue))));
            List.add(buf, ("first_id", #Text(value.first_id)));
            List.add(buf, ("last_id", #Text(value.last_id)));
            List.add(buf, ("has_more", #Bool(value.has_more)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionList =
            switch (candid) {
                case (#Record(fields)) {
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (ChatCompletionListObject.fromCandidValue(object__field.1)) else return null;
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CreateChatCompletionResponse>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CreateChatCompletionResponse.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?first_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "first_id") else return null;
                    let ?first_id = ((switch (first_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?last_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "last_id") else return null;
                    let ?last_id = ((switch (last_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?has_more_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "has_more") else return null;
                    let ?has_more = ((switch (has_more_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        object_;
                        data;
                        first_id;
                        last_id;
                        has_more;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
