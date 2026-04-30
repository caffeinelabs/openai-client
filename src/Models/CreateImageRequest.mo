
import { type CreateImageRequestBackground; JSON = CreateImageRequestBackground } "./CreateImageRequestBackground";

import { type CreateImageRequestModel; JSON = CreateImageRequestModel } "./CreateImageRequestModel";

import { type CreateImageRequestModeration; JSON = CreateImageRequestModeration } "./CreateImageRequestModeration";

import { type CreateImageRequestOutputFormat; JSON = CreateImageRequestOutputFormat } "./CreateImageRequestOutputFormat";

import { type CreateImageRequestQuality; JSON = CreateImageRequestQuality } "./CreateImageRequestQuality";

import { type CreateImageRequestResponseFormat; JSON = CreateImageRequestResponseFormat } "./CreateImageRequestResponseFormat";

import { type CreateImageRequestSize; JSON = CreateImageRequestSize } "./CreateImageRequestSize";

import { type CreateImageRequestStyle; JSON = CreateImageRequestStyle } "./CreateImageRequestStyle";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// CreateImageRequest.mo

module {
    /// The required-fields slice of CreateImageRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A text description of the desired image(s). The maximum length is 32000 characters for `gpt-image-1`, 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.
        prompt : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateImageRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        model : ?CreateImageRequestModel;
        n : ?Nat;
        quality : ?CreateImageRequestQuality;
        response_format : ?CreateImageRequestResponseFormat;
        output_format : ?CreateImageRequestOutputFormat;
        output_compression : ?Int;
        size : ?CreateImageRequestSize;
        moderation : ?CreateImageRequestModeration;
        background : ?CreateImageRequestBackground;
        style : ?CreateImageRequestStyle;
        user : ?Text;
    };

    public type CreateImageRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateImageRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateImageRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateImageRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateImageRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateImageRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("prompt", #Text(value.prompt)));
            switch (value.model) {
                case (?v__) List.add(buf, ("model", CreateImageRequestModel.toCandidValue(v__)));
                case null ();
            };
            switch (value.n) {
                case (?v__) List.add(buf, ("n", #Nat(v__)));
                case null ();
            };
            switch (value.quality) {
                case (?v__) List.add(buf, ("quality", CreateImageRequestQuality.toCandidValue(v__)));
                case null ();
            };
            switch (value.response_format) {
                case (?v__) List.add(buf, ("response_format", CreateImageRequestResponseFormat.toCandidValue(v__)));
                case null ();
            };
            switch (value.output_format) {
                case (?v__) List.add(buf, ("output_format", CreateImageRequestOutputFormat.toCandidValue(v__)));
                case null ();
            };
            switch (value.output_compression) {
                case (?v__) List.add(buf, ("output_compression", #Int(v__)));
                case null ();
            };
            switch (value.size) {
                case (?v__) List.add(buf, ("size", CreateImageRequestSize.toCandidValue(v__)));
                case null ();
            };
            switch (value.moderation) {
                case (?v__) List.add(buf, ("moderation", CreateImageRequestModeration.toCandidValue(v__)));
                case null ();
            };
            switch (value.background) {
                case (?v__) List.add(buf, ("background", CreateImageRequestBackground.toCandidValue(v__)));
                case null ();
            };
            switch (value.style) {
                case (?v__) List.add(buf, ("style", CreateImageRequestStyle.toCandidValue(v__)));
                case null ();
            };
            switch (value.user) {
                case (?v__) List.add(buf, ("user", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateImageRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?prompt_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "prompt") else return null;
                    let ?prompt = ((switch (prompt_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let model : ?CreateImageRequestModel = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "model")) {
                        case (?model_field) (CreateImageRequestModel.fromCandidValue(model_field.1));
                        case null null;
                    };
                    let n : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "n")) {
                        case (?n_field) ((switch (n_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let quality : ?CreateImageRequestQuality = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quality")) {
                        case (?quality_field) (CreateImageRequestQuality.fromCandidValue(quality_field.1));
                        case null null;
                    };
                    let response_format : ?CreateImageRequestResponseFormat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "response_format")) {
                        case (?response_format_field) (CreateImageRequestResponseFormat.fromCandidValue(response_format_field.1));
                        case null null;
                    };
                    let output_format : ?CreateImageRequestOutputFormat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "output_format")) {
                        case (?output_format_field) (CreateImageRequestOutputFormat.fromCandidValue(output_format_field.1));
                        case null null;
                    };
                    let output_compression : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "output_compression")) {
                        case (?output_compression_field) ((switch (output_compression_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let size : ?CreateImageRequestSize = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "size")) {
                        case (?size_field) (CreateImageRequestSize.fromCandidValue(size_field.1));
                        case null null;
                    };
                    let moderation : ?CreateImageRequestModeration = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "moderation")) {
                        case (?moderation_field) (CreateImageRequestModeration.fromCandidValue(moderation_field.1));
                        case null null;
                    };
                    let background : ?CreateImageRequestBackground = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "background")) {
                        case (?background_field) (CreateImageRequestBackground.fromCandidValue(background_field.1));
                        case null null;
                    };
                    let style : ?CreateImageRequestStyle = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "style")) {
                        case (?style_field) (CreateImageRequestStyle.fromCandidValue(style_field.1));
                        case null null;
                    };
                    let user : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user")) {
                        case (?user_field) ((switch (user_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        prompt;
                        model;
                        n;
                        quality;
                        response_format;
                        output_format;
                        output_compression;
                        size;
                        moderation;
                        background;
                        style;
                        user;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
