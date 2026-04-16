/// The response from the image generation endpoint.

import { type Image; JSON = Image } "./Image";

import { type ImagesResponseUsage; JSON = ImagesResponseUsage } "./ImagesResponseUsage";

// ImagesResponse.mo

module {
    // User-facing type: what application code uses
    public type ImagesResponse = {
        /// The Unix timestamp (in seconds) of when the image was created.
        created : Int;
        /// The list of generated images.
        data : ?[Image];
        usage : ?ImagesResponseUsage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ImagesResponse type
        public type JSON = {
            created : Int;
            data : ?[Image];
            usage : ?ImagesResponseUsage;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ImagesResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ImagesResponse = ?json;
    }
}
