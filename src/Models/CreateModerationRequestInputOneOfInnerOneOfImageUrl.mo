/// Contains either an image URL or a data URL for a base64 encoded image.

// CreateModerationRequestInputOneOfInnerOneOfImageUrl.mo

module {
    // User-facing type: what application code uses
    public type CreateModerationRequestInputOneOfInnerOneOfImageUrl = {
        /// Either a URL of the image or the base64 encoded image data.
        url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateModerationRequestInputOneOfInnerOneOfImageUrl type
        public type JSON = {
            url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateModerationRequestInputOneOfInnerOneOfImageUrl) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateModerationRequestInputOneOfInnerOneOfImageUrl = ?json;
    }
}
