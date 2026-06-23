# 動漫材質覆寫（Anime Material Override）

## 目的

強制物件、材質、透明體、皮膚與服裝服從**動漫插畫渲染語言**，而不是滑向攝影、3D、PBR 或寫實玻璃/寶石光學。核心比值：**illustration design is primary, material realism is secondary**。

## 核心原則

- **同一渲染語言**：物件應與角色畫法一致，像 costume / accessory / inventory art，不是產品照。
- **彩繪優先於光學**：用 painted translucency、brushwork、cel-shading，取代 realistic refraction。
- **主動降維**：ANIME FLATTENING 壓制光學複雜度與物理深度模擬。
- **負面詞封邊**：必須搭配 anti-photography、anti-3d、anti-realistic-transparent-material。

## 專屬 Section 群

在 prop 類 seed 中，材質覆寫通常不是單一 section，而是一組協同 section：

| Section | 職責 |
|---------|------|
| ANIME MATERIAL OVERRIDE | 渲染優先級宣告 |
| PROP MATERIAL DESIGN / 材質主體 | 物件材質的插畫化解釋 |
| HAND-PAINTED FINISH | 筆觸、邊緣、高光放置 |
| ANIME FLATTENING | 壓平光學與體積模擬 |
| JELLY APPEARANCE 等主體細節 | 風味驅動的 stylized 外觀 |
| QUALITY | 99% illustration / 1% material 比值 |

## Source Seed 參考

### `prompts/source/prop-design/GOLDEN-MANGO-JELLY.md`

完整 prop 材質覆寫範本：

```text
PROP MATERIAL DESIGN:
cloudy translucent jelly material derived from flavor, painted anime translucency,
stylized edible material rendering, soft milky jelly body, visible illustration brushwork,
painterly material interpretation, anime-style color transitions,
reduced optical realism, reduced physical simulation, illustration-driven material design

HAND-PAINTED FINISH:
premium anime illustration finish, visible artist brush decisions, subtle digital-painting texture,
hand-rendered color transitions, soft painterly edge treatment, illustrated highlight placement,
anime prop-art quality, controlled brushstroke presence

ANIME MATERIAL OVERRIDE:
same rendering language as anime character artwork,
same rendering language as anime costume rendering,
same rendering language as anime accessory rendering,
illustration design is primary, material realism is secondary,
anime object rendering priority

JELLY APPEARANCE:
painted fruit jelly, cloudy translucent body, flavor-driven color appearance,
stylized anime highlight shapes, illustrated volume interpretation,
reduced crystal appearance, reduced gemstone appearance, anime prop readability

ANIME FLATTENING:
stylized shape prioritization, illustrated volume interpretation, painted translucency,
anime color-block rendering, flat-design influence, poster-style simplification,
reduced optical complexity, reduced realistic refraction, reduced physical depth simulation

QUALITY:
99% illustration aesthetics, 1% material aesthetics, visible anime brush texture,
smooth cel-shaded shadows, large clean color regions, illustration-first rendering,
non-3D anime illustration finish
```

### `prompts/source/detail-shot/HOLO-NAILS.md`

局部材質的插畫化（美甲 holo 不是真實光學）：

```text
TERTIARY:
jelly-like iridescent nail sheen, iridescent anime nail coating,
soft prism holo nail reflections, minimal reflective fragmentation,
controlled edge softness, mist-like reflective atmosphere

QUALITY:
minimal material realism, controlled illustration flatness,
minimal crystal-sharp rendering, low-noise rendering
```

### `prompts/source/character-design/SNOW-WHITE.md`

角色整體的 illustration-only 宣告：

```text
PRIMARY:
pure 2D anime aesthetics, non-photorealistic rendering, non-3D rendering,
illustration-only visual language

TERTIARY:
soft refined material rendering, large clean material regions,
controlled reflective hierarchy, reduced micro-detail density
```

### `prompts/source/evolution-strategy/KUNG-FU.md`

服裝 prism 是 couture fashion，不是 crystal armor：

```text
PRIMARY:
... the outfit reads as couture fashion, not crystal armor

DESIGN EVOLUTION STRATEGY:
... the fusion is graphic design fusion, not physical mutation,
not organic transformation, not material melting, not liquid clothing
```

## 常用語彙（可直接複用）

