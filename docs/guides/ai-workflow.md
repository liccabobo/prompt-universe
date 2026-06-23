# AI 咒語工作流程

## 四條路徑

| 目標 | 做法 |
|------|------|
| 編譯現有 seed | `compile-seed.lisp` |
| **新咒語**（一句話） | AI 寫 draft → `compile-draft.lisp` |
| **延伸變體**（確認後） | `batch-generate.lisp` |
| **發佈變體**（審核後） | `publish-variants.lisp` |

---

## A. 新咒語（MVP-2.5）

### 你對 AI 說

```text
直接生成：做一個櫻桃口味的 anime prop 果凍，奢華一點，參考 prop-design seed
```

### AI 必須遵守（見 agents.md）

1. **Loop 0**：語義分析，不直接輸出咒語文字
2. **Proposal Review**：等你回 `yes` / `確認`
3. 讀 `prompts/source/` 相似 seed（可用 `select-seeds.lisp`）
4. 讀 `docs/methods/` 選 module / method
5. 寫 `output/lisp-drafts/<name>.lisp`（`defprompt` + `use-module` + `use-method`）
6. 執行編譯 → `output/candidates/<NAME>.md`
7. **停下**，等你審查

### 你可手動跑的指令

```bash
# 找相似 seed
sbcl --script scripts/select-seeds.lisp --intent "cherry jelly prop dessert"

# 編譯 AI 寫好的 draft
sbcl --script scripts/compile-draft.lisp cherry-jelly

# 確認後升格
sbcl --script scripts/approve-draft.lisp cherry-jelly
```

### AI 寫 draft 的結構範本

複製 `output/lisp-drafts/TEMPLATE.lisp`，或參考 `prompts/source/prop-design/GOLDEN-MANGO-JELLY.md` 的 section 層級。

必須包含：

```lisp
(:use-module anime-prop-base no-3d no-photography no-realistic-transparent)
(:use-method anime-material-override negative-space-guidance noise-reduction-ladder)
```

可變的用 `(param "...")` → 編譯成 `{{...}}`。

---

## B. 延伸變體（MVP-3）

### 前提

- 已有一個 **確認過** 的 canonical（approved draft 或 seed）
- 預設產 **10** 個變體（`docs/rules/generation-defaults.md`）

### 內建範例：10 種果凍口味

從 `GOLDEN-MANGO-JELLY` seed 展開：

```bash
sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10
```

自訂數量（單次覆寫，不改全域預設）：

```bash
sbcl --script scripts/batch-generate.lisp dessert-jelly-flavor-10 --count 5
```

輸出：

```text
output/variants/GOLDEN-MANGO-JELLY-2026-06-17/GOLDEN-MANGO-JELLY-V001.md … V010.md
output/reports/batch-dessert-jelly-flavor-10.md
```

### 你對 AI 說

```text
確認。用 dessert-jelly-flavor-10 從 GOLDEN-MANGO-JELLY 產 10 個口味變體。
```

或：

```text
用 strawberry 做 12 個 flavor-variant，保留 anime prop，不要 3D。
```

AI 應：

1. 確認 canonical 已 approved
2. 使用或新建 `defexpansion-plan`（在 `lisp/generator/plans/`）
3. 執行 `batch-generate.lisp`
4. 輸出 variants + report

### 新增自訂 expansion plan

先讀 `docs/rules/variant-expansion-axes.md`。每個變體至少要換：**色系、主題錨點、配件群**。

在 `lisp/generator/plans/` 新增：

```lisp
(defexpansion-plan your-plan-name
  (:seed "prop-design/GOLDEN-MANGO-JELLY")
  (:variant-axes
   (:required :color-theme :theme-anchor :accessory-set)
   (:theme-anchor-keys :flavor :object-design :subtitle)
   (:accessory-keys :top-garnish))
  (:mutations
   ((:flavor "X") (:subtitle "X Jelly") (:color-theme "...")
    (:object-design "...") (:top-garnish "..."))
   ...))
```

`:mutations` 每一組 = 一個變體。常用鍵名：

| 語義軸 | 鍵名 |
|--------|------|
| 色系 | `:color-theme`, `:lighting` |
| 主題錨點 | `:secondary`, `:background`, `:evolution-strategy`, `:object-design`, `:flavor` |
| 配件 | `:thematic-symbol`, `:accessory-design`, `:top-garnish` |
| 服裝 | `:outfit-design` |
| 姿態 / 構圖 | `:action`, `:composition` |

`batch-generate` 會驗證每個變體是否滿足 `:required` 軸；未通過會直接拒絕。

### 變體數值控制器

只影響變體批次。手動編輯：

