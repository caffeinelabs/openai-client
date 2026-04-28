import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatCompletionRequestMessageContentPartFileFile.mo

module {
    public type ChatCompletionRequestMessageContentPartFileFile = {
        /// The name of the file, used when passing the file to the model as a  string. 
        filename : ?Text;
        /// The base64 encoded file data, used when passing the file to the model  as a string. 
        file_data : ?Text;
        /// The ID of an uploaded file to use as input. 
        file_id : ?Text;
    };

    public module JSON {
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
};
