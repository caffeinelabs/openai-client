
// ChatCompletionTokenLogprobTopLogprobsInner.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionTokenLogprobTopLogprobsInner = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
        /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
        bytes : [Int];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionTokenLogprobTopLogprobsInner type
        public type JSON = {
            token : Text;
            logprob : Float;
            bytes : [Int];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionTokenLogprobTopLogprobsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionTokenLogprobTopLogprobsInner = ?json;
    }
}
