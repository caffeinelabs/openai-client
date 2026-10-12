# AGENTS.md

A Motoko client library for the OpenAI REST API, distributed as a [mops](https://mops.one) package named `openai-client`.

## Generated code — do not hand-edit

All of `src/` (`src/Config.mo`, `src/Apis/**/*.mo`, `src/Models/**/*.mo`) is produced by [OpenAPI Generator](https://openapi-generator.tech) (`MotokoClientCodegen`). Treat it as generated output: edits will be overwritten the next time the client is regenerated. The `.openapi-generator/` directory and `.openapi-generator-ignore` hold generator metadata and overwrite rules.

This package intentionally ships only a curated subset of the upstream OpenAPI surface (Chat, Completions, Models, Embeddings, Images, Audio, Moderations, Files) plus the models they reference transitively; other APIs are pruned. See the `## API Subset` section of `README.md`.

## Toolchain

The Motoko compiler version is pinned in `mops.toml` under `[toolchain]` (`moc = "1.4.1"`). Dependencies and their versions are declared in `[dependencies]`; `mops.lock` pins the resolved set. Note `serde-core` is a specific fork — keep the version and comment in `mops.toml` intact.

## Build

Install dependencies with `mops` (`mops install`). There is no build, test, lint, or format tooling configured in this repository: `mops.toml` defines no scripts, there is no `test/` directory, and there are no `.github/workflows/`. Do not invent such commands.

## Layout

- `src/Apis/` — one module per supported API group (e.g. `ChatApi.mo`).
- `src/Models/` — one module per request/response/schema type.
- `src/Config.mo` — shared `Config`/`Auth` types and `defaultConfig`.

## Usage notes (from `README.md`)

Consumers import modules as `mo:openai-client/...`. API calls take a `Config`; build one by customizing `defaultConfig`, e.g. `{ defaultConfig with auth = ?#bearer "my-token" }`. Calls make Internet Computer HTTP outcalls and require cycles; `defaultConfig` sets `cycles = 30_000_000_000` and `baseUrl = "https://api.openai.com/v1"`.
