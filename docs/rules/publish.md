# Publish

*English · [繁體中文](publish.zh-TW.md)*

## In plain language

You generate variant prompts into `output/variants/`. That folder is **local working space** — git ignores it, so your teammates cannot see it.

When you find a batch you actually want to share, **publish** it:

1. Pick the run folder under `output/variants/` (for example `MATCHING-PAW-PAIR-2026-06-22/`)
2. Move it to `output/publish/` with the same folder name
3. `git add` and commit

After that, the spells live in **git-tracked** storage. Anyone with repo access can pull them immediately — that is the main point of this feature.

```text
variants  = try, edit, keep local
publish   = ready to share with partners via git
```

---

## Purpose

`output/publish/` is the **git-tracked release area** for approved variant batches.

Working variants stay in `output/variants/` (ignored by git). When a batch is ready to ship, promote it to `output/publish/`.

## Folders

```text
output/variants/{{PROTOTYPE}}-{{YYYY-MM-DD}}/   working area (gitignored)
output/publish/{{PROTOTYPE}}-{{YYYY-MM-DD}}/    published area (git tracked)
```

Folder naming stays identical. Only the parent directory changes:

```text
variants  ->  publish
```

## Config

```text
config/publish.lisp
```

| Field | Type | Meaning |
|-------|------|---------|
| `:source-directory` | path string | Source root (default `output/variants/`) |
| `:publish-directory` | path string | Publish root (default `output/publish/`) |
| `:transfer-mode` | `:move` / `:copy` | Move out of variants, or keep a working copy |
| `:on-conflict` | `:error` / `:overwrite` / `:skip` | Behavior when publish target already exists |
| `:write-manifest` | boolean | Write `PUBLISH-MANIFEST.md` after publish |
| `:require-markdown` | boolean | Reject empty folders with no `.md` prompts |

Default behavior is **move**, so a published batch leaves `output/variants/`.

## Manual Workflow

After reviewing a variant batch:

```bash
mv output/variants/MATCHING-PAW-PAIR-2026-06-22 output/publish/
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
git commit -m "publish: matching-paw-pair species 100"
```

## Script Workflow

```bash
sbcl --script scripts/publish-variants.lisp MATCHING-PAW-PAIR-2026-06-22
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
```

The script reloads `config/publish.lisp` on every run.

Accepted folder arguments:

```text
MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22/
```

## Lifecycle

```text
batch-generate
  -> output/variants/{{PROTOTYPE}}-{{DATE}}/
  -> user review / edits
  -> publish (move or copy)
  -> output/publish/{{PROTOTYPE}}-{{DATE}}/
  -> git add / commit
  -> partners pull and use the same spells
```

## Git Rules

- `output/variants/` remains in `.gitignore`
- `output/publish/` is **not** ignored
- Do not publish directly from `output/candidates/` or `output/approved/`; publish variant batches only

## AI Rule

When the user says **發佈**, **publish**, or **移到 publish**, AI should:

1. Confirm the target run folder under `output/variants/`
2. Run `scripts/publish-variants.lisp` or perform the equivalent `mv`
3. Remind the user to `git add output/publish/<run-folder>`

Do not publish without explicit user intent.