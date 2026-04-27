
// ModelIdsSharedAnyOf.mo
/// Enum values: #gpt_4_1, #gpt_4_1_mini, #gpt_4_1_nano, #gpt_4_1_2025_04_14, #gpt_4_1_mini_2025_04_14, #gpt_4_1_nano_2025_04_14, #o4_mini, #o4_mini_2025_04_16, #o3, #o3_2025_04_16, #o3_mini, #o3_mini_2025_01_31, #o1, #o1_2024_12_17, #o1_preview, #o1_preview_2024_09_12, #o1_mini, #o1_mini_2024_09_12, #gpt_4o, #gpt_4o_2024_11_20, #gpt_4o_2024_08_06, #gpt_4o_2024_05_13, #gpt_4o_audio_preview, #gpt_4o_audio_preview_2024_10_01, #gpt_4o_audio_preview_2024_12_17, #gpt_4o_mini_audio_preview, #gpt_4o_mini_audio_preview_2024_12_17, #gpt_4o_search_preview, #gpt_4o_mini_search_preview, #gpt_4o_search_preview_2025_03_11, #gpt_4o_mini_search_preview_2025_03_11, #chatgpt_4o_latest, #gpt_4o_mini, #gpt_4o_mini_2024_07_18, #gpt_4_turbo, #gpt_4_turbo_2024_04_09, #gpt_4_0125_preview, #gpt_4_turbo_preview, #gpt_4_1106_preview, #gpt_4_vision_preview, #gpt_4, #gpt_4_0314, #gpt_4_0613, #gpt_4_32k, #gpt_4_32k_0314, #gpt_4_32k_0613, #gpt_3_5_turbo, #gpt_3_5_turbo_16k, #gpt_3_5_turbo_0301, #gpt_3_5_turbo_0613, #gpt_3_5_turbo_1106, #gpt_3_5_turbo_0125, #gpt_3_5_turbo_16k_0613

