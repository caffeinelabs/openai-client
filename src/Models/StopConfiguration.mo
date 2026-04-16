/// Not supported with latest reasoning models `o3` and `o4-mini`.  Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence. 

// StopConfiguration.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type StopConfiguration = {
        #one_of_0 : Text;
        #one_of_1 : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : StopConfiguration) : Text =
            switch (value) {
                case (#one_of_0(v)) Runtime.unreachable();
                case (#one_of_1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StopConfiguration type
        public type JSON = {
            #one_of_0 : Text;
            #one_of_1 : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StopConfiguration) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#one_of_1(v)) #one_of_1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StopConfiguration =
            switch (json) {
                case (#one_of_0(v)) ?#one_of_0(v);
                case (#one_of_1(v)) ?#one_of_1(v);
            };
    }
}
