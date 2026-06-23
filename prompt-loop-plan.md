# Prompt Loop Plan

## 目的

建立一套最完整、最可控的本地 prompt 系統設計，使用 `.md + Lisp + AI` 管理結構化 prompt，形成公開的 **Prompt Universe Lisp DSL**（粉絲個人非商用授權，見 `LICENSE`）。

最終目標是一個可程式化的咒語宇宙：prompt 可以被拆解、組合、驗證、演化、比較與回填，而不是只保存成一段段不可控的文字。

核心方向不是讓 AI 自由生成長咒語，而是讓 AI 在明確的模組、規則、方法論與演化邊界中，先理解語義，再轉成 Lisp 結構，經過 compiler 與 validator 後，才產生最終 prompt。

## 核心概念

```text
Human taste
  -> .md 方法論文件
  -> Lisp 模組與 macro
  -> AI 語義理解與結構化轉譯
  -> AI 受控 loop 執行
  -> Compiler + Validator
  -> Prompt variants
  -> 人工挑選 / AI 自評 / 再演化
```

系統應該把 prompt 視為一種可組合的結構，而不是一整段不可分析的文字。

```text
Prompt = Sections + Modules + Methods + Rules
Module = 可重用語義片段
Method = 咒語技法，例如降噪階梯、負空間引導、融合演化
Rule = 演化時的保留、變異、禁止條件
Compiler = 把 Lisp 結構轉成最終咒語
Validator = 檢查 schema、forbid、風格邊界與 prompt 漂移
AI = 同時扮演語義理解器與受控執行器，但最終輸出必須經過 Lisp 結構
```

## 核心生產流程

這個專案的核心目標是把一句概念提示詞，轉成一個可審查、可確認、可量產的 Lisp prompt 系統。

主流程分成兩個階段：

```text
Phase A: Canonical Prompt Creation

一句概念提示詞
  -> Loop 0: Interpret & Propose
  -> Seed Retrieve
  -> Lisp prompt draft
  -> compiler
  -> 產生 1 個新咒語
  -> stop
  -> 人工檢驗
```

```text
Phase B: Approved Batch Expansion

使用者說 ok
  -> AI 再次操作 Lisp
  -> macro expansion plan
  -> generator
  -> compiler + validator
  -> 產生 1000 個受控咒語
  -> reports
```

也就是：不能從一句概念直接跳到 1000 個咒語。必須先產生一個 canonical prompt，經過人工確認後，才能進入 macro + generator 的大量展開。

高層 pipeline：

```text
Concept Input
  -> Interpret & Propose
  -> retrieve similar curated seeds
  -> generate Lisp draft prompt
  -> compile one prompt
  -> Human Review Gate
  -> approved
  -> Macro Expansion Plan
  -> Batch Generate
  -> Validator
  -> output variants + reports
```

## Curated Seed Prompt Library

`prompts/source/` 是 curated seed library，不是普通草稿區。

這裡只放：

- 已經實驗成功的咒語。
- 品質穩定、可複用、可拆解、可演化、可融合的咒語。
- 能代表一種 prompt 任務型態或結構方法的 canonical seed。

`prompts/source/` 下的所有咒語都禁止由 AI 修改。這些檔案只能作為 immutable seeds 被讀取、分析、檢索、審核與引用。若 validator 發現問題，必須輸出 report，不得直接改 source。

初期應放入的 seed 類型：

- `prop-design`：道具、物件、食物、收藏品、商品式設計。
- `character-design`：角色身份、服裝、髮型、情緒、姿態。
- `editorial-cover`：封面、海報、雜誌、文字階層、前中後景。
- `detail-shot`：手、指甲、材質、局部特寫、解剖風險控制。
- `scene-design`：場景、空間、氛圍、環境敘事。
- `story-illustration`：劇情圖、故事瞬間、角色互動、情緒張力。
- `style-transfer`：風格變換、材質覆寫、非 3D / 非攝影控制。
- `worldbuilding`：世界觀、族群、文化、物件系統。
- `evolution-strategy`：已驗證的語義演化策略 seed。
- `evolution-fusion`：已驗證的融合演化 seed。
- `noise-reduction-ladder`：已驗證的降噪階梯 seed。

第一批可放入的已知 seed：

```text
prompts/source/prop-design/GOLDEN-MANGO-JELLY.md
prompts/source/character-design/SNOW-WHITE.md
prompts/source/detail-shot/HOLO-NAILS.md
```

這三個已存在 seed 分別覆蓋：

- `GOLDEN-MANGO-JELLY`：prop-design、material control、anime prop readability。
- `SNOW-WHITE`：character-design、fairytale identity、editorial hierarchy。
- `HOLO-NAILS`：detail-shot、anatomy risk control、holographic material control。

後續要補齊：

- 純 `character-design` seed。
- `scene-design` seed。
- `story-illustration` seed。
- `style-transfer` seed。
- `worldbuilding` seed。

## Seed Retrieval

AI 在 Loop 0 後，不應只憑空產生新咒語，而應根據 `:intent`、`:semantic-tags`、prompt type 與 risk profile，從 curated seed library 找相似範本。

範例：

```lisp
(select-seeds
  :intent "cyber fairy red hood"
  :semantic-tags '(:character-design :fairytale :cyber :editorial)
  :limit 5)
```

Seed retrieval 用途：

- 找出可 follow 的結構。
- 找出可重用的 module。
- 找出應保留的品質邊界。
- 找出相似 prompt 的風險標籤。
- 幫助 Draft One 產生更接近既有成功案例的 Lisp prompt。

## Human Review Gate

Phase A 的輸出永遠只是一個 canonical prompt candidate。

在使用者確認前，不進入 1000 個咒語量產。

確認規則：

```text
compile one prompt
  -> stop
  -> user reviews
  -> user says ok
  -> create macro expansion plan
  -> batch generate
```

