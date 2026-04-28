/// The object type, which is always `chat.completion`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateChatCompletionResponseObject.mo
/// Enum values: #chat_completion

module {
    public type CreateChatCompletionResponseObject = {
        #chat_completion;
    };

    public module JSON {
        public func toCandidValue(value : CreateChatCompletionResponseObject) : Candid.Candid =
            switch (value) {
                case (#chat_completion) #Text("chat.completion");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateChatCompletionResponseObject =
            switch (candid) {
                case (#Text("chat.completion")) ?#chat_completion;
                case _ null;
            };

        public func toText(value : CreateChatCompletionResponseObject) : Text =
            switch (value) {
                case (#chat_completion) "chat.completion";
            };
    };
};
