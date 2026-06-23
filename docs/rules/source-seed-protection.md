# Source Seed Protection Rules

## Purpose

`prompts/source/` is the curated seed prompt library.

Files in this directory are successful, experimentally verified prompts with high reuse value. They are treated as stable seeds for retrieval, reference, fusion, and expansion.

## Immutable Source Rule

AI must not modify files under:

```text
prompts/source/
```

This includes:

- rewriting prompt content
- renaming files
- moving files
- formatting files
- normalizing text
- adding metadata
- fixing spelling
- applying validator suggestions directly

If a source prompt has an issue, AI must report it instead of editing it.

## Allowed Use

AI may read `prompts/source/` files for:

- seed retrieval
- structure analysis
- module extraction proposals
- validator audits
- risk reports
- prompt comparison
- generating derived Lisp drafts

AI may not write back to `prompts/source/`.

## Derived Prompt Rule

AI-generated or compiler-generated prompt files must not be placed in `prompts/source/`.

They must be written to `output/` according to lifecycle stage:

```text
output/candidates/
output/approved/
output/variants/
output/publish/
output/batches/
output/reports/
output/logs/
```

Only the user may decide whether a generated prompt should later become a curated source seed.

## Promotion Rule

If AI believes a generated prompt should become a source seed, it may create a promotion proposal in:

```text
output/reports/
```

The proposal should include:

- source candidate path
- suggested target category
- reason for promotion
- validator result summary
- known risks

AI must not perform the promotion by itself.

