/// The response from the image generation endpoint.

import { type Image; JSON = Image } "./Image";

import { type ImagesResponseUsage; JSON = ImagesResponseUsage } "./ImagesResponseUsage";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";

// ImagesResponse.mo

module {
    public type ImagesResponse = {
        /// The Unix timestamp (in seconds) of when the image was created.
        created : Int;
        /// The list of generated images.
        data : ?[Image];
        usage : ?ImagesResponseUsage;
    };

    public module JSON {
        public func toCandidValue(value : ImagesResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created", #Int(value.created)));
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<Image, Candid.Candid>(v__, Image.toCandidValue))));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", ImagesResponseUsage.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ImagesResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created") else return null;
                    let ?created = ((switch (created_field.1) { case (#Int(i)) ?i; case _ null })) else return null;
                    let data : ?[Image] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Image>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Image.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let usage : ?ImagesResponseUsage = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) (ImagesResponseUsage.fromCandidValue(usage_field.1));
                        case null null;
                    };
                    ?{
                        created;
                        data;
                        usage;
                    };
                };
                case _ null;
            };
    };
};
