/// Learn about [file inputs](/docs/guides/text) for text generation. 

import { type ChatCompletionRequestMessageContentPartFileFile; JSON = ChatCompletionRequestMessageContentPartFileFile } "./ChatCompletionRequestMessageContentPartFileFile";

import { type ChatCompletionRequestMessageContentPartFileType; JSON = ChatCompletionRequestMessageContentPartFileType } "./ChatCompletionRequestMessageContentPartFileType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCompletionRequestMessageContentPartFile.mo

module {
    /// The required-fields slice of ChatCompletionRequestMessageContentPartFile — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : ChatCompletionRequestMessageContentPartFileType;
        file : ChatCompletionRequestMessageContentPartFileFile;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCompletionRequestMessageContentPartFile as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatCompletionRequestMessageContentPartFile = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCompletionRequestMessageContentPartFile from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCompletionRequestMessageContentPartFile.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCompletionRequestMessageContentPartFile {
            let ?res = from_candid(to_candid(required)) : ?ChatCompletionRequestMessageContentPartFile else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCompletionRequestMessageContentPartFile) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("type", ChatCompletionRequestMessageContentPartFileType.toCandidValue(value.type_)));
            List.add(buf, ("file", ChatCompletionRequestMessageContentPartFileFile.toCandidValue(value.file)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionRequestMessageContentPartFile =
            switch (candid) {
                case (#Record(fields)) {
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ChatCompletionRequestMessageContentPartFileType.fromCandidValue(type__field.1)) else return null;
                    let ?file_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "file") else return null;
                    let ?file = (ChatCompletionRequestMessageContentPartFileFile.fromCandidValue(file_field.1)) else return null;
                    ?{
                        type_;
                        file;
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