如果使用者沒有說 `ok`、`yes`、`確認` 或啟用 `auto-approve`，AI 不能進入 batch expansion。

## Generation Defaults

預設生成數量放在規則與 Lisp defaults 中，讓使用者可以手動更改，也可以要求 AI 透過結構化變更去修改。

規則來源：

```text
docs/rules/generation-defaults.md
```

預設流程：

```text
一句概念
  -> 產生 1 個 canonical prompt candidate
  -> stop
  -> 使用者確認 ok
  -> 產生 10 組 final variants
```

預設值：

```lisp
(defparameter *default-candidate-count* 1)
(defparameter *default-final-variant-count* 10)
(defparameter *default-batch-count* 10)
```

如果使用者單次要求：

```text
產 1000 個咒語
```

則本次 request 可覆寫為：

```lisp
(batch-generate 'some-approved-prompt :count 1000)
```

但這是單次覆寫，不修改全域預設。下一次如果使用者沒有明確指定數量，仍回到：

```text
1 candidate -> 10 final variants
```

## Generated Prompt Lifecycle

AI + Lisp macro / compiler 產生的咒語不放入 `prompts/source/`。

生成結果依生命週期放置：

```text
output/candidates/
  編譯出來但尚未經人工確認的 canonical prompt candidate。

output/approved/
  使用者確認 ok 後的 canonical prompt。

output/variants/
  單個變體 prompt。

output/batches/
  大量生成批次，例如 1000 prompt run。

output/reports/
  validator report、source audit、promotion proposal、ablation report。

output/logs/
  generation logs。
```

`output/approved/` 仍然不是 `prompts/source/`。是否把 approved prompt 升格為 source seed，只能由使用者決定。

## Macro Expansion Plan

1000 個咒語不應由 AI 自由寫出，而應由 macro expansion plan 展開。

範例：

```lisp
(defexpansion-plan luxury-dessert-props-1000
  (:source strawberry-jelly-approved-v1)

  (:axes
   (:flavor 25)
   (:palette 10)
   (:lighting 5)
   (:garnish 4)
   (:composition 2))

  (:preserve
   :anime-illustration-priority
   :prop-readability
   :negative-boundary
   :material-logic)

  (:forbid
   "photography"
   "3D render"
   "realistic refraction"
   "cluttered tabletop"))
```

這個例子中：

```text
25 x 10 x 5 x 4 x 2 = 1000
```

量產的核心不是「寫 1000 次」，而是定義可控展開軸，讓 generator 產生 Lisp variants，再交給 validator 與 compiler。

## AI 雙重角色

AI 在系統中有兩個角色。這兩個角色必須分離，避免創意生成直接跳過結構控制。

### 角色 A：受控執行者（Loop Executor）

Loop Executor 嚴格遵守 schema、`defmodule`、`defmethod`、`defevolution`、`preserve`、`mutate`、`forbid` 等規則。

責任：

- 只執行明確定義的 loop，例如 expand、evolve、fusion、validate、compare、refine。
- 不自由發揮文字。
- 不直接產生最終 prompt。
- 依照 preserve / mutate / forbid 檢查每一次變體生成。
- 只操作已存在或被明確提案新增的 Lisp 結構。
- 把所有輸出交給 compiler 與 validator。

執行路徑：

```text
Loop command
  -> read schema / modules / methods / evolution rules
  -> apply structured changes
  -> compile
  -> validate
  -> output prompt
```

### 角色 B：語義理解與創意翻譯器（Semantic Interpreter）

Semantic Interpreter 負責處理模糊、自然語言、靈感式指令。

責任：

- 先理解自然語言中的意圖、主體、風格、限制與風險。
- 提出結構化變更建議。
- 說明哪些 module 要新增、哪些 module 要修改、哪些 section 要 mutate。
- 把創意概念轉成 Lisp 結構，而不是直接寫成最終 prompt。
- 將所有創意輸出交給 compiler + validator 檢查。

語義轉譯路徑：

```text
Natural language request
  -> semantic interpretation
  -> structured change proposal
  -> Lisp module / prompt / evolution edits
  -> compile
  -> validate
  -> final prompt text
```

### 角色切換原則

- 使用者給出明確 loop 指令時，AI 進入 Loop Executor。
- 使用者給出模糊創意、方向、氣氛、主題時，AI 先進入 Semantic Interpreter。
- Semantic Interpreter 不能直接輸出最終 prompt；必須先轉成 Lisp 結構。
- Loop Executor 不能自行發明未定義規則；若需要新規則，必須提出結構化新增建議。
- 最終 prompt 永遠是 compiler 的產物，不是 AI 自由撰寫的產物。


## 目錄架構

目錄架構應該以通用語義維度為中心，而不是以最早的案例類型為中心。Prompt Universe Lisp DSL 未來需要支援角色設計、場景設計、劇情圖、風格變換、任意主題、任意色彩組合與跨領域延伸，因此 `modules/` 不應被甜點、封面、美甲等案例綁住。

`lisp/` 底下應主要放 DSL 程式、schema、module、rule、generator、validator。生成結果應放在 `output/`，不要放在 `lisp/generated/`。

