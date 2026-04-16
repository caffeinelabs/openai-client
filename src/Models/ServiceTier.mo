/// Specifies the latency tier to use for processing the request. This parameter is relevant for customers subscribed to the scale tier service:   - If set to 'auto', and the Project is Scale tier enabled, the system     will utilize scale tier credits until they are exhausted.   - If set to 'auto', and the Project is not Scale tier enabled, the request will be processed using the default service tier with a lower uptime SLA and no latency guarentee.   - If set to 'default', the request will be processed using the default service tier with a lower uptime SLA and no latency guarentee.   - If set to 'flex', the request will be processed with the Flex Processing service tier. [Learn more](/docs/guides/flex-processing).   - When not set, the default behavior is 'auto'.    When this parameter is set, the response body will include the `service_tier` utilized. 

// ServiceTier.mo
/// Enum values: #auto, #default, #flex

module {
    // User-facing type: type-safe variants for application code
    public type ServiceTier = {
        #auto;
        #default;
        #flex;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ServiceTier type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ServiceTier) : JSON =
            switch (value) {
                case (#auto) "auto";
                case (#default) "default";
                case (#flex) "flex";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ServiceTier =
            switch (json) {
                case "auto" ?#auto;
                case "default" ?#default;
                case "flex" ?#flex;
                case _ null;
            };
    }
}
