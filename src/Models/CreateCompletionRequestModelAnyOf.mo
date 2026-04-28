import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateCompletionRequestModelAnyOf.mo
/// Enum values: #gpt_3_5_turbo_instruct, #davinci_002, #babbage_002

module {
    public type CreateCompletionRequestModelAnyOf = {
        #gpt_3_5_turbo_instruct;
        #davinci_002;
        #babbage_002;
    };

    public module JSON {
        public func toCandidValue(value : CreateCompletionRequestModelAnyOf) : Candid.Candid =
            switch (value) {
                case (#gpt_3_5_turbo_instruct) #Text("gpt-3.5-turbo-instruct");
                case (#davinci_002) #Text("davinci-002");
                case (#babbage_002) #Text("babbage-002");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateCompletionRequestModelAnyOf =
            switch (candid) {
                case (#Text("gpt-3.5-turbo-instruct")) ?#gpt_3_5_turbo_instruct;
                case (#Text("davinci-002")) ?#davinci_002;
                case (#Text("babbage-002")) ?#babbage_002;
                case _ null;
            };

        public func toText(value : CreateCompletionRequestModelAnyOf) : Text =
            switch (value) {
                case (#gpt_3_5_turbo_instruct) "gpt-3.5-turbo-instruct";
                case (#davinci_002) "davinci-002";
                case (#babbage_002) "babbage-002";
            };
    };
};