```text
prompt-universe/
  docs/
    rules/
      prompt-output-format.md
      generation-defaults.md
      source-seed-protection.md
      responsible-prompt-validator.md

    methods/
      noise-reduction-ladder.md
      negative-space-guidance.md
      fusion-evolution.md
      anime-material-override.md

  lisp/
    core/
      schema.lisp
      registry.lisp
      composition-tree.lisp
      compiler.lisp
      formatter.lisp
      evaluator.lisp

    macros/
      prompt-macros.lisp
      section-macros.lisp
      module-macros.lisp
      method-macros.lisp
      evolution-macros.lisp
      expansion-macros.lisp

    generator/
      seed-retrieval.lisp
      seed-control.lisp
      draft-one.lisp
      expand.lisp
      evolve.lisp
      fusion.lisp
      refine.lisp
      expansion-plan.lisp
      batch.lisp
      naming.lisp
      chain.lisp

    validator/
      validator.lisp
      schema-validator.lisp
      drift-validator.lisp
      negative-validator.lisp
      composition-validator.lisp
      anatomy-validator.lisp
      material-validator.lisp
      chain-pollution-validator.lisp
      responsible-prompt-validator.lisp

    ablation/
      chain-ablation.lisp
      seed-ablation.lisp
      mutation-ablation.lisp

    modules/
      identity/
        character.lisp
        prop.lisp
        object.lisp
        place.lisp
        brand.lisp

      subject/
        character-design.lisp
        prop-design.lisp
        environment-design.lisp
        scene-design.lisp
        story-illustration.lisp
        editorial-cover.lisp
        product-concept.lisp

      visual-language/
        anime.lisp
        editorial.lisp
        cinematic.lisp
        storybook.lisp
        fashion.lisp
        game-art.lisp
        concept-art.lisp
        graphic-design.lisp

      composition/
        portrait.lisp
        landscape.lisp
        detail-shot.lisp
        full-body.lisp
        key-visual.lisp
        cover-layout.lisp
        scene-depth.lisp

      color/
        palettes.lisp
        color-moods.lisp
        seasonal.lisp
        contrast.lisp
        gradients.lisp

      lighting/
        daylight.lisp
        night.lisp
        cinematic.lisp
        studio.lisp
        atmospheric.lisp

      material/
        fabric.lisp
        glass.lisp
        metal.lisp
        skin.lisp
        hair.lisp
        food.lisp
        holographic.lisp
        prism.lisp
        translucent.lisp

      narrative/
        emotion.lisp
        relationship.lisp
        tension.lisp
        symbolism.lisp
        scene-premise.lisp
        story-beat.lisp

      constraints/
        negative.lisp
        anatomy.lisp
        anti-3d.lisp
        anti-photography.lisp
        anti-noise.lisp
        style-boundary.lisp

      methods/
        noise-reduction.lisp
        negative-space.lisp
        fusion-evolution.lisp
        material-override.lisp
        semantic-mutate.lisp

    prompts/
      source/
        character-design/
        prop-design/
        scene-design/
        story-illustration/
        editorial-cover/
        detail-shot/
        style-transfer/
        worldbuilding/

      experiments/
        fusion/
        semantic-mutate/
        lighting/
        color/
        composition/
        model-behavior/
        failures/

  output/
    candidates/
    approved/
    variants/
    batches/
    reports/
    logs/
```

## 分層設計

### 0. Lisp DSL 結構層

Lisp 的價值在於 homoiconicity：prompt 可以同時是人類可讀的語法、機器可展開的資料，以及 compiler 可轉換的 AST。這個專案應該使用 Lisp 建立自然、可靠、可驗證的 prompt DSL，而不是用 Python class / dataclass 風格硬套資料結構。

核心原則：

- 使用分層 macro，不使用一個超大 macro。
- 保留既有的 `section + module + method + evolution` 分層。
- 所有 macro 展開結果必須是可檢查的結構化資料。
- `preserve / mutate / forbid` 是安全邊界，macro 不得繞過。
- macro 展開後必須能被 debug、validate、compare、ablation。

推薦分層：

```text
surface syntax
  -> composition tree
  -> section/module/method/evolution forms
  -> normalized prompt AST
  -> compiler output
```

範例方向：

```lisp
(prompt cyber-fairy-red-hood
  (:intent "cyber fairy red hood editorial character design")
  (:seed-control
   (:follow red-hood-cover :weight 0.55)
   (:follow holo-nail-macro :weight 0.20)
   (:forbid-drift :photography :3d :overloaded-neon))
  (:composition-tree
   (cover-layout
    (foreground dessert-table)
    (midground character-half-body)
    (background enchanted-cyber-forest)))
  (:sections
   (identity cyber-fairy-red-hood-identity)
   (visual-language luxury-editorial-anime)
   (material holographic-controlled)
   (methods negative-space-guidance noise-reduction-ladder)))
```

這種 surface syntax 可以由 macro 展開，但展開後必須回到明確的 `defprompt`、section、module、method 與 validator 可讀的資料。

### 0.1 分層 Macro

macro 應該只負責「把自然 DSL 語法展開成標準結構」，不應直接吐最終 prompt 文字。

建議 macro 分層：

```text
prompt macro
  -> 建立 defprompt 骨架

section macro
  -> 建立 section tree

module macro
  -> 注入可重用語義片段

method macro
  -> 注入方法論，例如降噪階梯、負空間引導、材質覆寫

evolution macro
  -> 建立 preserve / mutate / forbid 結構

expansion macro
  -> 建立 batch expansion axes
```

禁止方向：

- 不產生一次包辦 title、style、composition、negative、batch、chain 的超大 macro。
- 不允許 macro 隱式改寫 `preserve / mutate / forbid`。
- 不允許 macro 展開後只剩不可追蹤的文字 prompt。
- 不允許 macro 在未通過 validator 時直接 compile。

### 0.2 Composition Tree

composition tree 用來描述畫面的階層結構，而不是只用一串 composition 關鍵詞。

用途：

- 建立 foreground / midground / background。
- 表示主體、配件、環境、文字與負空間的空間關係。
- 讓 compiler 能把構圖樹轉成 prompt section。
- 讓 validator 檢查構圖是否過載、是否違反主體清晰度。

範例：

```lisp
(defcomposition-tree editorial-cover-depth
  (:layout vertical-cover)
  (:foreground dessert-table :priority high)
  (:midground character-half-body :priority high)
  (:background enchanted-forest :priority medium)
  (:typography masthead-behind-character :priority high)
  (:negative-space upper-quarter :priority high))
```

