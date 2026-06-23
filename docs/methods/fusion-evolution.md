# 融合演化（Fusion Evolution）

## 目的

合併兩個（或多個）prompt 身份的特徵——例如 prop + editorial cover、角色 + 場景文明、服裝 + 背景幾何——同時**保留渲染優先級、層級清晰度與解剖穩定**。融合是結構性抽取與對齊，不是把所有關鍵字攪在一起。

## 核心原則

- **先抽取再合併**：明確 `extract-from-a` / `extract-from-b`，禁止無差別混合。
- **preserve 優先於 mutate**：渲染語言、negative boundary、composition clarity 先鎖住。
- **區分融合類型**：語義融合、圖形融合、架構融合、材質融合——類型錯了會直接變形。
- **融合後必須降噪**：跨主題融合最易過載，需重建 noise-reduction-ladder 與 negative-space-guidance。

## 融合類型（從 source 歸納）

| 類型 | 說明 | Source 範例 |
|------|------|-------------|
| 語義/概念融合 | A 的概念映射到 B 的領域 | AI-CIVILIZATION：technology → architecture |
| 圖形設計融合 | 色彩、形狀、節奏對齊，非物理變形 | KUNG-FU：outfit prism ↔ background geometry |
| 跨媒材編輯融合 | prop 邏輯 + magazine hierarchy | prompt-loop-plan：jelly + luxury cover |
| 生物/場景整合 | creature 融入構圖而非貼紙 | PRISM-GOLDFISH：goldfish integrated into composition |
| 光效演化融合 | lightflow 作為次要 accent 演化 | EMERALD-JADE：calm optical river systems |

## 專屬 Section

融合相關 seed 常使用：

```text
EVOLUTION STRATEGY:
...

FUSION:
...

DESIGN EVOLUTION STRATEGY:   ; 圖形融合專用
...
```

## Source Seed 參考

### `prompts/source/evolution-fusion/AI-CIVILIZATIONcivilization-square.md`

語義融合 + 大場景負空間：

```text
EVOLUTION STRATEGY:
technology evolves into architecture, servers evolve into monuments,
network systems evolve into city planning, human collaboration evolves into spatial geometry,
machine infrastructure evolves into cultural landscape,
engineering transforms into civilization aesthetics

FUSION:
server chassis blended with architectural towers, circuit diagrams blended with city roads,
human collaboration blended with constellation networks,
technology blended with cultural symbolism,
infrastructure blended with monumental urban planning

SCENE:
vast AI civilization plaza, ... large negative-space composition, civilization-scale visual design
```

要點：用「evolves into / blended with」描述映射關係；場景保留 large negative-space。

### `prompts/source/evolution-strategy/KUNG-FU.md`

圖形設計融合（禁止物理變形）：

```text
DESIGN EVOLUTION STRATEGY:
evolve the graphic design language, not the body,
background and outfit remain separate objects,
but share the same prism geometry language,
background color blocks visually echo the clothing prism panels,
transparent outfit layers align with background diagonal shapes,
... the fusion exists in color, shape, rhythm, and composition,
the fusion is graphic design fusion, not physical mutation,
not organic transformation, not material melting,
not liquid clothing, not liquid anatomy, not body deformation
```

要點：明確寫出 **what fuses**（color, shape, rhythm）與 **what must not fuse**（body, liquid anatomy）。

### `prompts/source/evolution-strategy/PRISM-GOLDFISH.md`

主體與元素整合式演化：

```text
EVOLUTION STRATEGY:
large-scale geometric simplification, single dominant design gesture,
goldfish integrated into composition rather than decoration,
editorial design first, special effects second,
negative-space driven composition

COMPOSITION:
strict rule-of-thirds layout, ... single dominant diagonal structure
```

要點：integrated into composition rather than decoration——避免融合變成貼圖裝飾。

### `prompts/source/noise-reduction-ladder/EMERALD-JADE.md`

光效演化（低風險 accent 融合）：

```text
EVOLUTION STRATEGY:
lightflow evolves as calm optical river systems,
spectral currents move like moonlit flowing memory,
beauty survives through restrained optical serenity,
noise is reduced through broad mineral surfaces and controlled glow behavior
```

要點：演化敘事同時宣告降噪策略。

### `prompts/source/evolution-strategy/AFTERNOON-TEA.md`

服裝邏輯軟演化（非跨 prompt 融合，但屬 evolution strategy 範本）：

```text
EVOLUTION STRATEGY:
fashion evolves by softening its original protective logic,
clothing becomes an elegant framing structure instead of full concealment,
beauty emerges through silhouette exposure rather than decoration,
... controlled negative space, suppressed decorative clutter
```

