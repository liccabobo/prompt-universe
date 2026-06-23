# 降噪階梯（Noise Reduction Ladder）

## 目的

逐層降低模型產生錯誤細節、高頻噪點、材質碎裂與解剖漂移的機率。不是單靠 NEGATIVE 事後壓制，而是在 PRIMARY → SECONDARY → TERTIARY → QUATERNARY → QUALITY 各層提前建立**低頻、可讀、穩定**的視覺優先級。

## 核心原則

- **頻率優先於細節**：先鎖主體與大形，再允許局部材質與光效。
- **層級遞減**：越往後的 tier 越次要；光效、prism、holo 應收斂到 QUATERNARY 或專屬 accent section。
- **QUALITY 是總閘門**：在 NEGATIVE 之前，用明確的渲染語言壓制高頻碎裂。
- **與 NEGATIVE 搭配**：降噪階梯管「正向引導」，NEGATIVE 管「邊界拒絕」。

## 五層結構

對應 `docs/context/philosophy/structured-prompt-design.md` 與 source seed 的實際 section 分層：

| 層級 | Section | 職責 | 優先鎖定 |
|------|---------|------|----------|
| 1 | PRIMARY | 主體身份、解剖穩定、渲染語言 | 2D anime identity, anatomy, silhouette |
| 2 | SECONDARY | 場景氛圍、構圖層級、環境密度 | environment silence, composition hierarchy |
| 3 | TERTIARY | 材質語言、服裝/物件表面 | low-frequency material, matte behavior |
| 4 | QUATERNARY | 次要光效、prism、holo、lightflow | localized accents only, controlled glow |
| 5 | QUALITY | 全域渲染紀律 | denoise, edge diffusion, smooth regions |

可選延伸層（依任務類型）：

- **HAND-PAINTED FINISH** / **ANIME FLATTENING**：prop 類任務的材質降噪
- **EVOLUTION STRATEGY**：語義層說明「如何演化而不增加噪點」

## Source Seed 參考

### `prompts/source/noise-reduction-ladder/EMERALD-JADE.md`

典型四層 + evolution 降噪敘事：

```text
PRIMARY:
2D luxury anime female identity, stable anatomy, ... large smooth visual regions, low-noise rendering

SECONDARY:
minimal moonlit jade sanctuary, ... large environmental silence, clean negative space

TERTIARY:
smooth hand-polished jade surfaces, ... suppressed reflective noise

QUATERNARY:
lightflow as secondary accent only, ... suppressed holographic spread

EVOLUTION STRATEGY:
... noise is reduced through broad mineral surfaces and controlled glow behavior

QUALITY:
reduced high-frequency edge density, controlled edge diffusion, suppressed micro-texture fragmentation
```

### `prompts/source/detail-shot/HOLO-NAILS.md`

局部特寫任務的 QUALITY 降噪：

```text
QUALITY:
soft-focus rendering balance, controlled edge diffusion, minimal crystal-sharp rendering,
reduced high-frequency edge density, low-noise rendering, large smooth visual regions,
suppressed texture fragmentation, stable frequency distribution, minimal rendering noise
```

### `prompts/source/prop-design/GOLDEN-MANGO-JELLY.md`

物件任務的材質降噪：

```text
ANIME FLATTENING:
stylized shape prioritization, reduced optical complexity, reduced realistic refraction

QUALITY:
99% illustration aesthetics, 1% material aesthetics, large clean color regions,
illustration-first rendering, non-3D anime illustration finish
```

### `prompts/source/evolution-strategy/KUNG-FU.md`

明確標記階梯階段：

```text
QUALITY:
... denoise ladder stage 5, low-frequency rendering, large smooth color regions, suppressed noise
```

### `prompts/source/evolution-strategy/PRISM-GOLDFISH.md`

editorial poster 的頻率壓縮：

```text
QUALITY:
frequency-compressed rendering, large smooth regions, reduced high-frequency edge density,
suppressed texture fragmentation, ultra-clean anime rendering
```

## 建議注入順序

