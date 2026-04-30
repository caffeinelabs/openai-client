import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartFileFile.mo

module {
    /// The required-fields slice of ChatCompletionRequestMessageContentPartFileFile — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestMessageContentPartFileFile as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        filename : ?Text;
        file_data : ?Text;
        file_id : ?Text;
    };

    public type ChatCompletionRequestMessageContentPartFileFile = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestMessageContentPartFileFile from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestMessageContentPartFileFile.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestMessageContentPartFileFile {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestMessageContentPartFileFile else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestMessageContentPartFileFile) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.filename) {
                case (?v__) List.add(buf, ("filename", #Text(v__)));
                case null ();
            };
            switch (value.file_data) {
                case (?v__) List.add(buf, ("file_data", #Text(v__)));
                case null ();
            };
            switch (value.file_id) {
                case (?v__) List.add(buf, ("file_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartFileFile =
            switch (candid) {
                case (#Record(fields)) {
                    let filename : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "filename")) {
                        case (?filename_field) ((switch (filename_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let file_data : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "file_data")) {
                        case (?file_data_field) ((switch (file_data_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let file_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "file_id")) {
                        case (?file_id_field) ((switch (file_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        filename;
                        file_data;
                        file_id;
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