### 0.3 Seed Control

seed control 用來管理「follow 哪些成功咒語、follow 到什麼程度、避免哪些漂移」。

用途：

- 讓 Draft One 有明確參考來源。
- 讓 batch expansion 不會脫離 canonical seed。
- 讓 fusion 有權重，而不是硬混。
- 讓 validator 可檢查 seed drift。

範例：

```lisp
(defseed-control cyber-fairy-red-hood-seed-control
  (:follow
   (red-hood-cover :weight 0.60 :use (:editorial-hierarchy :character-identity))
   (holo-nail-macro :weight 0.20 :use (:holographic-material-control))
   (strawberry-jelly :weight 0.10 :use (:prop-readability)))
  (:preserve
   :anime-illustration-priority
   :negative-boundary
   :composition-clarity)
  (:forbid-drift
   :photography
   :3d
   :overloaded-neon
   :seed-identity-collapse))
```

### 0.4 Prompt Chain

prompt chain 用來描述多步驟轉換，例如：

```text
concept
  -> seed retrieval
  -> draft one
  -> refine
  -> style transfer
  -> expansion plan
  -> batch generation
```

chain 必須分層且可中斷，不應讓每一步累積污染後直接進入量產。

規則：

- 每個 chain step 必須有輸入、輸出、preserve、mutate、forbid。
- 每個 step 後都可以 validate。
- 高風險 chain 必須進入 Proposal Review 或 Human Review Gate。
- chain 累積污染目前難以可靠驗證，因此需要 ablation 實驗。

範例：

```lisp
(defprompt-chain cyber-fairy-red-hood-chain
  (:step interpret
   :output propose-change)
  (:step retrieve-seeds
   :preserve (:semantic-tags :risk-tags)
   :output seed-report)
  (:step draft-one
   :preserve (:seed-control :negative-boundary)
   :output defprompt-draft)
  (:step compile-one
   :validate t
   :stop-for-review t)
  (:step batch-expansion
   :requires-approved-source t
   :output variants))
```

### 0.5 Ablation

chain 累積污染需要實驗才能驗證。早期應把 ablation 設計進系統，而不是等到大量失敗後才補。

可測項：

- 移除某個 seed 後，prompt 是否仍穩定。
- 移除某個 method 後，噪音是否上升。
- 改變 seed weight 後，identity 是否漂移。
- 增加 chain step 後，forbid 是否失效。
- expansion axes 數量增加後，validator reject rate 是否上升。

輸出應放：

```text
output/reports/
output/logs/
```

### 1. Markdown 方法論層

`.md` 用來記錄人類可讀的方法論、實驗觀察與設計原則。

適合放：

- 降噪階梯
- 負空間引導
- 融合演化
- 材質覆寫
- 風格邊界
- 失敗案例分析
- 成功 prompt 拆解

範例：

```md
# 降噪階梯

目的：逐層降低模型產生錯誤細節的機率。

層級：
1. 主體明確化
2. 材質優先級
3. 構圖約束
4. 渲染語言覆寫
5. 負面詞邊界
```

### 2. Lisp 資料層

Lisp 用來表示可組合的 prompt section。

範例：

```lisp
(defprompt strawberry-jelly
  :intent "premium dessert prop showcase, innocent sweet aesthetic"
  :semantic-tags '(:cute :edible :collectible :strawberry :prop-focused)
  :risk-tags '(:photography-drift :realistic-refraction-drift :overdecorated-risk)

  (:format "Horizontal 16:9 anime key visual composition")
  (:title "Licca Bobo")
  (:subtitle "Fresh Strawberry Jelly")
  (:description-design "ADI-601 | Anime Prop Collection")

  (:color-theme
   "soft strawberry pink"
   "warm ivory"
   "dusty mint green"
   "deep berry red"
   "champagne gold"
   "cyan-magenta prism accents")

  (:primary
   anime-prop-base
   collectible-item-artwork
   high-silhouette-readability)

  (:subject strawberry-jelly-subject)
  (:composition jelly-showcase-composition)
  (:negative no-photography no-3d no-realistic-refraction no-clutter))
```

### 2.1 Schema 語義欄位

`defprompt` 與 `defevolution` 都應該支援語義欄位，讓 AI 可以搜尋、比對、選擇演化規則與執行 validator。

建議欄位：

```lisp
:intent
:semantic-tags
:risk-tags
```

欄位用途：

- `:intent`：自然語言摘要，描述 prompt 或 evolution 的核心目的。
- `:semantic-tags`：機器可讀分類，用於 Loop 0 語義轉結構、檢索、比對與 rule selection。
- `:risk-tags`：可能漂移方向或生成風險，用於 validator 與演化前檢查。

`defprompt` 範例：

```lisp
(defprompt strawberry-jelly
  :intent "premium dessert prop showcase, innocent sweet aesthetic"
  :semantic-tags '(:cute :edible :collectible :strawberry :prop-focused)
  :risk-tags '(:photography-drift :realistic-refraction-drift :overdecorated-risk)

  (:format "Horizontal 16:9 anime key visual composition")
  (:title "Licca Bobo")
  (:subtitle "Fresh Strawberry Jelly")
  ...)
```

`defevolution` 範例：

```lisp
(defevolution mood-lighting-variant
  :intent "shift mood and lighting while preserving subject identity and rendering language"
  :semantic-tags '(:mood-shift :lighting-mutation :preserve-subject :low-risk)
  :risk-tags '(:overpowering-prism-risk :background-drift-risk)

  (:preserve
   :subject
   :composition-logic
   :rendering-language
   :negative-boundary)

  (:mutate
   :color-theme
   :mood
   :lighting
   :holo-accents))
```

Loop 0 應該優先使用 `:intent` 與 `:semantic-tags` 選擇候選 prompt、module、method、evolution rule；validator 應該使用 `:risk-tags` 決定額外檢查項。

