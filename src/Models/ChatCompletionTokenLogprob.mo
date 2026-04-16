
import { type ChatCompletionTokenLogprobTopLogprobsInner; JSON = ChatCompletionTokenLogprobTopLogprobsInner } "./ChatCompletionTokenLogprobTopLogprobsInner";

// ChatCompletionTokenLogprob.mo

module {
    // User-facing type: what application code uses
    public type ChatCompletionTokenLogprob = {
        /// The token.
        token : Text;
        /// The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
        logprob : Float;
        /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
        bytes : [Int];
        /// List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
        top_logprobs : [ChatCompletionTokenLogprobTopLogprobsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCompletionTokenLogprob type
        public type JSON = {
            token : Text;
            logprob : Float;
            bytes : [Int];
            top_logprobs : [ChatCompletionTokenLogprobTopLogprobsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCompletionTokenLogprob) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCompletionTokenLogprob = ?json;
    }
}
