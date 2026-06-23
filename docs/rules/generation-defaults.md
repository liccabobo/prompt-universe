# Generation Defaults

## Purpose

This file defines default generation counts for AI + Lisp prompt production.

The goal is to conserve compute while keeping the workflow useful.

## Default Flow

For a normal generation request, the system should produce:

```text
1 canonical prompt candidate
```

After the candidate passes validator and the user confirms it, the system should produce:

```text
10 final prompt variants
```

So the default flow is:

```text
concept
  -> 1 candidate
  -> user review
  -> 10 final variants
```

## Per-Request Override

The user may request a different count for a single request.

Examples:

```text
用這個 rule 跑 1000 個
這次產 50 組
auto-approve 產 100 組
```

When the user explicitly requests a count, that count applies only to the current request.

## Reset Rule

After a per-request override, the next request returns to the default:

```text
1 candidate -> 10 final variants
```

Do not persist a large count such as 1000 as the new default unless the user explicitly asks to change the default settings file.

## Suggested Lisp Defaults

```lisp
(defparameter *default-candidate-count* 1)
```

Variant batch count is controlled in `config/variant-controller.lisp`:

```lisp
(:variant-count . 10)
```

`*default-final-variant-count*` remains as a fallback when the controller omits `:variant-count`.

Use explicit request options for one-off overrides:

```lisp
(batch-generate 'cyber-fairy-red-hood :count 1000)
```

The explicit `:count 1000` does not mutate `config/variant-controller.lisp`.