### 3. 模組層

模組是可重用語義片段。

範例：

```lisp
(defmodule anime-prop-base
  (:primary
   "2D anime prop illustration"
   "anime collectible item artwork"
   "anime visual-novel object design"
   "anime game-item illustration"
   "anime merchandise illustration"
   "high silhouette readability"
   "elegant prop design language"))

(defmodule illustration-first-quality
  (:quality
   "anime character illustration quality"
   "anime prop illustration quality"
   "99% illustration aesthetics"
   "1% material aesthetics"
   "visible anime brush texture"
   "smooth cel-shaded shadows"
   "large clean color regions"
   "illustration-first rendering"
   "non-3D anime illustration finish"))
```

負面詞也應該模組化：

```lisp
(defmodule no-3d
  (:negative
   "CGI rendering"
   "3D render"
   "3D asset look"
   "octane render"
   "blender render"
   "cinema4d render"
   "unreal engine"
   "physically based rendering"))

(defmodule no-photography
  (:negative
   "food photography"
   "commercial dessert photography"
   "product photography"
   "photorealistic rendering"))

(defmodule no-realistic-transparent-material
  (:negative
   "realistic glass rendering"
   "realistic refraction"
   "crystal sculpture appearance"
   "gemstone appearance"
   "acrylic appearance"
   "hard transparent plastic appearance"))
```

### 4. 方法論層

方法論不只是文字，也應該能被 Lisp 掛載與注入。

```lisp
(defmethod noise-reduction-ladder
  (:priority-order
   :identity
   :format
   :subject
   :composition
   :material-override
   :quality
   :negative)

  (:inject
   (:quality
    "clean illustration hierarchy"
    "controlled micro-detail density"
    "large smooth visual regions"
    "stable edge clarity")

   (:negative
    "high-frequency texture noise"
    "fragmented rendering"
    "over-rendered detail")))
```

```lisp
(defmethod negative-space-guidance
  (:inject
   (:negative-space-guidance
    "large clean typography area"
    "controlled empty-space breathing"
    "clean spatial separation"
    "premium poster layout"
    "strong focal hierarchy")))
```

```lisp
(defmethod anime-material-override
  (:inject
   (:anime-material-override
    "same rendering language as anime character artwork"
    "same rendering language as anime costume rendering"
    "illustration design is primary"
    "material realism is secondary"
    "anime object rendering priority")))
```

### 5. Macro 層

Macro 用來把自然、可讀的 DSL 語法展開成標準 Lisp 結構。這一層的價值很高，但必須保持分層：macro 只做結構展開，不直接輸出最終 prompt，也不包辦所有責任。

錯誤方向：

```lisp
;; 不推薦：單一超大 macro 一次處理所有 prompt、風格、演化、batch。
(defmacro giant-prompt-system (...) ...)
```

推薦方向：

```lisp
(defmacro prompt
  (name &body body)
  ;; surface syntax -> normalized defprompt AST
  ...)

(defmacro composition-tree
  (&body nodes)
  ;; visual hierarchy -> composition AST
  ...)

(defmacro use-modules
  (&rest modules)
  ;; module refs -> normalized section injections
  ...)

(defmacro use-methods
  (&rest methods)
  ;; method refs -> method injection plan
  ...)

(defmacro expansion-plan
  (name &body axes)
  ;; readable expansion DSL -> defexpansion-plan
  ...)
```

使用方式：

```lisp
(prompt strawberry-jelly
  (:intent "premium dessert prop showcase, innocent sweet aesthetic")
  (:semantic-tags :cute :edible :collectible :strawberry :prop-focused)

  (composition-tree
    (foreground ceramic-dessert-plate)
    (subject strawberry-jelly :priority high)
    (accent gold-dessert-spoon)
    (negative-space typography-area))

  (use-modules
    anime-prop-base
    painted-jelly-material
    strawberry-palette)

  (use-methods
    noise-reduction-ladder
    negative-space-guidance
    anime-material-override)

  (:preserve
   :anime-illustration-priority
   :prop-readability
   :negative-boundary)

  (:forbid
   no-3d
   no-photography
   no-realistic-transparent-material))
```

展開後應回到標準結構，例如 `defprompt` + normalized sections + module refs + method refs。compiler 和 validator 只吃標準結構，不直接吃不透明 macro。

## 演化規則

演化規則的重點是定義哪些能變、哪些不能變、哪些禁止出現。

### Flavor Variant

```lisp
(defevolution flavor-variant
  :intent "create flavor-based variants while preserving anime prop identity and rendering boundaries"
  :semantic-tags '(:flavor-mutation :prop-focused :low-risk :preserve-composition)
  :risk-tags '(:photography-drift :material-realism-drift)

  (:preserve
   :format
   :rendering-language
   :composition-logic
   :negative-boundary)

  (:mutate
   :flavor
   :color-theme
   :garnish
   :internal-ingredients
   :subtitle)

  (:forbid
   "photography"
   "3D render"
   "realistic refraction"
   "cluttered tabletop"))
```

### Fusion Evolution

```lisp
(defevolution fusion-evolution
  :intent "merge two prompt identities while preserving rendering priority and clean hierarchy"
  :semantic-tags '(:fusion :cross-theme :medium-risk :requires-validation)
  :risk-tags '(:identity-drift :composition-overload :style-conflict)

  (:source-a anime-prop-jelly)
  (:source-b luxury-magazine-cover)

  (:extract-from-a
   :material-logic
   :object-readability
   :prop-showcase-composition)

  (:extract-from-b
   :typography
   :editorial-hierarchy
   :luxury-cover-depth)

  (:preserve
   :anime-illustration-priority
   :negative-boundary
   :clean-hierarchy)

  (:output-kind "luxury anime prop magazine cover"))
```

### 語義導向 Mutate

