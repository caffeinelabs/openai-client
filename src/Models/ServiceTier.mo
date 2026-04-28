/// Specifies the latency tier to use for processing the request. This parameter is relevant for customers subscribed to the scale tier service:   - If set to 'auto', and the Project is Scale tier enabled, the system     will utilize scale tier credits until they are exhausted.   - If set to 'auto', and the Project is not Scale tier enabled, the request will be processed using the default service tier with a lower uptime SLA and no latency guarentee.   - If set to 'default', the request will be processed using the default service tier with a lower uptime SLA and no latency guarentee.   - If set to 'flex', the request will be processed with the Flex Processing service tier. [Learn more](/docs/guides/flex-processing).   - When not set, the default behavior is 'auto'.    When this parameter is set, the response body will include the `service_tier` utilized. 
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ServiceTier.mo
/// Enum values: #auto, #default, #flex

module {
    public type ServiceTier = {
        #auto;
        #default;
        #flex;
    };

    public module JSON {
        public func toCandidValue(value : ServiceTier) : Candid.Candid =
            switch (value) {
                case (#auto) #Text("auto");
                case (#default) #Text("default");
                case (#flex) #Text("flex");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ServiceTier =
            switch (candid) {
                case (#Text("auto")) ?#auto;
                case (#Text("default")) ?#default;
                case (#Text("flex")) ?#flex;
                case _ null;
            };

        public func toText(value : ServiceTier) : Text =
            switch (value) {
                case (#auto) "auto";
                case (#default) "default";
                case (#flex) "flex";
            };
    };
};
