# Changelog

All notable changes to this package are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.4](https://github.com/caffeinelabs/openai-client/releases/tag/v0.2.4) — 2026-04-30

### Fixed

- **`AudioApi.transcribeAudio` Blob responses** — the primitive-return
  dispatch now emits `case (#Blob(b__)) b__;` for `Blob`-typed endpoints.
  Previously fell through to the `#Int` arm and failed to type-check.
- **JSON field names with punctuation** sanitize cleanly to Motoko
  identifiers. The OpenAI Moderation schema's `hate/threatening` (and
  similar slash/dot/space-bearing names) now becomes `hate_threatening`
  in Motoko; the JSON wire shape is preserved.
- **`Map<K, V>` array items where V is primitive** no longer emit
  `T.toCandidValue` calls on the unsupported value type. The Candid
  partials gate the method dispatch on `complexType`.
- **Variant tags whose Motoko-derived name would contain brackets or
  parens** fall back to positional `#one_of_<i>`. Previously affected
  `CreateCompletionRequestPrompt` (`#_[Int]` was emitted as a literal
  variant tag and was not valid Motoko).
- **int64 fields** no longer emit duplicate Candid case branches
  (`#Int(v__)#Int(v__)`). The `isLong` partial is now guarded by
  `^isInteger` across all seven candid_* templates.

### Note

These are codegen fixes; no public API changed. `mops publish` now
succeeds without `--no-docs` for this surface.

## [0.2.3](https://github.com/caffeinelabs/openai-client/releases/tag/v0.2.3) — 2026-04-30

### Added

- **`init(required : { … }) : T`** — every record-shape model exports an `init`
  function in its `JSON` sub-module that takes only the required fields and
  defaults all optional fields to `null`. Pair with the record-update syntax
  to set selected optionals:

  ```motoko
  // before — 30 fields, ~28 nulls:
  let req : CreateChatCompletionRequest = {
    model = "gpt-4o-mini";
    messages = [...];
    max_tokens = ?512;
    metadata = null; temperature = null; top_p = null; /* ...25 more nulls... */
  };

  // after:
  let req = { CreateChatCompletionRequest.init { model = "gpt-4o-mini"; messages = [...] }
              with max_tokens = ?512 };
  ```

  Each model's user-facing type is also restructured as
  `public type T = Required and Optional` (record-type intersection), with
  `Required` exposed as a public sub-type and `Optional` private — purely a
  scaffold for `init`'s parameter type. The wire shape and all existing APIs
  (`toCandidValue` / `fromCandidValue` / `toText`) are unchanged.

  Implementation: `init` uses Candid round-trip
  (`from_candid(to_candid(required))`); Candid record subtyping fills the
  absent optional fields with null. Costs a few cycles per call (init isn't a
  hot path) and keeps the generated code compact regardless of how many
  optional fields the model has.

## [0.2.2](https://github.com/caffeinelabs/openai-client/releases/tag/v0.2.2) — 2026-04-28

### Fixed

- **Numeric tolerance on decode**: `serde-core`'s JSON parser produces
  `#Nat` for non-negative numbers and `#Int` only for negatives.
  `fromCandidValue` for `Int` fields previously matched only `#Int(i)`,
  so a positive timestamp like `created: 1777356890` failed to decode
  → entire response decode bubbled up null → "Failed to convert response
  to CreateChatCompletionResponse" despite a perfectly valid HTTP 200.
  Now tolerant: `Int` accepts both `#Int` and `#Nat`; `Float` accepts
  `#Float`, `#Int`, and `#Nat` (converting via `Float.fromInt`).

- **`nullable: true` honoured**: a property with `required: true` *and*
  `nullable: true` (e.g. `choices[].logprobs` in chat completions) is
  now demoted to `?T` in the user-facing record type. The wire form
  `"logprobs": null` is what OpenAI actually sends — required-but-null
  used to trip the model decoder.

## [0.2.1](https://github.com/caffeinelabs/openai-client/releases/tag/v0.2.1) — 2026-04-28

### Fixed

- Response-side: replaced the lossy `JSON.fromText → Candid.decodeOne(blob, [], null)`
  blob roundtrip with `JSON.toCandid(text)` (Candid value direct, names preserved).
  The old path hashed JSON field names through Candid wire format and required an
  exhaustive keys list to recover them; without one, every `T.fromCandidValue` call
  failed `Array.find` on `"id"` / `"choices"` / `"role"` / etc. Symptom in 0.2.0:
  `HTTP 200: Failed to convert response to CreateChatCompletionResponse` even though
  the server's response was perfectly valid. Symmetric to the request-side fix that
  shipped in 0.2.0 (which already used `JSON.fromCandid`, the inverse direct path).

## [0.2.0](https://github.com/caffeinelabs/openai-client/releases/tag/v0.2.0) — 2026-04-28

### Changed (BREAKING)

