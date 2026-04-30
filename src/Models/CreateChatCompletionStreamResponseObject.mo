/// The object type, which is always `chat.completion.chunk`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateChatCompletionStreamResponseObject.mo
/// Enum values: #chat_completion_chunk

module {
    public type CreateChatCompletionStreamResponseObject = {
        #chat_completion_chunk;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionStreamResponseObject) : Candid.Candid =
            switch (value) {
                case (#chat_completion_chunk) #Text("chat.completion.chunk");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionStreamResponseObject =
            switch (candid) {
                case (#Text("chat.completion.chunk")) ?#chat_completion_chunk;
                case _ null;
            };

        public func toText(value : CreateChatCompletionStreamResponseObject) : Text =
            switch (value) {
                case (#chat_completion_chunk) "chat.completion.chunk";
            };
    };
};