module {
    // User-facing type: type-safe variants for application code
    public type ModelIdsSharedAnyOf = {
        #gpt_4_1;
        #gpt_4_1_mini;
        #gpt_4_1_nano;
        #gpt_4_1_2025_04_14;
        #gpt_4_1_mini_2025_04_14;
        #gpt_4_1_nano_2025_04_14;
        #o4_mini;
        #o4_mini_2025_04_16;
        #o3;
        #o3_2025_04_16;
        #o3_mini;
        #o3_mini_2025_01_31;
        #o1;
        #o1_2024_12_17;
        #o1_preview;
        #o1_preview_2024_09_12;
        #o1_mini;
        #o1_mini_2024_09_12;
        #gpt_4o;
        #gpt_4o_2024_11_20;
        #gpt_4o_2024_08_06;
        #gpt_4o_2024_05_13;
        #gpt_4o_audio_preview;
        #gpt_4o_audio_preview_2024_10_01;
        #gpt_4o_audio_preview_2024_12_17;
        #gpt_4o_mini_audio_preview;
        #gpt_4o_mini_audio_preview_2024_12_17;
        #gpt_4o_search_preview;
        #gpt_4o_mini_search_preview;
        #gpt_4o_search_preview_2025_03_11;
        #gpt_4o_mini_search_preview_2025_03_11;
        #chatgpt_4o_latest;
        #gpt_4o_mini;
        #gpt_4o_mini_2024_07_18;
        #gpt_4_turbo;
        #gpt_4_turbo_2024_04_09;
        #gpt_4_0125_preview;
        #gpt_4_turbo_preview;
        #gpt_4_1106_preview;
        #gpt_4_vision_preview;
        #gpt_4;
        #gpt_4_0314;
        #gpt_4_0613;
        #gpt_4_32k;
        #gpt_4_32k_0314;
        #gpt_4_32k_0613;
        #gpt_3_5_turbo;
        #gpt_3_5_turbo_16k;
        #gpt_3_5_turbo_0301;
        #gpt_3_5_turbo_0613;
        #gpt_3_5_turbo_1106;
        #gpt_3_5_turbo_0125;
        #gpt_3_5_turbo_16k_0613;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ModelIdsSharedAnyOf type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ModelIdsSharedAnyOf) : JSON =
            switch (value) {
                case (#gpt_4_1) "gpt-4.1";
                case (#gpt_4_1_mini) "gpt-4.1-mini";
                case (#gpt_4_1_nano) "gpt-4.1-nano";
                case (#gpt_4_1_2025_04_14) "gpt-4.1-2025-04-14";
                case (#gpt_4_1_mini_2025_04_14) "gpt-4.1-mini-2025-04-14";
                case (#gpt_4_1_nano_2025_04_14) "gpt-4.1-nano-2025-04-14";
                case (#o4_mini) "o4-mini";
                case (#o4_mini_2025_04_16) "o4-mini-2025-04-16";
                case (#o3) "o3";
                case (#o3_2025_04_16) "o3-2025-04-16";
                case (#o3_mini) "o3-mini";
                case (#o3_mini_2025_01_31) "o3-mini-2025-01-31";
                case (#o1) "o1";
                case (#o1_2024_12_17) "o1-2024-12-17";
                case (#o1_preview) "o1-preview";
                case (#o1_preview_2024_09_12) "o1-preview-2024-09-12";
                case (#o1_mini) "o1-mini";
                case (#o1_mini_2024_09_12) "o1-mini-2024-09-12";
                case (#gpt_4o) "gpt-4o";
                case (#gpt_4o_2024_11_20) "gpt-4o-2024-11-20";
                case (#gpt_4o_2024_08_06) "gpt-4o-2024-08-06";
                case (#gpt_4o_2024_05_13) "gpt-4o-2024-05-13";
                case (#gpt_4o_audio_preview) "gpt-4o-audio-preview";
                case (#gpt_4o_audio_preview_2024_10_01) "gpt-4o-audio-preview-2024-10-01";
                case (#gpt_4o_audio_preview_2024_12_17) "gpt-4o-audio-preview-2024-12-17";
                case (#gpt_4o_mini_audio_preview) "gpt-4o-mini-audio-preview";
                case (#gpt_4o_mini_audio_preview_2024_12_17) "gpt-4o-mini-audio-preview-2024-12-17";
                case (#gpt_4o_search_preview) "gpt-4o-search-preview";
                case (#gpt_4o_mini_search_preview) "gpt-4o-mini-search-preview";
                case (#gpt_4o_search_preview_2025_03_11) "gpt-4o-search-preview-2025-03-11";
                case (#gpt_4o_mini_search_preview_2025_03_11) "gpt-4o-mini-search-preview-2025-03-11";
                case (#chatgpt_4o_latest) "chatgpt-4o-latest";
                case (#gpt_4o_mini) "gpt-4o-mini";
                case (#gpt_4o_mini_2024_07_18) "gpt-4o-mini-2024-07-18";
                case (#gpt_4_turbo) "gpt-4-turbo";
                case (#gpt_4_turbo_2024_04_09) "gpt-4-turbo-2024-04-09";
                case (#gpt_4_0125_preview) "gpt-4-0125-preview";
                case (#gpt_4_turbo_preview) "gpt-4-turbo-preview";
                case (#gpt_4_1106_preview) "gpt-4-1106-preview";
                case (#gpt_4_vision_preview) "gpt-4-vision-preview";
                case (#gpt_4) "gpt-4";
                case (#gpt_4_0314) "gpt-4-0314";
                case (#gpt_4_0613) "gpt-4-0613";
                case (#gpt_4_32k) "gpt-4-32k";
                case (#gpt_4_32k_0314) "gpt-4-32k-0314";
                case (#gpt_4_32k_0613) "gpt-4-32k-0613";
                case (#gpt_3_5_turbo) "gpt-3.5-turbo";
                case (#gpt_3_5_turbo_16k) "gpt-3.5-turbo-16k";
                case (#gpt_3_5_turbo_0301) "gpt-3.5-turbo-0301";
                case (#gpt_3_5_turbo_0613) "gpt-3.5-turbo-0613";
                case (#gpt_3_5_turbo_1106) "gpt-3.5-turbo-1106";
                case (#gpt_3_5_turbo_0125) "gpt-3.5-turbo-0125";
                case (#gpt_3_5_turbo_16k_0613) "gpt-3.5-turbo-16k-0613";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ModelIdsSharedAnyOf =
            switch (json) {
                case "gpt-4.1" ?#gpt_4_1;
                case "gpt-4.1-mini" ?#gpt_4_1_mini;
                case "gpt-4.1-nano" ?#gpt_4_1_nano;
                case "gpt-4.1-2025-04-14" ?#gpt_4_1_2025_04_14;
                case "gpt-4.1-mini-2025-04-14" ?#gpt_4_1_mini_2025_04_14;
                case "gpt-4.1-nano-2025-04-14" ?#gpt_4_1_nano_2025_04_14;
                case "o4-mini" ?#o4_mini;
                case "o4-mini-2025-04-16" ?#o4_mini_2025_04_16;
                case "o3" ?#o3;
                case "o3-2025-04-16" ?#o3_2025_04_16;
                case "o3-mini" ?#o3_mini;
                case "o3-mini-2025-01-31" ?#o3_mini_2025_01_31;
                case "o1" ?#o1;
                case "o1-2024-12-17" ?#o1_2024_12_17;
                case "o1-preview" ?#o1_preview;
                case "o1-preview-2024-09-12" ?#o1_preview_2024_09_12;
                case "o1-mini" ?#o1_mini;
                case "o1-mini-2024-09-12" ?#o1_mini_2024_09_12;
                case "gpt-4o" ?#gpt_4o;
                case "gpt-4o-2024-11-20" ?#gpt_4o_2024_11_20;
                case "gpt-4o-2024-08-06" ?#gpt_4o_2024_08_06;
                case "gpt-4o-2024-05-13" ?#gpt_4o_2024_05_13;
                case "gpt-4o-audio-preview" ?#gpt_4o_audio_preview;
                case "gpt-4o-audio-preview-2024-10-01" ?#gpt_4o_audio_preview_2024_10_01;
                case "gpt-4o-audio-preview-2024-12-17" ?#gpt_4o_audio_preview_2024_12_17;
                case "gpt-4o-mini-audio-preview" ?#gpt_4o_mini_audio_preview;
                case "gpt-4o-mini-audio-preview-2024-12-17" ?#gpt_4o_mini_audio_preview_2024_12_17;
                case "gpt-4o-search-preview" ?#gpt_4o_search_preview;
                case "gpt-4o-mini-search-preview" ?#gpt_4o_mini_search_preview;
                case "gpt-4o-search-preview-2025-03-11" ?#gpt_4o_search_preview_2025_03_11;
                case "gpt-4o-mini-search-preview-2025-03-11" ?#gpt_4o_mini_search_preview_2025_03_11;
                case "chatgpt-4o-latest" ?#chatgpt_4o_latest;
                case "gpt-4o-mini" ?#gpt_4o_mini;
                case "gpt-4o-mini-2024-07-18" ?#gpt_4o_mini_2024_07_18;
                case "gpt-4-turbo" ?#gpt_4_turbo;
                case "gpt-4-turbo-2024-04-09" ?#gpt_4_turbo_2024_04_09;
                case "gpt-4-0125-preview" ?#gpt_4_0125_preview;
                case "gpt-4-turbo-preview" ?#gpt_4_turbo_preview;
                case "gpt-4-1106-preview" ?#gpt_4_1106_preview;
                case "gpt-4-vision-preview" ?#gpt_4_vision_preview;
                case "gpt-4" ?#gpt_4;
                case "gpt-4-0314" ?#gpt_4_0314;
                case "gpt-4-0613" ?#gpt_4_0613;
                case "gpt-4-32k" ?#gpt_4_32k;
                case "gpt-4-32k-0314" ?#gpt_4_32k_0314;
                case "gpt-4-32k-0613" ?#gpt_4_32k_0613;
                case "gpt-3.5-turbo" ?#gpt_3_5_turbo;
                case "gpt-3.5-turbo-16k" ?#gpt_3_5_turbo_16k;
                case "gpt-3.5-turbo-0301" ?#gpt_3_5_turbo_0301;
                case "gpt-3.5-turbo-0613" ?#gpt_3_5_turbo_0613;
                case "gpt-3.5-turbo-1106" ?#gpt_3_5_turbo_1106;
                case "gpt-3.5-turbo-0125" ?#gpt_3_5_turbo_0125;
                case "gpt-3.5-turbo-16k-0613" ?#gpt_3_5_turbo_16k_0613;
                case _ null;
            };

        // Pre-flight validation (`diagnostics=true`): enums are always valid.
        public func validate(_value : ModelIdsSharedAnyOf) : ?Text = null;
    }
}
