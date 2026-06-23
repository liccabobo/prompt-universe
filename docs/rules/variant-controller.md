# Variant Controller

## Purpose

`config/variant-controller.lisp` is the **manual control panel for variant generation only**. Edit it any time; `batch-generate` and `evolve-prompt` reload it on every run.

## File

```text
config/variant-controller.lisp
```

## Fields

| Field | Type | Meaning |
|-------|------|---------|
| `:variant-count` | integer ≥ 1 | 每次 batch / evolve 預設產出的變體數量（預設 10） |
| `:color-shift` | 0–100 | 色系變化強度 |
| `:gender-mode` | `:fixed` / `:mutable` | 性別呈現不變 / 允許變體漂移 |
| `:scene-shift` | 0–100 | 場景與主題錨點變化 |
| `:accessory-shift` | 0–100 | 配件與符號道具變化 |
| `:evolution-fusion` | 0–100 | 演化策略與融合創意強度 |
| `:material-accent` | string | 附加材質，如 `prism`、`holo`、`lightflow`，空字串 = 關閉 |
| `:leap-creativity` | `t` / `nil` | 跳躍式創意：開 / 關 |
| `:axis-threshold` | 0–100 | 全域門檻：slider ≥ 此值時該軸變為硬性必填 |

## Slider Bands

```text
0                = off（不強制）
1 .. threshold-1 = soft（建議，不擋 batch）
threshold .. 100 = hard（驗證必填）
```

Default `:axis-threshold` is `50`.

## Two Control Layers

1. **Per-axis sliders** — 控制各語義軸要變多深（色系 / 場景 / 配件 / 演化融合）。
2. **`:axis-threshold`** — 控制「多深的 slider 才算硬性要求」。

## Gender Mode

- `:fixed` — 變體不得 mutate `:gender-presentation`、`:body-proportion`、`:face-style`、`:facial-traits`。
- `:mutable` — 允許上述鍵出現在 mutation 中。

## Material Accent

When non-empty, compiler appends a controlled accent phrase to each variant's `QUATERNARY` section after mutation.

## Leap Creativity

- `nil` — follow same-abstraction swap rules in `variant-expansion-axes.md`.
- `t` — marked in effective axis spec; AI may author cross-layer jumps in expansion plans.

## Example

```lisp
((:variant-count . 10)
 (:color-shift . 80)
 (:gender-mode . :fixed)
 (:scene-shift . 85)
 (:accessory-shift . 80)
 (:evolution-fusion . 75)
 (:material-accent . "prism")
 (:leap-creativity . nil)
 (:axis-threshold . 50))
```

## Workflow

```text
edit config/variant-controller.lisp
  -> batch-generate / evolve-prompt reloads controller
  -> effective required axes recomputed
  -> validation + QUATERNARY material injection
  -> batch report logs controller table
```