### ANIME MATERIAL OVERRIDE

```text
same rendering language as anime character artwork,
same rendering language as anime costume rendering,
illustration design is primary, material realism is secondary,
anime object rendering priority, strictly 2D anime illustration
```

### 彩繪透明 / 果凍 / 玻璃類

```text
painted anime translucency, cloudy translucent body, illustrated volume interpretation,
stylized anime highlight shapes, soft color diffusion, gentle internal bloom,
reduced crystal appearance, reduced gemstone appearance, reduced realistic refraction
```

### HAND-PAINTED FINISH

```text
visible illustration brushwork, painterly material interpretation,
hand-rendered color transitions, soft painterly edge treatment,
illustrated highlight placement, controlled brushstroke presence
```

### ANIME FLATTENING

```text
stylized shape prioritization, anime color-block rendering,
poster-style simplification, reduced optical complexity,
reduced physical depth simulation, flat-design influence
```

### QUALITY 比值

```text
99% illustration aesthetics, 1% material aesthetics,
illustration-first rendering, non-3D anime illustration finish,
minimal material realism, controlled illustration flatness
```

## 對應 NEGATIVE 邊界

與 `GOLDEN-MANGO-JELLY` NEGATIVE 對齊，建議模組化為 anti-3d / anti-photography / anti-realistic-transparent-material：

```text
food photography, commercial dessert photography, product photography,
CGI rendering, 3D render, physically based rendering,
realistic glass rendering, realistic refraction, crystal sculpture appearance,
gemstone appearance, acrylic appearance, hard transparent plastic appearance,
realistic transparent optics, photorealistic rendering
```

detail-shot 另加：

```text
photorealistic hand, hyper-realistic skin, plastic skin, hard-surface rendering,
realistic wrinkles, skin pores, detailed skin texture
```

## 失敗模式

| 症狀 | 常見原因 | 修正方向 |
|------|----------|----------|
| 物件像產品照 / 食物照 | 缺 OVERRIDE + anti-photography | 補 PRIMARY prop language + NEGATIVE |
| 果凍/玻璃像真實折射 | 缺 FLATTENING | 加 `reduced realistic refraction`, `painted translucency` |
| 材質像 3D 資產 | 缺 QUALITY 比值 | 加 `99% illustration aesthetics`, `non-3D` |
| holo/prism 變碎玻璃 | prism 寫在材質主體 | 改為 lighting accent，`prism as lighting effect only` |
| 服裝變液體/盔甲 | 融合時物理化 | 參考 KUNG-FU：`graphic design fusion, not material melting` |

## 與其他方法的關係

| 方法 | 關係 |
|------|------|
| noise-reduction-ladder | QUALITY 層執行 `suppressed texture fragmentation` |
| negative-space-guidance | 材質過真會視覺變重，擠壓留白 |
| fusion-evolution | 跨主題融合時最易材質衝突，需 preserve rendering-language |

## 任務類型調整

| 任務 | 重點 |
|------|------|
| prop-design | 完整五 section 群（OVERRIDE + MATERIAL + HAND-PAINTED + FLATTENING + QUALITY） |
| detail-shot | TERTIARY 插畫化光學 + QUALITY `minimal material realism` |
| character-design | PRIMARY `illustration-only` + TERTIARY 低頻材質 |
| editorial prism 服裝 | 明確 `couture fashion, not crystal armor` |

## 未來 Lisp 掛載方向

```lisp
(defmethod anime-material-override
  (:inject
   (:anime-material-override
    "same rendering language as anime character artwork"
    "same rendering language as anime costume rendering"
    "illustration design is primary"
    "material realism is secondary"
    "anime object rendering priority")

   (:quality
    "99% illustration aesthetics"
    "1% material aesthetics"
    "illustration-first rendering"
    "non-3D anime illustration finish")

   (:anime-flattening
    "reduced optical complexity"
    "reduced realistic refraction"
    "reduced physical depth simulation")

   (:negative
    "realistic refraction"
    "crystal sculpture appearance"
    "physically based rendering"
    "product photography")))
```

## 使用時機

- 食物、果凍、玻璃、寶石、金屬、皮膚、美甲等易滑向寫實的題材。
- 模型輸出偏 3D / Octane / 產品攝影時。
- 演化增加 garnish、反射、透明層後材質失控時。