
import { type OpenAIFile; JSON = OpenAIFile } "./OpenAIFile";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListFilesResponse.mo

module {
    /// The required-fields slice of ListFilesResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        object_ : Text;
        data : [OpenAIFile];
        first_id : Text;
        last_id : Text;
        has_more : Bool;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ListFilesResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ListFilesResponse = Required and Optional;

    public module JSON {
        // `init` constructs a ListFilesResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ListFilesResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ListFilesResponse {
            let ?res = from_candid(to_candid(required)) : ?ListFilesResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ListFilesResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("object", #Text(value.object_)));
            List.add(buf, ("data", #Array(Array.map<OpenAIFile, Candid.Candid>(value.data, OpenAIFile.toCandidValue))));
            List.add(buf, ("first_id", #Text(value.first_id)));
            List.add(buf, ("last_id", #Text(value.last_id)));
            List.add(buf, ("has_more", #Bool(value.has_more)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListFilesResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = ((switch (object__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<OpenAIFile>();
                            for (c__ in xs__.values()) {
                                let ?m__ = OpenAIFile.fromCandidValue(c__) else return null;
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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
