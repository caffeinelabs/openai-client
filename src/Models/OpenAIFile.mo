/// The `File` object represents a document that has been uploaded to OpenAI.

import { type OpenAIFileObject; JSON = OpenAIFileObject } "./OpenAIFileObject";

import { type OpenAIFilePurpose; JSON = OpenAIFilePurpose } "./OpenAIFilePurpose";

import { type OpenAIFileStatus; JSON = OpenAIFileStatus } "./OpenAIFileStatus";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// OpenAIFile.mo

module {
    public type OpenAIFile = {
        /// The file identifier, which can be referenced in the API endpoints.
        id : Text;
        /// The size of the file, in bytes.
        bytes : Int;
        /// The Unix timestamp (in seconds) for when the file was created.
        created_at : Int;
        /// The Unix timestamp (in seconds) for when the file will expire.
        expires_at : ?Int;
        /// The name of the file.
        filename : Text;
        object_ : OpenAIFileObject;
        purpose : OpenAIFilePurpose;
        status : OpenAIFileStatus;
        /// Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine_tuning.job`.
        status_details : ?Text;
    };

    public module JSON {
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
};
