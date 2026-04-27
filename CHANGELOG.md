# Changelog

All notable changes to this package are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