```text
config/variant-controller.lisp
```

```bash
sbcl --script scripts/show-variant-controller.lisp
```

欄位：`:color-shift`、`:gender-mode`（`:fixed`/`:mutable`）、`:scene-shift`、`:accessory-shift`、`:evolution-fusion`、`:material-accent`（如 `prism`）、`:leap-creativity`（`t`/`nil`）、`:axis-threshold`。每次 `batch-generate` 會重新載入。

---

## C. 發佈變體（MVP-3.5）

### 白話目的

批次咒語會先出現在 `output/variants/`（**本機工作區，git 不追蹤**）。

你在裡面找到想分享的那一批 → publish 到 `output/publish/` → commit → 夥伴 pull 就能用。

**主要目的：快速跟其他人分享咒語，而不是只留在自己電腦。**

詳見 [`docs/rules/publish.zh-TW.md`](../rules/publish.zh-TW.md)（繁中）/ [`docs/rules/publish.md`](../rules/publish.md)（英文）

### 前提

- 目標 run folder 已存在於 `output/variants/{{PROTOTYPE}}-{{YYYY-MM-DD}}/`
- 你已手動審核（或編輯）過該批次內的 `.md` 咒語
- 你**明確**說要發佈（AI 不得自動 publish）

### 手動發佈

```bash
# 方式 A：腳本（推薦；會寫 PUBLISH-MANIFEST.md）
sbcl --script scripts/publish-variants.lisp MATCHING-PAW-PAIR-2026-06-22

# 方式 B：純 mv（等同預設 :transfer-mode :move）
mv output/variants/MATCHING-PAW-PAIR-2026-06-22 output/publish/

# 接著提交
git add output/publish/MATCHING-PAW-PAIR-2026-06-22
git commit -m "publish: matching-paw-pair species 100"
```

`run-folder` 參數可接受：

```text
MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22
output/variants/MATCHING-PAW-PAIR-2026-06-22/
```

### 設定檔

手動編輯 `config/publish.lisp`（每次執行腳本都會重載）：

| 欄位 | 預設 | 說明 |
|------|------|------|
| `:transfer-mode` | `:move` | 發佈後從 `variants/` 移走；改 `:copy` 可保留副本 |
| `:on-conflict` | `:error` | 目標已存在時拒絕；可改 `:overwrite` 或 `:skip` |
| `:write-manifest` | `t` | 寫入 `PUBLISH-MANIFEST.md` |
| `:require-markdown` | `t` | 來源資料夾至少需有一個 `.md` |

完整規則：`docs/rules/publish.zh-TW.md`（繁中）/ `docs/rules/publish.md`（英文）

### 你對 AI 說

```text
發佈 MATCHING-PAW-PAIR-2026-06-22 到 publish
```

AI 應：

1. 確認 run folder 在 `output/variants/`
2. 執行 `scripts/publish-variants.lisp <run-folder>`
3. 提醒你 `git add output/publish/<run-folder>`

**禁止**：從 `candidates/` 或 `approved/` 直接 publish；只發佈變體批次。

---

## D. 只編譯現有 seed（不創新）

```bash
sbcl --script scripts/compile-seed.lisp --list
sbcl --script scripts/compile-seed.lisp prop-design/GOLDEN-MANGO-JELLY
```

---

## 完整生命週期

```text
prompts/source/              唯讀種子庫
    ↓ select-seeds（找結構範本）
你一句話 → AI Proposal Review
    ↓
output/lisp-drafts/*.lisp    AI 寫的 defprompt 草稿
    ↓ compile-draft.lisp
output/candidates/*.md       你審查
    ↓ approve-draft.lisp（你說 yes）
output/approved/*.md         canonical
    ↓ batch-generate.lisp
output/variants/{{PROTOTYPE}}-{{DATE}}/*.md   延伸咒語（預設 10，按原型+日期分資料夾；gitignored）
    ↓ publish-variants.lisp 或 mv 到 publish
output/publish/{{PROTOTYPE}}-{{DATE}}/*.md    已發佈變體（可 git 追蹤）
output/reports/batch-*.md    批次報告
```

**禁止**：修改 `prompts/source/`、跳過 Lisp 直接寫最終咒語、未確認就 batch、未明確指示就 publish。

---

## 相關文件

| 文件 | 內容 |
|------|------|
| `README.md` | 專案 onboarding 與指令速查 |
| `agents.md` | AI 必守規則 |
| `docs/rules/publish.zh-TW.md` | 發佈規則（繁中，含白話說明） |
| `docs/rules/publish.md` | Publish rules (English) |
| `docs/architecture/implementation-status.md` | MVP 進度 |
| `audits/` | 週期性架構審查 |