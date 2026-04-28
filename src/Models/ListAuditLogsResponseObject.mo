import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListAuditLogsResponseObject.mo
/// Enum values: #list

module {
    public type ListAuditLogsResponseObject = {
        #list;
    };

    public module JSON {
        public func toCandidValue(value : ListAuditLogsResponseObject) : Candid.Candid =
            switch (value) {
                case (#list) #Text("list");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ListAuditLogsResponseObject =
            switch (candid) {
                case (#Text("list")) ?#list;
                case _ null;
            };

        public func toText(value : ListAuditLogsResponseObject) : Text =
            switch (value) {
                case (#list) "list";
            };
    };
};