`defevolution` 應該支援語義導向 mutate，讓 `evolve-prompt` 不只知道「哪些 section 可以變」，也知道「往哪個語義方向變」。

核心欄位：

```lisp
(:trigger-semantic ...)
(:mutate ...)
(:preserve ...)
(:forbid ...)
```

`(:trigger-semantic ...)` 用來讓 Loop 0 或 `evolve-prompt` 根據自然語言意圖選擇合適的 evolution rule。

範例：

```lisp
(defevolution luxury-night-dream
  :intent "shift a prompt toward luxurious dreamy night atmosphere"
  :semantic-tags '(:luxury :dreamy :night :mood-shift :lighting-mutation)
  :risk-tags '(:overdark-risk :neon-overload-risk :identity-drift)

  (:trigger-semantic
   "more luxurious"
   "dreamy"
   "night atmosphere")

  (:mutate
   (:color-theme
    (add "deep midnight purple"
         "neon prism accents"
         "champagne gold highlights")
    (reduce "bright daylight tones"))

   (:lighting
    (replace "soft afternoon sunlight"
             "soft dramatic moonlight with localized holo reflections"))

   (:emotion
    (set "ethereal mysterious elegance")))

  (:preserve
   :anime-illustration-priority
   :prop-readability
   :negative-boundary)

  (:forbid
   "bright daylight"
   "cute innocent"
   "nightclub photography"
   "3D neon render"))
```

建議支援的 mutate operations：

```lisp
(add ...)
(remove ...)
(reduce ...)
(replace old new)
(set ...)
(soften ...)
(intensify ...)
(localize ...)
```

語義導向 evolve 流程：

```text
natural language intent
  -> match :trigger-semantic / :semantic-tags
  -> select evolution rule
  -> apply semantic mutate operations
  -> preserve required sections
  -> reject forbid terms
  -> compile
  -> validate
```

## Prompt Compiler

compiler 負責把 Lisp 結構展開成最終咒語。

目標輸出格式先維持目前習慣：

```text
Give me a picture.
Horizontal 16:9 anime key visual composition.

TITLE ONLY:
{{Licca Bobo}}

SUBTITLE ONLY:
{{Fresh Strawberry Jelly}}

COLOR THEME:
{{soft strawberry pink, warm ivory, dusty mint green}}

PRIMARY:
2D anime prop illustration, anime collectible item artwork...
```

後續可再支援 JSON：

```json
{
  "format": "Horizontal 16:9 anime key visual composition",
  "title": "Licca Bobo",
  "subtitle": "Fresh Strawberry Jelly",
  "sections": {
    "PRIMARY": [],
    "NEGATIVE": []
  }
}
```

## AI Loop 設計

AI 不直接自由寫 prompt，而是先判斷目前任務屬於 Semantic Interpreter 還是 Loop Executor。

若使用者輸入是自然語言方向，流程是：

```text
自然語言指令
  -> Semantic Interpreter
  -> 結構化變更建議
  -> Lisp 結構新增或修改
  -> Loop Executor
  -> compiler
  -> validator
  -> 最終 prompt
```

若使用者輸入是明確 loop 指令，流程是：

```text
loop 指令
  -> Loop Executor
  -> 讀取 schema / module / method / evolution
  -> 執行 preserve / mutate / forbid
  -> compiler
  -> validator
  -> 最終 prompt
```

任何情況下，AI 都不應該跳過 Lisp 結構直接輸出最終 prompt。

### Loop 0: Interpret & Propose

用途：把人類自然語言指令轉成可審查、可執行的 Lisp 結構變更提案。

這是所有創意型操作的入口。它不直接生成最終 prompt，而是把模糊語感翻譯成 semantic dimensions、module 變更、section mutation、evolution rule 與 validator 約束。

輸入範例：

```text
把 strawberry jelly 變得更奢華夢幻一點，帶點夜店氛圍。
做一個 cyber-fairy red hood 版本。
讓 nail macro 更有未來感與科技感。
```

流程：

```text
讀取人類自然語言指令
理解意圖、主體、風格、情緒、材質、場景與風險
列出要改變的 semantic dimensions
把 semantic dimensions 對應到 Lisp sections
提出新 module 或現有 module 的 mutate 內容
提出要使用的 evolution rule
提出需要新增的 method
列出 preserve / mutate / forbid
產生 structured change proposal
輸出 Proposal Review
等待人工確認、yes、確認，或使用 auto-approve
呼叫 evolve-prompt / fusion / refine / expand
執行 compiler
執行 validator
輸出最終 prompt 或變體集合
```

### Proposal Review

每次 Loop 0: Interpret & Propose 後，AI 必須停在 Proposal Review。除非使用者回覆 `yes`、`確認`，或已明確啟用 `auto-approve`，否則不能執行 `evolve-prompt`、`fusion`、`refine`、`expand`、`compile`，也不能輸出完整最終 prompt。

如果提案包含新增 module、修改 method、schema change 或 fusion evolution，預設必須 manual approval。

建議固定 semantic dimensions：

```lisp
(defsemantic-dimensions
  :color
  :mood
  :theme
  :subject
  :material
  :lighting
  :composition
  :camera
  :typography
  :rendering-language
  :negative-space
  :noise-control
  :symbolism
  :accessory
  :environment
  :emotional-state
  :risk-boundary)
```

結構化提案範例：

```lisp
(propose-change strawberry-jelly
  (:intent "make the jelly more luxurious and dreamy with subtle nightclub atmosphere")

  (:semantic-dimensions
   (:color mutate)
   (:mood mutate)
   (:lighting mutate)
   (:material preserve)
   (:composition preserve)
   (:negative-boundary preserve))

  (:add-modules
   luxury-night-prism-lighting
   dreamy-lounge-dessert-mood)

  (:mutate-sections
   :color-theme
   :lighting
   :holo-accents
   :tabletop-styling)

  (:preserve-sections
   :primary
   :jelly-appearance
   :anime-material-override
   :composition
   :negative)

  (:forbid
   "nightclub photography"
   "realistic cocktail lounge"
   "cyberpunk city background"
   "3D neon glass"
   "overpowering rainbow effects")

  (:next-loop evolve-prompt)
  (:evolution-rule mood-lighting-variant)
  (:approval-mode manual))
```

