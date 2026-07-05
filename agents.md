# agents.md

## Prompt Universe DSL Operating Rules

This is the public **Prompt Universe** repository — a Lisp DSL for structured prompt generation, licensed for fan and personal non-commercial use only (see `LICENSE`). AI must treat prompt generation as a structured DSL workflow, not as free-form prompt writing.

## Core Rule

Never output complete final prompt text as the first response.

All creative prompt content must first be represented as Lisp structure. Final prompt text may only be produced after user confirmation or an explicit `auto-approve` mode.

## Prompt Output Format Rules

When compiling final prompt markdown files, AI must follow `docs/rules/prompt-output-format.md`.

Mandatory summary:

- Final prompt markdown filenames must use uppercase English kebab-case, such as `HOLO-NAILS.md`.
- Exception: published variant prompt files under `output/publish/` may add a compact localized descriptor suffix after the stable uppercase English variant ID, such as `MATCHING-PAW-PAIR-V001-柯基犬.md`, when useful for human browsing.
- Repository folders, Lisp files, context articles, method notes, rules, reports, and logs must use lowercase English kebab-case.
- Final prompt sections must use uppercase section headings, such as `TITLE:`, `COLOR THEME:`, `PRIMARY:`, and `NEGATIVE:`.
- Section content should generally be lowercase, compact, and prompt-like, except for titles, proper nouns, branding, model tokens, or explicit image text.
- Use `{{...}}` for replaceable parameters.
- AI must infer which values should become `{{}}` parameters based on series logic, expansion axes, and user reuse intent.
- Lisp and macro design must preserve replaceable parameter boundaries so the compiler can render them as `{{...}}`.

## Generation Defaults

AI must follow `docs/rules/generation-defaults.md`.

## Mode Switch

Edit `config/mode.lisp`. Modes use **numeric IDs**; add `2`, `3`, … in `lisp/generator/mode.lisp` `*mode-id-registry*` when new modes ship.

| ID | Mode | Default paths |
|----|------|---------------|
| `0` | illustration（主模式） | `illustration/seeds/`, `output/`（candidates, variants, …） |
| `1` | reserved | reserved for rebuilt story mode |

```lisp
((:current-mode . 0))   ; illustration
```

Verify: `sbcl --script scripts/show-mode.lisp` (reloads config every run).

### Mode gate (AI + human)

Three layers keep mode execution correct:

| Layer | Guarantee |
|-------|-------------|
| **Scripts** | Mode-aware scripts call `reload-mode-config` each run |
| **Config** | `config/mode.lisp` is the baseline when the user does not specify mode in chat |
| **Loop 0** | AI must **declare** mode in 語義分析 before any Lisp structure or final prompt text |

**Loop 0 mode rules:**

1. Every creative request starts with mode resolution: currently `0 illustration`.
2. Mode `1` story mode has been removed for rebuild. Do not use story-specific files, scripts, rules, or output paths until a new story mode ships.
3. Read `reload-mode-config` intent before proposing compile commands; remind the user to edit `config/mode.lisp` when they want a persistent default switch.

## Variant Expansion Axes

AI must follow `docs/rules/variant-expansion-axes.md` when authoring `defexpansion-plan` or running `batch-generate`.

Default required axes per variant:

- `:color-theme` — palette must change
- `:theme-anchor` — scene premise category must change at the same abstraction layer
- `:accessory-set` — symbolic props / garnish must re-theme to the new anchor

Every `defexpansion-plan` should declare `(:variant-axes ...)` and satisfy axis validation before batch output. Do not ship variants that only tweak lighting or composition while keeping the same premise noun cluster.

Variant authoring must stay inside the Lisp DSL. Do not create Python, shell, JavaScript, or other external codegen scripts to generate `defexpansion-plan` files, and do not place one-off plan generators under `scripts/`. If a large variant family needs programmatic generation, implement it as Lisp data/functions/macros loaded through the normal Lisp runtime.

## Variant Controller

For variant batch runs only, AI must read `config/variant-controller.lisp` and `docs/rules/variant-controller.md`.

The user edits `config/variant-controller.lisp` manually to tune `:variant-count` (default 10), sliders (`:color-shift`, `:scene-shift`, `:accessory-shift`, `:evolution-fusion`), `:gender-mode`, `:material-accent`, `:leap-creativity`, and `:axis-threshold`. `batch-generate` reloads this file every run and applies it to validation and post-mutation effects.

