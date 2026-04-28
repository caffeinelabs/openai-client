import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateCompletionResponseChoicesInnerLogprobs.mo

module {
    public type CreateCompletionResponseChoicesInnerLogprobs = {
        text_offset : ?[Int];
        token_logprobs : ?[Float];
        tokens : ?[Text];
        top_logprobs : ?[Map<Text, Float>];
    };

    public module JSON {
        public func toCandidValue(value : CreateCompletionResponseChoicesInnerLogprobs) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.text_offset) {
                case (?v__) List.add(buf, ("text_offset", #Array(Array.map<Int, Candid.Candid>(v__, func(i : Int) : Candid.Candid = #Int(i)))));
                case null ();
            };
            switch (value.token_logprobs) {
                case (?v__) List.add(buf, ("token_logprobs", #Array(Array.map<Float, Candid.Candid>(v__, func(f : Float) : Candid.Candid = #Float(f)))));
                case null ();
            };
            switch (value.tokens) {
                case (?v__) List.add(buf, ("tokens", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.top_logprobs) {
                case (?v__) List.add(buf, ("top_logprobs", #Array(Array.map<Map<Text, Float>, Candid.Candid>(v__, Map<Text, Float>.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseChoicesInnerLogprobs =
            switch (candid) {
                case (#Record(fields)) {
                    let text_offset : ?[Int] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text_offset")) {
                        case (?text_offset_field) ((switch (text_offset_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Int>();
                            for (c__ in xs__.values()) {
                                let #Int(i__) = c__ else return null;
                                List.add(buf__, i__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let token_logprobs : ?[Float] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token_logprobs")) {
                        case (?token_logprobs_field) ((switch (token_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let #Float(f__) = c__ else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let tokens : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tokens")) {
                        case (?tokens_field) ((switch (tokens_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let top_logprobs : ?[Map<Text, Float>] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "top_logprobs")) {
                        case (?top_logprobs_field) ((switch (top_logprobs_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Map<Text, Float>>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Map<Text, Float>.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        text_offset;
                        token_logprobs;
                        tokens;
                        top_logprobs;
                    };
                };
                case _ null;
            };
    };
};
