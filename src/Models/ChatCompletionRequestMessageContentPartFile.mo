/// Learn about [file inputs](/docs/guides/text) for text generation. 

import { type ChatCompletionRequestMessageContentPartFileFile; JSON = ChatCompletionRequestMessageContentPartFileFile } "./ChatCompletionRequestMessageContentPartFileFile";

import { type ChatCompletionRequestMessageContentPartFileType; JSON = ChatCompletionRequestMessageContentPartFileType } "./ChatCompletionRequestMessageContentPartFileType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionRequestMessageContentPartFile.mo

module {
    public type ChatCompletionRequestMessageContentPartFile = {
        type_ : ChatCompletionRequestMessageContentPartFileType;
        file : ChatCompletionRequestMessageContentPartFileFile;
    };

    public module JSON {
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
};