Proposal Review 輸出格式：

```md
### 語義分析
指令：「把 strawberry jelly 變得更奢華夢幻一點，帶點夜店氛圍」
理解為：改變色彩方向、增加 luxury night / dreamy lounge 氛圍、保留 anime prop identity 與 jelly material readability

### 建議結構變更
- source prompt: strawberry-jelly
- 新 module: luxury-night-prism-lighting
- 新 module: dreamy-lounge-dessert-mood
- mutate color-theme: add deep midnight purple, neon prism accents, champagne gold highlights
- mutate lighting: replace soft afternoon sunlight with soft dramatic moonlight and localized holo reflections
- 使用 evolution: luxury-night-dream
- preserve: :primary, :jelly-appearance, :anime-material-override, :composition, :negative
- forbid: 3D render, product photography, realistic glass, cyberpunk city background, excessive neon clutter
- 預估風險：可能過度夜店化、prism 過量、偏離 handcrafted dessert prop

### Semantic Dimensions
- :color mutate
- :mood mutate
- :lighting mutate
- :material preserve
- :composition preserve
- :negative-boundary preserve

### Lisp Proposal
(propose-change strawberry-jelly
  (:intent "make the jelly more luxurious and dreamy with subtle nightclub atmosphere")
  (:semantic-dimensions
   (:color mutate)
   (:mood mutate)
   (:lighting mutate)
   (:material preserve)
   (:composition preserve)
   (:negative-boundary preserve))
  (:add-modules luxury-night-prism-lighting dreamy-lounge-dessert-mood)
  (:mutate-sections :color-theme :lighting :holo-accents :tabletop-styling)
  (:preserve-sections :primary :jelly-appearance :anime-material-override :composition :negative)
  (:forbid "3D render" "product photography" "realistic glass" "cyberpunk city background")
  (:next-loop evolve-prompt)
  (:evolution-rule luxury-night-dream)
  (:approval-mode manual))

### 下一步
要我直接執行：
(evolve-prompt 'strawberry-jelly 'luxury-night-dream :count 8)
嗎？
```

確認模式：

```lisp
(:approval-mode manual)
(:approval-mode auto)
```

`manual` 適合重要風格、第一次建立模組、融合演化。`auto` 適合批量產生變體，但仍然必須經過 validator。

### Loop 1: Seed Retrieve

用途：從 curated seed library 找出可 follow 的成功咒語範本。

流程：

```text
讀取 Loop 0 的 semantic dimensions
讀取 :intent / :semantic-tags / :risk-tags
搜尋 prompts/source/
挑選 3-5 個相似 seed
列出可重用 section / module / method / risk boundary
輸出 seed retrieval report
```

輸入範例：

```lisp
(select-seeds
  :intent "cyber fairy red hood"
  :semantic-tags '(:character-design :fairytale :cyber :editorial)
  :limit 5)
```

### Loop 2: Draft One

用途：根據概念、Proposal Review 與 retrieved seeds，產生 1 個 Lisp prompt draft。

流程：

```text
讀取 approved proposal
讀取 retrieved seeds
抽取可 follow 的 section hierarchy
抽取可重用 modules
產生 1 個 defprompt draft
執行 schema validator
```

輸出應是 Lisp，不是最終 prompt 文字。

### Loop 3: Compile One

用途：把 1 個 Lisp prompt draft 編譯成 1 個新咒語，供人工檢驗。

流程：

```text
讀取 defprompt draft
compile-prompt
validate
輸出 output/candidates/
stop
等待人工檢驗
```

### Loop 4: Human Review Gate

用途：在量產前強制停下，讓使用者確認 canonical prompt 是否成立。

規則：

```text
如果使用者沒有說 ok / yes / 確認 / auto-approve
  -> 不得進入 macro expansion
  -> 不得 batch generate
```

### Loop 5: Macro Expansion Plan

用途：使用者確認 canonical prompt 後，定義 1000 個咒語如何被展開。

流程：

```text
讀取 approved canonical prompt
定義 expansion axes
計算組合數量
定義 preserve / forbid / risk-tags
產生 defexpansion-plan
等待確認或 auto-approve
```

範例：

```lisp
(defexpansion-plan luxury-dessert-props-1000
  (:source strawberry-jelly-approved-v1)
  (:axes
   (:flavor 25)
   (:palette 10)
   (:lighting 5)
   (:garnish 4)
   (:composition 2))
  (:preserve
   :anime-illustration-priority
   :prop-readability
   :negative-boundary
   :material-logic)
  (:forbid
   "photography"
   "3D render"
   "realistic refraction"
   "cluttered tabletop"))
```

### Loop 6: Batch Generate

用途：根據 approved expansion plan 產生大量受控咒語。

流程：

```text
讀取 defexpansion-plan
生成 Lisp variants
執行 validator
compile passing variants
輸出 output/batches/
輸出 output/variants/
輸出 output/reports/
```

### Loop 7: Expand

用途：根據既有 prompt 產生受控變體。

流程：

```text
讀取 source prompt
讀取指定 evolution rule
檢查 preserve / mutate / forbid
產生 N 個變體
輸出到 output/variants/
產生變體摘要表
```

指令範例：

```text
用 strawberry-jelly 做 12 個 flavor-variant，保留 anime prop collection，不要偏向攝影或 3D。
```

### Loop 8: Evolve

用途：根據 evolution rule 產生受控變體。

流程：

```text
讀取 source prompt
讀取 evolution rule
確認 preserve / mutate / forbid
套用 mutation
產生 N 個變體
compile
validate
輸出變體與摘要表
```

