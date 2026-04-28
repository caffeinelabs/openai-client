/// The object type, which is always \"text_completion\"
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// CreateCompletionResponseObject.mo
/// Enum values: #text_completion

module {
    public type CreateCompletionResponseObject = {
        #text_completion;
    };

    public module JSON {
        public func toCandidValue(value : CreateCompletionResponseObject) : Candid.Candid =
            switch (value) {
                case (#text_completion) #Text("text_completion");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionResponseObject =
            switch (candid) {
                case (#Text("text_completion")) ?#text_completion;
                case _ null;
            };

        public func toText(value : CreateCompletionResponseObject) : Text =
            switch (value) {
                case (#text_completion) "text_completion";
            };
    };
};