編譯或演化時，section 應大致維持此順序，避免 QUALITY 被埋沒：

```text
format / title / subtitle
  -> PRIMARY
  -> SECONDARY
  -> TERTIARY
  -> QUATERNARY (optional)
  -> subject / outfit / object-specific sections
  -> QUALITY
  -> composition / camera / lighting
  -> NEGATIVE
```

## 各層常用語彙（可直接複用）

### PRIMARY 層

```text
stable anatomy, correct five-finger hand anatomy, clean silhouette readability,
large smooth visual regions, low-noise rendering, suppressed rendering fragmentation,
premium anime editorial atmosphere, strictly 2D anime illustration
```

### SECONDARY 層

```text
minimal environmental complexity, large environmental silence, clean negative space,
balanced object density, controlled environmental hierarchy, soft editorial framing
```

### TERTIARY 層

```text
large low-frequency material regions, suppressed reflective noise,
controlled matte reflections, broad low-frequency material transitions,
minimal carved ornamentation
```

### QUATERNARY 層

```text
localized prism reflections only, controlled luminous haze, minimal optical shimmer,
suppressed holographic spread, lightflow as secondary accent only
```

### QUALITY 層

```text
reduced high-frequency edge density, controlled edge diffusion,
suppressed micro-texture fragmentation, large low-frequency rendering zones,
controlled glow spread, minimal crystal-sharp rendering,
suppressed glitter accumulation, ultra clean anime finish
```

## 對應 NEGATIVE 邊界

降噪階梯常與以下 NEGATIVE 詞組成對（見各 source seed）：

```text
oversharpened textures, high-frequency glitter, chaotic glow, dirty rendering,
heavy texture noise, grainy rendering, micro-detail overload, fragmented rendering,
photorealism, 3D rendering, realistic skin texture
```

## 失敗模式

| 症狀 | 常見原因 | 修正方向 |
|------|----------|----------|
| 畫面碎裂、滿屏光斑 | prism/holo 寫在 PRIMARY | 下放到 QUATERNARY，加 `localized only` |
| 材質像玻璃/CGI | 缺 ANIME FLATTENING / MATERIAL OVERRIDE | 補 `anime-material-override` 方法 |
| 手指/解剖錯誤 | PRIMARY 太薄 | 強化 anatomy + HAND LOCK（見 detail-shot seed） |
| 環境搶主體 | SECONDARY 過載 | 改 `minimal ... silence`，提高 negative space |
| 銳利噪點 | 缺 QUALITY | 補 `reduced high-frequency edge density` 整組 |

## 任務類型調整

| 任務 | 重點層 | 備註 |
|------|--------|------|
| prop-design | TERTIARY + ANIME FLATTENING + QUALITY | 參考 GOLDEN-MANGO-JELLY |
| detail-shot | PRIMARY anatomy + QUALITY | 參考 HOLO-NAILS |
| character editorial | PRIMARY + SECONDARY negative space | 參考 SNOW-WHITE, PRISM-GOLDFISH |
| evolution-strategy | EVOLUTION STRATEGY 敘事 + QUALITY | 參考 EMERALD-JADE, KUNG-FU |

## 未來 Lisp 掛載方向

```lisp
(defmethod noise-reduction-ladder
  (:priority-order
   :identity      ; PRIMARY
   :environment   ; SECONDARY
   :material      ; TERTIARY
   :accent        ; QUATERNARY
   :quality       ; QUALITY
   :negative)

  (:inject
   (:quality
    "reduced high-frequency edge density"
    "controlled edge diffusion"
    "large smooth visual regions"
    "suppressed texture fragmentation"
    "stable edge clarity")

   (:negative
    "high-frequency texture noise"
    "fragmented rendering"
    "over-rendered detail"
    "micro-detail overload")))
```

## 使用時機

- 新 seed 草稿在 PRIMARY 之後仍出現噪點、碎裂、過度銳利時。
- 演化後畫面變「花」、prism 溢出、環境變雜時。
- 融合兩個 prompt 後層級失控時，先重建降噪階梯再談 mutate。