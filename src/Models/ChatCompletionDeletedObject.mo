/// The type of object being deleted.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ChatCompletionDeletedObject.mo
/// Enum values: #chat_completion_deleted

module {
    public type ChatCompletionDeletedObject = {
        #chat_completion_deleted;
    };

    public module JSON {
        public func toCandidValue(value : ChatCompletionDeletedObject) : Candid.Candid =
            switch (value) {
                case (#chat_completion_deleted) #Text("chat.completion.deleted");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCompletionDeletedObject =
            switch (candid) {
                case (#Text("chat.completion.deleted")) ?#chat_completion_deleted;
                case _ null;
            };

        public func toText(value : ChatCompletionDeletedObject) : Text =
            switch (value) {
                case (#chat_completion_deleted) "chat.completion.deleted";
            };
    };
};