### Loop 9: Fusion

用途：融合兩個 prompt 的特徵。

流程：

```text
讀取 source A
讀取 source B
抽取 A 的保留特徵
抽取 B 的可融合特徵
套用 fusion-evolution
產生 3-5 個融合方向
每個方向再展開 3 個 prompt
compile
validate
```

### Loop 10: Refine

用途：對已生成 prompt 做收斂與修正。

適合指令：

```text
降低材質真實感
增加負空間
減少配件密度
強化 anime prop identity
修正手部風險
把 prism 效果限制在局部
```

### Loop 11: Validate

用途：檢查 prompt 是否違反風格邊界。

檢查項：

- 是否缺少 format / title / subject / composition / negative
- 是否引入 forbidden terms
- 是否破壞 rendering priority
- 是否缺少負空間或降噪約束
- 是否出現攝影、3D、真實材質偏移

### Loop 12: Compare

用途：比較多個 prompt 變體。

輸出：

- 變體名稱
- 主體變化
- 色彩變化
- 構圖變化
- 風險
- 是否保留原方法論
- 推薦分數

## 最小可行版本

第一版只需要實作一條乾淨路徑：

```text
1. defprompt
2. param
3. validate-prompt
4. compile-prompt
5. compile-prompt-to-file
6. output/candidates/
```

先完成這個能力：

```text
手寫 Lisp defprompt -> validator -> compiler -> output/candidates/UPPERCASE-NAME.md
```

第二階段才加入 `interpret-request`、`select-seeds`、`draft-one`。第三階段才加入 `defexpansion-plan`、`batch-generate`、prompt chain 與 1000 variants。

## MVP 工作順序

1. 建立 `docs/methods/`，把降噪階梯、負空間引導、融合演化寫成方法論文件。
2. 建立 `lisp/core/schema.lisp`，先定義 `defprompt`、`param`、section、`:intent`、`:semantic-tags`、`:risk-tags`。
3. 建立 `lisp/core/formatter.lisp`，負責 uppercase headings、`{{}}` parameter rendering、uppercase prompt filename。
4. 建立 `lisp/core/defaults.lisp`，保存 1 candidate / 10 final variants 的預設值。
5. 使用第一個 source prompt：`prompts/source/prop-design/GOLDEN-MANGO-JELLY.md`，作為測試案例而不是架構中心。
6. 建立第一批 curated seeds：`prop-design`、`editorial-cover`、`detail-shot`，並補上 `:intent`、`:semantic-tags`、`:risk-tags`。
7. 寫出第一版 `compile-prompt`，能輸出 `.md` 到 `output/candidates/`。
8. 寫出第一版 `lisp/validator/validator.lisp`，先檢查 schema、section heading、基本 responsible phrases。
9. 對 `prompts/source/` 跑第一份 responsible audit，輸出 `output/reports/source-responsible-audit.md`，只報告不修改 source。
10. 建立 smoke test，驗證手寫 Lisp prompt 能編譯到 `output/candidates/`。
11. 第二階段再寫 `interpret-request`、`seed-retrieval`、`draft-one`。
12. 第三階段再寫 `expansion-plan`、`batch`、語義導向 mutate、fusion evolution。

## 設計原則

- Prompt 必須可拆解、可重組、可驗證。
- AI 操作結構，不直接操作一大段最終文字。
- AI 的創意角色只能產生結構化變更建議，不能跳過 Lisp 結構。
- 所有最終 prompt 都必須由 compiler 產生，並經過 validator。
- 方法論需要同時有人類說明與機器規則。
- 負面詞是風格邊界，應該模組化。
- 演化必須受控，必須明確定義 preserve、mutate、forbid。
- 不能從一句概念直接跳到 1000 個咒語；必須先建立 1 個 canonical prompt，經人工確認後再量產。
- 1000 個咒語必須由 macro expansion plan 展開，不由 AI 自由撰寫。
- 第一版以簡單可用為主，不急著建立完整代理系統。
- loop 早期應該保留人工挑選節點，避免 prompt 漂移。

## 短期目標

建立一個可手動執行的 minimal compiler pipeline。

輸入：

```lisp
(load "lisp/examples/golden-mango-candidate.lisp")
(compile-prompt-to-file 'golden-mango-jelly-candidate)
```

輸出：

```text
output/candidates/GOLDEN-MANGO-JELLY-CANDIDATE.md
```

接著停下等待人工確認。

確認後支援：

```lisp
(defexpansion-plan cyber-fairy-red-hood-1000
  (:source cyber-fairy-red-hood-approved-v1)
  (:axes
   (:palette 10)
   (:outfit 10)
   (:lighting 5)
   (:accessory 5)
   (:composition 4)))

(batch-generate 'cyber-fairy-red-hood-1000)
```

輸出：

```text
output/variants/cyber-fairy-red-hood-v001.md
output/variants/cyber-fairy-red-hood-v002.md
output/variants/cyber-fairy-red-hood-v003.md
...
output/batches/cyber-fairy-red-hood-1000/
output/reports/cyber-fairy-red-hood-1000-report.md
```

## 長期目標

逐步形成一套公開的 prompt 語言（非商用，見 `LICENSE`）：

```text
Prompt Universe Lisp DSL
```

長期能力：

- prompt 模組庫
- curated seed prompt library
- 方法論知識庫
- 自然語言到 Lisp 結構的語義轉譯
- `:intent` / `:semantic-tags` / `:risk-tags` 語義索引
- seed retrieval
- canonical prompt creation
- human review gate
- macro expansion plan
- batch generation for 1000+ controlled variants
- 受控演化 loop
- 風格 validator
- 變體比較器
- 自動分類與命名
- 生成結果回填
- 成功案例反向萃取模組
- 不同模型或生圖工具的輸出格式轉換