Default behavior:

- Generate 1 canonical prompt candidate first.
- Stop for review.
- After the user confirms the candidate, generate 10 final variants by default.
- If the user explicitly requests a different count, such as 1000, that count applies only to the current request.
- After the request finishes, the default returns to 10 final variants.
- Do not persist large counts as defaults unless the user explicitly asks to change the default settings.

## Source Seed Protection

AI must follow `docs/rules/source-seed-protection.md`.

Hard rules:

- Do not modify files under `illustration/seeds/`.
- Treat `illustration/seeds/` as immutable curated seed prompts.
- Source prompts may be read for seed retrieval, structure analysis, validator audits, and module extraction proposals.
- If a source prompt has an issue, report it in `output/reports/`; do not edit it.
- AI-generated or compiler-generated prompts must not be written to `illustration/seeds/`.
- Only the user may decide whether a generated prompt is promoted into `illustration/seeds/`.

## Generated Prompt Output Locations

AI + Lisp compiler outputs must use lifecycle-specific output folders:

```text
output/candidates/          # mode 0 — illustration
output/approved/              # mode 0
output/variants/              # mode 0
output/publish/               # mode 0
output/batches/               # mode 0
output/lisp-drafts/           # defprompt drafts
output/reports/
output/logs/
```

Use:

- `output/candidates/` for one canonical prompt candidate before user approval (mode `0`).
- `output/approved/` for user-approved canonical prompts generated by the system.
- `output/variants/` for individual variant prompts, grouped by run folder `{{PROTOTYPE}}-{{YYYY-MM-DD}}/` (e.g. `output/variants/AWARE-LOOP-2026-06-17/AWARE-LOOP-V001.md`). This folder is gitignored.
- `output/publish/` for user-approved variant batches ready for git tracking and sharing with partners. Users pick a run folder in `output/variants/`, then promote it to `publish/` (same folder name, parent directory only). See `docs/rules/publish.md`, `docs/rules/publish.zh-TW.md`, and `config/publish.lisp`.
- `output/batches/` for large generated sets such as 1000-prompt runs.
- `output/reports/` for validator reports, promotion proposals, ablation reports, and audit reports.
- `output/logs/` for generation logs.

## Variant Publish

AI must follow `docs/rules/publish.md` and `docs/rules/publish.zh-TW.md`.

When the user explicitly asks to publish a variant batch:

1. Confirm the target run folder under `output/variants/`.
2. Run `scripts/publish-variants.lisp <run-folder>` or perform the equivalent move to `output/publish/`.
3. Remind the user to `git add output/publish/<run-folder>`.

Default publish behavior uses `config/publish.lisp` with `:transfer-mode . :move`, so the batch leaves `output/variants/` after publish.

Do not publish without explicit user intent.

## Documentation and Audits

Onboarding entry points:

- `README.md` / `README.zh-TW.md` — project overview and onboarding (EN / 繁中)
- `docs/guides/ai-workflow.md` — full lifecycle including publish
- `docs/architecture/implementation-status.md` — MVP progress (single source of truth)

Periodic architecture scans live in `audits/` (see `audits/README.md`). When `audits/` reports conflict with `implementation-status.md`, prefer `implementation-status.md` and `README.md`.

New audit reports under `audits/` must be written in Traditional Chinese. Technical identifiers, file paths, commands, function names, and exact error messages may stay in English. Do not retroactively rewrite historical audit reports only for language consistency.

`output/reports/` is for single-run validator, batch, and promotion reports — not periodic architecture reviews.

## Responsible Prompt Validator

AI must follow `docs/rules/responsible-prompt-validator.md`.

Before using `illustration/seeds/` as a trusted seed library, AI should run or propose a responsible source audit and write the report to:

```text
output/reports/source-responsible-audit.md
```

The validator should flag real person names, celebrity names, public figure names, brand names, copyrighted character names, franchise names, artist style references, and realistic likeness requests.

Source prompt issues are report-only. Generated prompt issues may be warnings or rejections depending on severity.

## Loop Selection

### When the user says "直接生成"

- Do not generate final prompt text directly.
- Run **Loop 0: Interpret & Propose** first.
- Output semantic dimensions, proposed Lisp changes, `preserve` / `mutate` / `forbid`, and selected next loop.
- Wait for user confirmation before compiling, unless the user explicitly enabled `auto-approve`.

### When the user says "用 XXX rule 跑 12 個"

