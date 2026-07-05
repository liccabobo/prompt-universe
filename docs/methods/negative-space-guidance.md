# 負空間引導（Negative Space Guidance）

## 目的

用**留白、呼吸感、層級分離**引導構圖，讓主體（角色、道具、標題）保有可讀性，避免模型把畫面填滿裝飾、碎屑或過密環境。負空間不是「空著不寫」，而是主動規劃哪裡該乾淨、哪裡該收斂視覺密度。

## 核心原則

- **主體優先**：負空間服務於 focal hierarchy，不是為了極簡而極簡。
- **分層分離**：foreground / midground / background 各自保留可辨識的乾淨區域。
- **排版也是構圖**：editorial、poster、magazine cover 必須預留 typography area。
- **與降噪階梯連動**：SECONDARY 環境寫太多會吃掉負空間；應搭配 `minimal environmental complexity`。

## 專屬 Section

在 source seed 中，負空間常以獨立 section 出現：

```text
NEGATIVE-SPACE GUIDANCE:
...
```

少數 seed 把類似語彙放在 SECONDARY、COMPOSITION、BACKGROUND 或 SMALL DETAIL，語意相同，編譯時應視為同一方法論。

## Source Seed 參考

### `illustration/seeds/prop-design/GOLDEN-MANGO-JELLY.md`

prop showcase 的留白與排版：

```text
NEGATIVE-SPACE GUIDANCE:
large clean typography area, elegant breathing room, isolated prop presentation,
premium anime poster layout, strong focal hierarchy

TABLETOP STYLING:
... almost textureless backdrop, clean poster background

COMPOSITION:
jelly prop occupying approximately 45–55% of the frame, complete plate visible,
balanced asymmetrical layout, strong object readability
```

要點：主體佔比明確（45–55%），背景刻意「almost textureless」。

### `illustration/seeds/character-design/SNOW-WHITE.md`

magazine cover 的編輯留白：

```text
NEGATIVE-SPACE GUIDANCE:
large clean background regions, generous editorial breathing room,
strong empty-space hierarchy, controlled visual density,
luxury magazine layout balance, clean foreground-background separation,
low visual noise composition

COMPOSITION:
large foreground dessert showcase occupying nearly the lower half of the composition,
midground upper-body character visibility only, character positioned behind the dessert display,
oversized LICCA BOBO masthead behind the character,
strong foreground-middle-background separation, elegant negative-space breathing
```

要點：前中後景比例寫死；標題區與角色層疊關係明確。

### `illustration/seeds/detail-shot/HOLO-NAILS.md`

特寫構圖的 atmospheric negative space：

```text
SECONDARY:
... large atmospheric negative space, isolated fingertip attention routing

SCENE:
minimal reflective cosmetic studio environment, ... clean optical emptiness, dreamlike cosmetic silence
```

要點：特寫不是置中商品照；用 off-center crop + 大氣留白導向指尖。

### `illustration/seeds/evolution-strategy/PRISM-GOLDFISH.md`

poster 的 rule-of-thirds 留白：

```text
EVOLUTION STRATEGY:
... negative-space driven composition

COMPOSITION:
strict rule-of-thirds layout, left third contains character,
center third contains giant transparent prism,
right third contains goldfish and optical refractions,
large visual breathing room, balanced asymmetry

BACKGROUND:
open meadow, green grass, minimal flowers, large sky area, clean negative space, landscape simplicity
```

要點：三分法 + 單一主導對角結構，避免裝飾性填充。

### `illustration/seeds/evolution-strategy/AFTERNOON-TEA.md`

editorial 場景的 controlled negative space：

```text
EVOLUTION STRATEGY:
... controlled negative space, suppressed decorative clutter

SMALL DETAIL:
... large breathing negative space, soft editorial framing, no excessive floral decoration
```

### `illustration/seeds/evolution-fusion/AI-CIVILIZATIONcivilization-square.md`

大場景的 civilization-scale negative space：

```text
SCENE:
... large negative-space composition, soft atmospheric depth, futuristic public square
```

## 常用語彙（可直接複用）

### 通用留白

```text
large clean background regions, generous editorial breathing room,
strong empty-space hierarchy, controlled visual density,
elegant breathing room, strong focal hierarchy, clean spatial separation
```

### 排版 / Poster / Cover

```text
large clean typography area, premium anime poster layout,
premium magazine-cover hierarchy, oversized typography behind character,
clean spacing, strong readability, luxury editorial layout balance
```

### 主體隔離

```text
isolated prop presentation, isolated fingertip attention routing,
clean silhouette isolation, strong subject isolation, subject readability prioritized
```

### 環境收斂

```text
minimal environmental complexity, clean optical emptiness,
almost textureless backdrop, clean poster background,
large sky area, landscape simplicity, minimal environmental storytelling
```

### 構圖比例（建議參數化）

```text
{{subject}} occupying approximately {{45–55%}} of the frame
large foreground {{element}} occupying nearly the lower half of the composition
```

## 與其他方法的關係

| 方法 | 關係 |
|------|------|
| noise-reduction-ladder | SECONDARY 應保留 `environmental silence`；過密環境會破壞負空間 |
| anime-material-override | 材質寫太真會視覺變「重」，擠壓留白 |
| fusion-evolution | 融合兩個滿版構圖易過載；需重新分配 foreground/midground 比例 |

## 失敗模式

| 症狀 | 常見原因 | 修正方向 |
|------|----------|----------|
| 標題被主體擋死 | 缺 typography hierarchy | 加 `masthead behind character`、`upper quarter` |
| 道具/甜點變小看不清 | 負空間過頭 | 明確主體佔比（如 45–55%） |
| 特寫變商品照 | 置中、缺 atmospheric space | 加 off-center + `isolated attention routing` |
| 背景滿是花/碎屑 | SECONDARY 過載 | `minimal flowers`, `no excessive floral decoration` |
| 前中後景黏在一起 | 缺 separation 敘事 | 補 `foreground-middle-background separation` |

## 任務類型模板

### Prop showcase

```text
NEGATIVE-SPACE GUIDANCE:
large clean typography area, elegant breathing room, isolated prop presentation,
premium anime poster layout, strong focal hierarchy

COMPOSITION:
{{prop}} occupying approximately 45–55% of the frame, balanced asymmetrical layout
```

### Magazine cover

```text
NEGATIVE-SPACE GUIDANCE:
large clean background regions, generous editorial breathing room,
luxury magazine layout balance, low visual noise composition

COMPOSITION:
large foreground {{display}} occupying nearly the lower half,
midground {{character}} visibility only, strong foreground-middle-background separation
```

### Detail macro

```text
SECONDARY:
large atmospheric negative space, isolated {{subject}} attention routing,
no centered posing, soft accidental framing

SCENE:
minimal {{studio}} environment, clean optical emptiness
```

## 未來 Lisp 掛載方向

```lisp
(defmethod negative-space-guidance
  (:inject
   (:negative-space-guidance
    "large clean typography area"
    "controlled empty-space breathing"
    "clean spatial separation"
    "premium poster layout"
    "strong focal hierarchy"
    "controlled visual density"
    "low visual noise composition")))
```

## 使用時機

- editorial cover、poster、prop showcase 構圖發散時。
- 演化後環境變雜、配件變多、排版區被擠掉時。
- 融合兩個 seed 後畫面過滿，需重新切前中後景比例時。