- The Motoko codegen now controls JSON wire shape end-to-end, replacing the
  prior `to_candid(jsonValue) → JSON.toText(blob, …)` pipeline (which made
  Motoko's built-in `to_candid` decide wire shape — wrong for any construct
  OpenAPI doesn't map onto Candid 1:1). Each model now emits
  `toCandidValue : T → Candid.Candid` and `fromCandidValue : Candid.Candid → ?T`
  in its `JSON` sub-module; `api.mustache` pipes the body through
  `JSON.fromCandid(candidValue)` directly (no Candid blob roundtrip).

- **Discriminator-oneOf flattening**: `ChatCompletionRequestMessage` (and any
  other oneOf whose branches share a single-valued enum discriminator like
  `role`) now serialise as a flat object with the discriminator inlined —
  e.g. `{"role": "user", "content": "…"}` instead of the previous
  `{"#ChatCompletionRequestUserMessage": {"role": "user", "content": "…"}}`
  that OpenAI rejected as "Missing required parameter: 'messages[0].role'".

- **User-facing variant tags renamed** to the OpenAPI `discriminator.mapping`
  key (or, when no explicit discriminator, the inferred single-valued enum
  literal). This is a breaking change for callers:
    - `#ChatCompletionRequestSystemMessage(...)` → `#system_(...)` (trailing
      `_` for Motoko keyword collision).
    - `#ChatCompletionRequestUserMessage(...)` → `#user(...)`.
    - `#ChatCompletionRequestAssistantMessage(...)` → `#assistant(...)`.
    - `#ChatCompletionRequestToolMessage(...)` → `#tool(...)`.
    - `#ChatCompletionRequestFunctionMessage(...)` → `#function(...)`.
    - `#ChatCompletionRequestDeveloperMessage(...)` → `#developer(...)`.

- **String-or-array oneOf flattening**: `ChatCompletionRequestUserMessageContent`
  and friends now wire as either a JSON string or a JSON array directly,
  with user-facing tags `#string : Text` and `#array : [...]` (replacing the
  previous `#one_of_0` / type-named tags that wrapped under `#tag` on the wire).

- **Null-elision** is now a structural property of the codegen — optional
  fields with value `null` are simply not constructed, so the wire object
  never carries `"x": null`. `skip_null_fields = true` is no longer required
  at the JSON-encoder boundary.

### Added

- `T.JSON.toText(value : T) : Text` for enums, string-flatten oneOfs, and
  discriminator-oneOfs — used by `api.mustache` for path / query / header
  param interpolation (replacing the old `T.JSON.toJSON(...)` API).

### Removed

- Pre-flight `validate(value : T) : ?Text` hooks per model and the
  corresponding `validate(body)` call in `api.mustache`. Direct shape
  control replaces preflight diagnostics for the request side; the
  `--additional-properties=diagnostics=true` flag is still honoured for
  reply-side `— server returned: <body>` suffixing on error throws.

### Migration

```motoko
// before (0.1.3)
let request : CreateChatCompletionRequest = {
  …
  messages = [
    #ChatCompletionRequestSystemMessage({ content = #one_of_0(sys); role = #system_; name = null }),
    #ChatCompletionRequestUserMessage(  { content = #one_of_0(usr); role = #user;    name = null }),
  ];
};

// after (0.2.0)
let request : CreateChatCompletionRequest = {
  …
  messages = [
    #system_({ content = #string(sys); role = #system_; name = null }),
    #user(   { content = #string(usr); role = #user;    name = null }),
  ];
};
```

## [0.1.3](https://github.com/caffeinelabs/openai-client/releases/tag/v0.1.3) — 2026-04-27

### Fixed

- Bumps `serde-core` to `0.1.1` to pull in the Candid type-table cycle fix.
  `JSON.toText(to_candid(req), …)` no longer traps with `IC0502: Canister
  trapped: stack overflow` when `req` carries a `?Map<K, V>` field. Affects
  every `ChatApi.createChatCompletion` call in practice — the request type
  has both `metadata : ?Map<Text, Text>` and `logit_bias : ?Map<Text, Int>`,
  whose self-referential RBT type entries used to send the decoder into
  unbounded re-expansion before any byte of the value was inspected.

## [0.1.2](https://github.com/caffeinelabs/openai-client/releases/tag/v0.1.2) — 2026-04-27

### Fixed

- `ModelIdsShared`, `CreateCompletionRequestModel`, `VoiceIdsShared`, and
  every other `anyOf<string, $ref-to-string-enum>` schema now generate
  as `type X = Text` (a flat alias) instead of the empty record `{}`.
  Consumer code passes `model = "gpt-4o-mini"`; the wire JSON carries
  `"model": "gpt-4o-mini"`. Closes the OpenAI 4xx that 0.1.1's
  diagnostic surfaced as "ModelIdsShared has no synthesisable JSON form".
  `ChatApi.createChatCompletion` is functional end-to-end now.

## [0.1.1](https://github.com/caffeinelabs/openai-client/releases/tag/v0.1.1) — 2026-04-27

### Added

- `validate(value : T) : ?Text` per model; API methods call it before
  serialisation and `throw Error.reject(msg)` on a non-null result.
  Surfaces the `ModelIdsShared` empty-fallback (`oneOf<string, …>` the
  codegen could not tag) to the caller's `catch (e) { e.message() }`,
  instead of letting bad JSON reach OpenAI as `"model": {}`.
- Reply-side errors append `— server returned: <body>` (or byte count
  for binary) to UTF-8/JSON-tokenise/deserialise/declared-error throws.

## [0.1.0](https://github.com/caffeinelabs/openai-client/releases/tag/v0.1.0) — 2026-04-20

Initial release — Motoko client for the OpenAI REST API. Curated
`focusApis` surface (Chat / Completions / Models / Embeddings / Images
/ Audio / Moderations / Files; 220 `.mo` files). Bearer-token auth on
`defaultConfig`. Known generator-template bugs in a handful of
non-Chat models (oneOf-array tag sanitisation, slash-in-record-fields)
mean `mops publish` needs `--no-docs` until upstream is fixed; `mops
build` and the Chat surface are unaffected. Still weeding out the bugs.