## 融合流程（建議）

```text
1. 鎖定 source A / source B（或 seed-control 權重）
2. 列出 extract-from-a / extract-from-b
3. 宣告 fusion type（semantic / graphic / editorial / creature-integration）
4. 寫 EVOLUTION STRATEGY 或 FUSION 敘事（用 evolves into / blended with / integrated into）
5. preserve：rendering-language, anatomy, negative-boundary, composition-clarity
6. forbid：物理變形、液體化、材質衝突、過載裝飾
7. 套用 noise-reduction-ladder + negative-space-guidance
8. validate → compile
```

## 常用語彙（可直接複用）

### 語義映射

```text
{{concept-a}} evolves into {{concept-b}},
{{object-a}} blended with {{object-b}},
{{theme-a}} transforms into {{theme-b}} aesthetics
```

### 圖形融合

```text
share the same {{geometry}} language,
background color blocks visually echo the clothing panels,
the fusion exists in color, shape, rhythm, and composition,
graphic design fusion, not physical mutation
```

### 整合式構圖

```text
{{element}} integrated into composition rather than decoration,
editorial design first, special effects second,
single dominant design gesture
```

### 禁止語義（建議寫入 forbid / NEGATIVE）

```text
not physical mutation, not organic transformation, not material melting,
not liquid clothing, not liquid anatomy, not body deformation,
not crystal armor, identity drift, composition overload, style conflict
```

## preserve / mutate / forbid 建議

### 建議 preserve

```text
:anime-illustration-priority
:correct-five-finger-anatomy
:negative-boundary
:composition-clarity
:rendering-language
:prop-readability          ; prop 相關融合
:editorial-hierarchy       ; cover 相關融合
```

### 常見 mutate

```text
:color-theme
:scene
:outfit-design
:background
:creature
:evolution-strategy narrative
:typography hierarchy
```

### 常見 forbid

```text
photography, 3D render, photorealistic,
body mutation, liquid anatomy, crowded composition,
micro-detail overload, chaotic glow, identity collapse
```

## 失敗模式

| 症狀 | 常見原因 | 修正方向 |
|------|----------|----------|
| 關鍵字大雜燴 | 缺 extract 邊界 | 重寫 extract-from-a/b，刪冗餘 section |
| 角色身體變形 | 圖形融合寫成物理融合 | 參考 KUNG-FU forbid 整段 |
| 場景擠滿元素 | 缺 negative space | 補 civilization-scale 或 rule-of-thirds 留白 |
| 風格一半 2D 一半 3D | 未 preserve rendering-language | 強制 anime-material-override |
| 裝飾貼滿畫面 | creature/prop 未 integrated | 改 `integrated into composition rather than decoration` |

## 與 prompt-loop-plan 的對照

計畫中的 cross-theme 融合範例：

```lisp
(defevolution fusion-evolution
  :intent "merge two prompt identities while preserving rendering priority and clean hierarchy"
  (:source-a anime-prop-jelly)
  (:source-b luxury-magazine-cover)
  (:extract-from-a :material-logic :object-readability :prop-showcase-composition)
  (:extract-from-b :typography :editorial-hierarchy :luxury-cover-depth)
  (:preserve :anime-illustration-priority :negative-boundary :clean-hierarchy))
```

人類文件層應能把上述結構對應到：

- A = `GOLDEN-MANGO-JELLY` 的 prop/material/composition 邏輯
- B = `SNOW-WHITE` 的 masthead / cover lines / foreground showcase hierarchy

## 未來 Lisp 掛載方向

```lisp
(defmethod fusion-evolution
  (:requires
   :source-a :source-b :fusion-type :preserve :forbid)

  (:fusion-types
   :semantic-map
   :graphic-design
   :editorial-cross
   :creature-integration
   :accent-evolution)

  (:inject-template
   (:evolution-strategy
    "{{source-a-concept}} evolves into {{source-b-domain}}")
   (:fusion
    "{{feature-a}} blended with {{feature-b}}")))

(defevolution fusion-evolution
  :intent "merge two prompt identities while preserving rendering priority"
  :semantic-tags '(:fusion :cross-theme :medium-risk :requires-validation)
  :risk-tags '(:identity-drift :composition-overload :style-conflict)
  (:preserve :anime-illustration-priority :negative-boundary :clean-hierarchy))
```

## 使用時機

- 使用者要求「把 A 和 B 合在一起」「cyber + fairytale」「prop + magazine cover」。
- Loop 9 Fusion 或 `defseed-control` 多 seed 權重組合時。
- 演化後出現身份漂移、構圖過載、風格衝突時——回頭檢查 fusion type 是否選錯。