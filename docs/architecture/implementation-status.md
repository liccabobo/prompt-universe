# Implementation Status

> Last updated: 2026-07-01

進度單一真相來源。`plans/` 僅描述設計與規格，不記載實作狀態。`audits/` 內歷史報告僅供參考；若與本檔衝突，以本檔為準。

## 種子與輸出

```text
illustration/seeds/        模式 0 種子庫（.md；category 子資料夾）
output/lisp-drafts/      defprompt 草稿（.lisp）
output/candidates/       待審查編譯結果（gitignored）
output/approved/         已確認 canonical（gitignored）
output/variants/         延伸變體工作區（gitignored）
output/publish/          已發佈變體批次（git tracked）
output/reports/          批次與審計報告
output/logs/             核准紀錄
```

完整 AI 操作流程：`docs/guides/ai-workflow.md`  
新手上手：`README.md`（英文）/ `README.zh-TW.md`（繁中）

---

## MVP-1 — Done

- `defprompt`, `param`, compile pipeline, validator

## MVP-2 — Done

- modules, methods, `use-module` / `use-method`
- `load-seed` / `compile-seed` / `compile-seed-to-file`
- `scripts/compile-seed.lisp`

## MVP-2.5 — Done

- `select-seeds` + `scripts/select-seeds.lisp`
- `load-draft-file` / `compile-draft-to-file` / `approve-draft`
- `scripts/compile-draft.lisp`, `scripts/approve-draft.lisp`
- `output/lisp-drafts/TEMPLATE.lisp`

## MVP-3 — Done（已驗證）

- `defexpansion-plan`, `batch-generate`, `defevolution`, `evolve-prompt`
- `resolve-count` 使用 `config/variant-controller.lisp` 的 `:variant-count`（預設 10）
- `scripts/batch-generate.lisp` → `output/variants/{{PROTOTYPE}}-{{YYYY-MM-DD}}/…-V001.md` …
- `lisp/methods/fusion-evolution.lisp`
- `scripts/batch-from-draft.lisp`（從 approved draft 直接批次）
- 內建 plan：`dessert-jelly-flavor-10`, `aware-loop-transit-10`, `transparent-giant-flower-100`, `matching-paw-pair-species-100`, `platform-last-light-uniform-10`

## MVP-3.5 — Done（Publish）

- `lisp/generator/publish.lisp` — `publish-variant-run`, `reload-publish-config`
- `config/publish.lisp` — `:transfer-mode`, `:on-conflict`, `:write-manifest`, `:require-markdown`
- `scripts/publish-variants.lisp` — CLI 發佈入口
- `output/publish/` — git 追蹤的變體發佈區（`variants/` 仍 gitignored）
- `PUBLISH-MANIFEST.md` — 發佈後自動寫入目標資料夾（`:write-manifest t`）
- 規則文件：`docs/rules/publish.md` / `docs/rules/publish.zh-TW.md`
- 已驗證發佈範例：`output/publish/MATCHING-PAW-PAIR-2026-06-22/`

預設行為：`:transfer-mode . :move`，發佈後來源自 `output/variants/` 移走。

## MVP-3.6 — Done（Higher Macro Layer 基礎）

- `defcomposition-tree` + `(:use-composition ...)`
  - composition tree 會展開成 `COMPOSITION` 與 `NEGATIVE-SPACE GUIDANCE` sections
  - 支援 `:canvas`, `:focal-order`, node `:priority`, `:preserve`, `:mutable`, `:position`
- `defseed-control` + `(:seed-control ...)`
  - expansion plan 可引用 seed-control 取得來源 prompt / seed
  - plan 未直接宣告 `:variant-axes` 時，可 fallback 到 seed-control 的 `:variant-axes`
  - 提供 `effective-plan-preserve` / `effective-plan-forbid` 供 batch / validator 後續接入

## Story Mode — Removed For Rebuild

Story-mode implementation, sample assets, rules, project folders, and scripts were removed on 2026-07-01. `config/mode.lisp` remains as the persistent mode switch; mode ID `1` is reserved for a future rebuilt story mode.

---

## 尚未實作（長期）

- `defprompt-chain`
- markdown ↔ lisp 雙向轉換
- ASDF test system / CI
- 完整 responsible validator（名人/品牌資料庫）

---

## 指令速查

```bash
sbcl --script scripts/compile-seed.lisp prop-design/GOLDEN-MANGO-JELLY
sbcl --script scripts/select-seeds.lisp --intent "cherry jelly prop"
sbcl --script scripts/compile-draft.lisp cherry-jelly
sbcl --script scripts/approve-draft.lisp cherry-jelly
sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10
sbcl --script scripts/show-variant-controller.lisp
sbcl --script scripts/publish-variants.lisp MATCHING-PAW-PAIR-2026-06-22
sbcl --script scripts/show-mode.lisp
```

---

## 文件與審計

| 路徑 | 用途 |
|------|------|
| `README.md` | 專案 onboarding 入口 |
| `agents.md` | AI 操作規則 |
| `docs/guides/ai-workflow.md` | 完整工作流程（含 publish） |
| `docs/rules/` | 格式、變體軸、validator、publish |
| `audits/` | 週期性架構審查（見 `audits/README.md`） |
| `output/reports/` | 單次生成 / validator 報告 |
