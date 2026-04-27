# Changelog

All notable changes to this package are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
