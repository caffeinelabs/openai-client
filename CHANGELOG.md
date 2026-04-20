# Changelog

All notable changes to this package are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0](https://github.com/caffeinelabs/openai-client/releases/tag/v0.1.0) — 2026-04-20

### Added

- Initial release of the generated Motoko client for the OpenAI REST API.
- Curated API surface via `focusApis`: **Chat, Completions, Models,
  Embeddings, Images, Audio, Moderations, Files** — 8 API modules, 211
  model modules, and 1 `Config` module (220 `.mo` files total).
- Authentication via `Auth = #bearer Text` (the OpenAI-expected bearer
  token) on `defaultConfig`.

### Known issues

- A small number of generated models contain Motoko that doesn't parse
  because the upstream template isn't fully sanitising its inputs:
  - `oneOf` branches whose item type is a Motoko array leak a `#_[Int]`
    variant tag (Completions, Embeddings).
  - Record fields whose OpenAPI names contain `/`, such as
    `hate/threatening` or `illicit/violent`, appear verbatim in the
    generated Motoko (Moderations).
- Net effect on consumers: `mops build` is green, the Chat surface is
  unaffected, but `mops publish` must be invoked with `--no-docs` until
  the templates are fixed. Details are tracked under the `caveats:` key
  in the upstream generator config.
