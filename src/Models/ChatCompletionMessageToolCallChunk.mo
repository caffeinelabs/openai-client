
import { type ChatCompletionMessageToolCallChunkFunction; JSON = ChatCompletionMessageToolCallChunkFunction } "./ChatCompletionMessageToolCallChunkFunction";

import { type ChatCompletionMessageToolCallType; JSON = ChatCompletionMessageToolCallType } "./ChatCompletionMessageToolCallType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionMessageToolCallChunk.mo

module {
    public type ChatCompletionMessageToolCallChunk = {
        index : Int;
        /// The ID of the tool call.
        id : ?Text;
        type_ : ?ChatCompletionMessageToolCallType;
        function : ?ChatCompletionMessageToolCallChunkFunction;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionMessageToolCallChunk) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("index", #Int(value.index)));
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.type_) {
                case (?v__) List.add(buf, ("type", ChatCompletionMessageToolCallType.toCandidValue(v__)));
                case null ();
            };
            switch (value.function) {
                case (?v__) List.add(buf, ("function", ChatCompletionMessageToolCallChunkFunction.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionMessageToolCallChunk =
            switch (candid) {
                case (#Record(fields)) {
                    let ?index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "index") else return null;
                    let ?index = ((switch (index_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let type_ : ?ChatCompletionMessageToolCallType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type")) {
                        case (?type__field) (ChatCompletionMessageToolCallType.fromCandidValue(type__field.1));
                        case null null;
                    };
                    let function : ?ChatCompletionMessageToolCallChunkFunction = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "function")) {
                        case (?function_field) (ChatCompletionMessageToolCallChunkFunction.fromCandidValue(function_field.1));
                        case null null;
                    };
                    ?{
                        index;
                        id;
                        type_;
                        function;
                    };
                };
                case _ null;
            };
    };
};
