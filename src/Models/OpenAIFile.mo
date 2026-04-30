/// The `File` object represents a document that has been uploaded to OpenAI.

import { type OpenAIFileObject; JSON = OpenAIFileObject } "./OpenAIFileObject";

import { type OpenAIFilePurpose; JSON = OpenAIFilePurpose } "./OpenAIFilePurpose";

import { type OpenAIFileStatus; JSON = OpenAIFileStatus } "./OpenAIFileStatus";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// OpenAIFile.mo

module {
    /// The required-fields slice of OpenAIFile — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The file identifier, which can be referenced in the API endpoints.
        id : Text;
        /// The size of the file, in bytes.
        bytes : Int;
        /// The Unix timestamp (in seconds) for when the file was created.
        created_at : Int;
        /// The name of the file.
        filename : Text;
        object_ : OpenAIFileObject;
        purpose : OpenAIFilePurpose;
        status : OpenAIFileStatus;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express OpenAIFile as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        expires_at : ?Int;
        status_details : ?Text;
    };

    public type OpenAIFile = Required and Optional;

    public module JSON {
        // `init` constructs a OpenAIFile from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { OpenAIFile.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : OpenAIFile {
            let ?res = from_candid(to_candid(required)) : ?OpenAIFile else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : OpenAIFile) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("bytes", #Int(value.bytes)));
            List.add(buf, ("created_at", #Int(value.created_at)));
            switch (value.expires_at) {
                case (?v__) List.add(buf, ("expires_at", #Int(v__)));
                case null ();
            };
            List.add(buf, ("filename", #Text(value.filename)));
            List.add(buf, ("object", OpenAIFileObject.toCandidValue(value.object_)));
            List.add(buf, ("purpose", OpenAIFilePurpose.toCandidValue(value.purpose)));
            List.add(buf, ("status", OpenAIFileStatus.toCandidValue(value.status)));
            switch (value.status_details) {
                case (?v__) List.add(buf, ("status_details", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?OpenAIFile =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?bytes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bytes") else return null;
                    let ?bytes = ((switch (bytes_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?created_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at") else return null;
                    let ?created_at = ((switch (created_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let expires_at : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "expires_at")) {
                        case (?expires_at_field) ((switch (expires_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?filename_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "filename") else return null;
                    let ?filename = ((switch (filename_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?object__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "object") else return null;
                    let ?object_ = (OpenAIFileObject.fromCandidValue(object__field.1)) else return null;
                    let ?purpose_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "purpose") else return null;
                    let ?purpose = (OpenAIFilePurpose.fromCandidValue(purpose_field.1)) else return null;
                    let ?status_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status") else return null;
                    let ?status = (OpenAIFileStatus.fromCandidValue(status_field.1)) else return null;
                    let status_details : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status_details")) {
                        case (?status_details_field) ((switch (status_details_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        id;
                        bytes;
                        created_at;
                        expires_at;
                        filename;
                        object_;
                        purpose;
                        status;
                        status_details;
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