- Treat this as an explicit controlled loop command.
- Skip creative interpretation unless required fields are missing.
- Load the named evolution rule.
- Apply `preserve` / `mutate` / `forbid` strictly.
- Output Lisp variants first.
- Run validator before any compiled prompt output.

### When the user request is ambiguous

- Prefer **Loop 0: Interpret & Propose** over direct generation.
- Resolve mode first; currently only `0 illustration` is available.
- Convert the request into semantic dimensions and a structured Lisp proposal.
- Do not compile until the structure is approved or `auto-approve` is active.

## Required Output Order

For creative or generation requests, AI must follow this order:

```text
Natural language request
  -> mode resolution (0 illustration)
  -> Loop 0: Interpret & Propose
  -> Proposal Review
  -> Lisp structure proposal
  -> user confirmation or auto-approve
  -> controlled loop execution
  -> validator
  -> compiled final prompt
```

For explicit rule-based batch requests, AI must follow this order:

```text
Controlled loop command
  -> load source prompt and rule
  -> generate Lisp variants
  -> validator
  -> compiled prompt output only after approval or auto-approve
```

## Lisp First

AI may propose or edit:

- `defprompt` (mode `0`)
- `defmodule`
- `defmethod`
- `defevolution`
- `propose-change`
- composition trees
- seed control forms
- prompt chains
- semantic tags
- risk tags
- mutate operations

AI must not bypass Lisp by writing a complete finished prompt directly.

## Layered Macro Rules

AI may use Lisp macros, but only as layered DSL expansion helpers.

Required rules:

- Prefer layered macros over one giant macro.
- Keep `section + module + method + evolution` boundaries visible.
- Macro expansion must produce normalized Lisp structures that compiler and validator can inspect.
- Do not let macros directly output final prompt text.
- Do not let macros bypass `preserve` / `mutate` / `forbid`.
- Do not hide seed control, composition tree, or prompt chain steps inside opaque generated text.

Allowed macro layers:

- prompt macro
- section macro
- module macro
- method macro
- evolution macro
- expansion macro

If a requested macro would combine prompt creation, style mutation, chain execution, validation, and batch generation into one form, split it into smaller layers before proposing it.

## Composition Tree, Seed Control, Prompt Chain

When a request involves scene layout, multi-object composition, prompt expansion, or style transfer, AI should prefer explicit structures:

```lisp
(defcomposition-tree ...)
(defseed-control ...)
(defprompt-chain ...)
```

Prompt chains must be interruptible and reviewable. Each chain step should declare input, output, `preserve`, `mutate`, and `forbid` where relevant.

Chain pollution is considered a known risk. For long chains, AI should propose validator checks or ablation reports instead of assuming the chain is safe.

## Proposal Review

After every **Loop 0: Interpret & Propose**, AI must stop at a Proposal Review checkpoint.

Unless the user explicitly replies with `yes`, `確認`, or has enabled `auto-approve`, AI must not run `evolve-prompt`, `fusion`, `refine`, `expand`, `compile`, or output complete final prompt text.

Required Proposal Review format:

```md
### 語義分析
指令：「xxx」
模式：0 illustration
理解為：改變色彩方向、增加 XXX 氛圍、保留 prop identity

### 建議結構變更
- 新 module: night-luxury-palette
- mutate color-theme: ...
- 使用 evolution: luxury-night-dream
- preserve: ...
- forbid: ...
- 預估風險：...

### 下一步
要我直接執行：
(evolve-prompt 'strawberry-jelly 'luxury-night-dream :count 8)
嗎？
```

If the proposal includes a new module, method change, schema change, or fusion evolution, default to manual approval even when the request is informal.

## Semantic Fields

Prompt and evolution definitions should support:

```lisp
:intent
:semantic-tags
:risk-tags
```

Use these fields for semantic search, rule selection, validator checks, and prompt drift control.

## Semantic Mutate Rules

`defevolution` may use semantic triggers and mutate operations:

```lisp
(:trigger-semantic ...)
(:mutate
  (:section
    (add ...)
    (remove ...)
    (reduce ...)
    (replace old new)
    (set ...)
    (soften ...)
    (intensify ...)
    (localize ...)))
(:preserve ...)
(:forbid ...)
```

When semantic mutate rules are available, `evolve-prompt` should:

```text
match :trigger-semantic / :semantic-tags
  -> apply mutate operations
  -> preserve required sections
  -> reject forbid terms
  -> validate
```
