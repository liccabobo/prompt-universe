#!/usr/bin/env python3
"""Generate transparent-giant-flower-100 expansion plan with 100 mutations."""

VARIANTS = [
    ("玫瑰", "moonlit crimson rose chapel", "deep rose crimson, velvet burgundy, champagne gold, ivory blush, near-black shadow",
     "moonlit rose chapel editorial shell, velvet petal arch framing, hushed floral sanctuary silence",
     "solid rose-crimson backdrop, faint chapel rose-window glow, sparse petal dust bokeh, clean poster negative space",
     "crimson rose couture transparent bodice, velvet petal collar panels, sheer balloon sleeves with rose filigree, layered rose-petal skirt tiers",
     "oversized rose-petal butterfly wings, crimson glossy panels, gold edge nodes, petal geometry not insect anatomy",
     "giant luminous rose crown with radiating thorn-light rays, crystal rose-drop earrings, floating crimson pollen motes, single stem accent",
     "giant transparent rose petals, rose-window silhouettes, floating crimson pollen, minimal thorn stem prop",
     "petal-arc geometry evolves into rose-window curve language, thorn rings echo wing loops, velvet panels align with couture seams, graphic fusion only",
     "warm rose key light vs cool chapel shadow rim, gold petal edge bloom, strong silhouette separation"),
    ("蘭花", "moonlit orchid conservatory", "violet orchid, pearl white, jade mist, silver moonlight, deep plum shadow",
     "glass orchid conservatory editorial shell, humid moonlit silence, minimal vine framing",
     "solid violet-plum backdrop, soft conservatory mist, distant glass-pane highlights, clean fantasy poster field",
     "orchid couture transparent bodice, jade vine collar, sheer sleeves with orchid lip print, layered orchid-lip skirt panels",
     "oversized orchid-petal butterfly wings, violet glossy panels, pearl edge nodes, floral geometry not insect anatomy",
     "giant luminous orchid crown with radiating mist rays, crystal orchid-drop earrings, floating violet pollen, single vine accent",
     "giant transparent orchid petals, conservatory arch silhouettes, floating violet pollen, minimal vine prop",
     "orchid-lip geometry evolves into conservatory arch-curve language, vine rings echo wing loops, glass panels align with couture seams, graphic fusion only",
     "cool moon key light vs warm orchid accent glow, pearl edge bloom, deep conservatory shadows"),
    ("蓮花", "crystal lotus lagoon shrine", "lotus pink, lagoon cyan, pearl white, sunset gold, deep teal shadow",
     "crystal lotus lagoon shrine editorial shell, still water reflection silence, minimal lotus pad framing",
     "solid lagoon-teal backdrop, soft water shimmer particles, distant lotus reflection glow, clean poster negative space",
     "lotus couture transparent bodice, pearl lotus-collar, sheer sleeves with lotus print, layered lotus-petal skirt tiers",
     "oversized lotus-petal butterfly wings, cyan-tinted glossy panels, pink-gold edge nodes, petal geometry not insect anatomy",
     "giant luminous lotus crown with radiating water-light rays, crystal lotus-drop earrings, floating gold pollen, single pad accent",
     "giant transparent lotus petals, lagoon shrine silhouettes, floating gold pollen, minimal stem prop",
     "lotus-pad geometry evolves into lagoon shrine curve language, water rings echo wing loops, crystal panels align with couture seams, graphic fusion only",
     "cool lagoon key light vs warm lotus accent glow, pearl water-edge bloom, deep teal shadow pockets"),
    ("櫻花", "cherry blossom moon gate", "sakura pink, moon silver, soft ivory, blush coral, midnight blue shadow",
     "cherry blossom moon gate editorial shell, petal-drift silence, minimal torii framing",
     "solid midnight-blue backdrop, soft sakura petal bokeh, distant moon-gate glow, clean fantasy poster field",
     "sakura couture transparent bodice, moon-white choker collar, sheer sleeves with blossom print, layered petal skirt panels",
     "oversized sakura-petal butterfly wings, pink glossy panels, silver edge nodes, blossom geometry not insect anatomy",
     "giant luminous sakura crown with radiating moon rays, crystal blossom-drop earrings, floating pink pollen, single branch accent",
     "giant transparent sakura petals, moon-gate silhouettes, floating pink pollen, minimal branch prop",
     "blossom-arc geometry evolves into moon-gate curve language, petal rings echo wing loops, torii panels align with couture seams, graphic fusion only",
     "cool moon key light vs warm sakura accent glow, silver edge bloom, deep midnight shadows"),
    ("百合", "ivory lily cathedral nave", "ivory white, lily gold, sage green, pearl cream, charcoal shadow",
     "ivory lily cathedral nave editorial shell, stained-glass hush, minimal nave column framing",
     "solid sage-green backdrop, soft cathedral light shafts, sparse lily pollen bokeh, clean poster negative space",
     "lily couture transparent bodice, ivory cathedral collar, sheer sleeves with lily print, layered lily-petal skirt tiers",
     "oversized lily-petal butterfly wings, ivory glossy panels, gold edge nodes, floral geometry not insect anatomy",
     "giant luminous lily crown with radiating nave-light rays, crystal lily-drop earrings, floating gold pollen, single stem accent",
     "giant transparent lily petals, cathedral arch silhouettes, floating gold pollen, minimal stem prop",
     "lily-trumpet geometry evolves into cathedral nave curve language, column rings echo wing loops, stained panels align with couture seams, graphic fusion only",
     "warm gold key light vs cool sage rim, ivory edge bloom, deep charcoal shadow pockets"),
    ("鬱金香", "dutch tulip greenhouse dawn", "tulip red, leaf green, dawn amber, cream ivory, forest shadow",
     "dutch tulip greenhouse dawn editorial shell, humid glass silence, minimal greenhouse frame",
     "solid leaf-green backdrop, soft dawn haze through glass, sparse tulip pollen bokeh, clean fantasy poster field",
     "tulip couture transparent bodice, green stem-collar panels, sheer sleeves with tulip print, layered tulip-cup skirt tiers",
     "oversized tulip-cup butterfly wings, red glossy panels, amber edge nodes, floral geometry not insect anatomy",
     "giant luminous tulip crown with radiating dawn rays, crystal tulip-drop earrings, floating amber pollen, single leaf accent",
     "giant transparent tulip petals, greenhouse arch silhouettes, floating amber pollen, minimal stem prop",
     "tulip-cup geometry evolves into greenhouse arch-curve language, glass rings echo wing loops, leaf panels align with couture seams, graphic fusion only",
     "warm dawn key light vs cool green rim, amber edge bloom, forest shadow separation"),
    ("牡丹", "imperial peony moon pavilion", "peony magenta, jade green, imperial gold, silk ivory, ink black shadow",
     "imperial peony moon pavilion editorial shell, lacquer silence, minimal pavilion lattice framing",
     "solid jade-green backdrop, soft moon pavilion glow, sparse peony petal bokeh, clean poster negative space",
     "peony couture transparent bodice, imperial gold collar, sheer sleeves with peony print, layered peony-petal skirt tiers",
     "oversized peony-petal butterfly wings, magenta glossy panels, gold edge nodes, floral geometry not insect anatomy",
     "giant luminous peony crown with radiating pavilion rays, crystal peony-drop earrings, floating gold pollen, single lattice accent",
     "giant transparent peony petals, pavilion lattice silhouettes, floating gold pollen, minimal stem prop",
     "peony-layer geometry evolves into pavilion lattice curve language, gold rings echo wing loops, lacquer panels align with couture seams, graphic fusion only",
     "warm imperial key light vs cool jade rim, gold edge bloom, ink-black shadow pockets"),
    ("繡球花", "rain hydrangea courtyard", "hydrangea periwinkle, rain silver, cloud white, mist lavender, slate shadow",
     "rain hydrangea courtyard editorial shell, drizzle-muted silence, minimal courtyard arch framing",
     "solid periwinkle backdrop, soft rain mist particles, sparse hydrangea cluster bokeh, clean fantasy poster field",
     "hydrangea couture transparent bodice, rain-silver collar, sheer sleeves with hydrangea print, layered cluster skirt panels",
     "oversized hydrangea-cluster butterfly wings, periwinkle glossy panels, silver edge nodes, floral geometry not insect anatomy",
     "giant luminous hydrangea crown with radiating rain rays, crystal cluster-drop earrings, floating silver pollen, single arch accent",
     "giant transparent hydrangea petals, courtyard arch silhouettes, floating silver pollen, minimal stem prop",
     "cluster-sphere geometry evolves into courtyard arch-curve language, rain rings echo wing loops, mist panels align with couture seams, graphic fusion only",
     "cool rain key light vs warm periwinkle accent, silver edge bloom, slate shadow separation"),
    ("向日葵", "solar sunflower temple terrace", "sunflower gold, sky cyan, harvest orange, straw cream, deep umber shadow",
     "solar sunflower temple terrace editorial shell, heat-hazed silence, minimal temple column framing",
     "solid sky-cyan backdrop, soft solar haze glow, sparse sunflower pollen bokeh, clean poster negative space",
     "sunflower couture transparent bodice, harvest-orange collar, sheer sleeves with sunflower print, layered petal-disk skirt tiers",
     "oversized sunflower-disk butterfly wings, gold glossy panels, orange edge nodes, floral geometry not insect anatomy",
     "giant luminous sunflower crown with radiating solar rays, crystal seed-drop earrings, floating gold pollen, single column accent",
     "giant transparent sunflower petals, temple terrace silhouettes, floating gold pollen, minimal stem prop",
     "disk-spiral geometry evolves into temple terrace curve language, solar rings echo wing loops, column panels align with couture seams, graphic fusion only",
     "warm solar key light vs cool sky rim, gold edge bloom, deep umber shadow pockets"),
    ("雛菊", "meadow daisy windmill dusk", "daisy white, meadow green, dusk peach, butter yellow, twilight blue shadow",
     "meadow daisy windmill dusk editorial shell, breeze-open silence, minimal windmill blade framing",
     "solid meadow-green backdrop, soft dusk peach haze, sparse daisy pollen bokeh, clean fantasy poster field",
     "daisy couture transparent bodice, butter-yellow collar, sheer sleeves with daisy print, layered daisy-petal skirt tiers",
     "oversized daisy-petal butterfly wings, white glossy panels, yellow edge nodes, floral geometry not insect anatomy",
     "giant luminous daisy crown with radiating dusk rays, crystal daisy-drop earrings, floating yellow pollen, single blade accent",
     "giant transparent daisy petals, windmill silhouettes, floating yellow pollen, minimal stem prop",
     "daisy-disk geometry evolves into windmill blade curve language, meadow rings echo wing loops, blade panels align with couture seams, graphic fusion only",
     "warm dusk key light vs cool meadow rim, yellow edge bloom, twilight-blue shadows"),
]

# Extend to 100 with additional botanical editorial anchors
MORE = [
    ("薰衣草", "twilight lavender field windmill", "lavender violet, twilight silver, sage mist, cream ivory, deep indigo shadow"),
    ("紫藤", "wisteria waterfall pergola", "wisteria lilac, cascade cyan, pearl white, moss green, waterfall shadow"),
    ("木蘭", "magnolia moon pier", "magnolia cream, moon pearl, soft blush, pier teal, night shadow"),
    ("山茶花", "camellia tea house garden", "camellia rose, tea green, lacquer red, parchment cream, garden shadow"),
    ("扶桑", "tropical hibiscus lagoon deck", "hibiscus coral, lagoon aqua, sunset mango, palm cream, tropical shadow"),
    ("鳶尾", "iris storm terrace", "iris violet, storm silver, lightning white, slate blue, tempest shadow"),
    ("罌粟", "poppy dawn memorial field", "poppy scarlet, dawn gold, field green, memorial ivory, horizon shadow"),
    ("萬壽菊", "marigold festival altar", "marigold orange, festival red, spice gold, altar cream, dusk shadow"),
    ("茉莉", "jasmine night courtyard", "jasmine white, night indigo, moon silver, courtyard jade, soft shadow"),
    ("紫羅蘭", "violet twilight grotto", "violet purple, grotto cyan, crystal white, moss shadow, cave depth"),
    ("大理花", "dahlia circus tent garden", "dahlia magenta, tent stripe red, circus gold, garden green, tent shadow"),
    ("康乃馨", "carnation velvet ballroom flora", "carnation pink, velvet burgundy, ballroom gold, mirror ivory, chandelier shadow"),
    ("杜鵑", "azalea hillside shrine", "azalea coral, hillside moss, shrine stone, mist white, slope shadow"),
    ("秋海棠", "begonia glasshouse lane", "begonia salmon, glass green, lane cream, humid silver, greenhouse shadow"),
    ("銀蓮花", "anemone tidal pool stage", "anemone wine, tidal teal, foam white, pool cyan, reef shadow"),
    ("風鈴草", "bluebell forest clearing", "bluebell periwinkle, forest emerald, clearing gold, bark brown, woodland shadow"),
    ("菊花", "chrysanthemum autumn gate", "chrysanthemum amber, autumn rust, gate bronze, parchment cream, harvest shadow"),
    ("梔子花", "gardenia moon veranda", "gardenia white, moon silver, veranda teal, porch cream, night shadow"),
    ("帝王花", "protea savanna bloom studio", "protea rust, savanna ochre, studio cream, sun bronze, dune shadow"),
    ("雞蛋花", "plumeria beach dusk altar", "plumeria cream, beach coral, dusk violet, sand gold, tide shadow"),
    ("毛地黃", "foxglove fairy ring meadow", "foxglove magenta, fairy green, ring gold, meadow mist, enchanted shadow"),
    ("鐵筷子", "hellebore winter crypt garden", "hellebore plum, winter frost, crypt stone, ice silver, crypt shadow"),
    ("飛燕草", "delphinium sky spire balcony", "delphinium cobalt, sky pearl, spire silver, balcony cream, altitude shadow"),
    ("小蒼蘭", "freesia citrus atrium", "freesia lemon, citrus orange, atrium white, leaf green, glass shadow"),
    ("百日草", "zinnia carnival patch poster", "zinnia fuchsia, carnival cyan, patch green, poster cream, fair shadow"),
    ("金魚草", "snapdragon castle wall garden", "snapdragon coral, castle stone, wall ivy, banner gold, rampart shadow"),
    ("波斯菊", "cosmos starfield prairie", "cosmos pink, starfield navy, prairie gold, comet white, cosmic shadow"),
    ("翠菊", "aster comet meadow", "aster lavender, comet silver, meadow teal, meteor cream, night shadow"),
    ("石楠", "heather moor wind shrine", "heather mauve, moor slate, wind silver, shrine stone, highland shadow"),
    ("蜀葵", "hollyhock cottage lane", "hollyhock rose, cottage cream, lane green, thatch gold, village shadow"),
    ("水仙", "narcissus mirror spring", "narcissus yellow, mirror cyan, spring green, pool silver, reflection shadow"),
    ("孤挺花", "amaryllis holiday crystal hall", "amaryllis red, holiday gold, crystal white, hall ivory, festive shadow"),
    ("矮牽牛", "petunia balcony cascade", "petunia violet, balcony cream, cascade cyan, rail silver, urban shadow"),
    ("花毛茛", "ranunculus layered cake garden", "ranunculus peach, cake cream, garden mint, layer gold, pastry shadow"),
    ("豌豆花", "sweet pea trellis arbor", "sweet pea lilac, trellis green, arbor cream, vine gold, garden shadow"),
    ("劍蘭", "gladiolus arena floral stand", "gladiolus scarlet, arena bronze, stand ivory, banner gold, coliseum shadow"),
    ("馬蹄蓮", "calla minimalist white stage", "calla ivory, stage charcoal, minimalist silver, stem green, gallery shadow"),
    ("天堂鳥", "bird-of-paradise jungle couture deck", "bird orange, jungle emerald, deck teal, plumage gold, canopy shadow"),
    ("蘑菇", "bioluminescent mushroom cathedral", "mushroom teal, spore cyan, cathedral violet, glow ivory, fungal shadow"),
    ("銀蓮", "windflower alpine cliff shrine", "windflower white, alpine ice, cliff slate, shrine silver, peak shadow"),
    ("三色堇", "pansy secret garden gate", "pansy purple, garden moss, gate bronze, secret cream, hedge shadow"),
    ("天竺葵", "geranium rooftop herb terrace", "geranium red, herb green, rooftop cream, terracotta gold, city shadow"),
    ("牽牛花", "morning glory dawn trellis", "morning glory blue, dawn peach, trellis green, vine cream, sunrise shadow"),
    ("含羞草", "mimosa moonlit savanna", "mimosa yellow, savanna bronze, moon silver, grass cream, dusk shadow"),
    ("睡蓮", "water lily midnight pond stage", "water lily pink, midnight navy, pond cyan, lily pad green, pond shadow"),
    ("帝王蝶花", "passionflower vine moon arch", "passionflower violet, vine green, moon arch silver, fruit gold, arch shadow"),
    ("雪絨花", "edelweiss alpine ice chapel", "edelweiss white, alpine cyan, ice silver, chapel stone, glacier shadow"),
    ("仙人掌花", "night-bloom cactus desert observatory", "cactus bloom magenta, desert sand, observatory bronze, night navy, dune shadow"),
    ("珊瑚花", "coral bloom reef dome", "coral bloom orange, reef teal, dome cyan, pearl white, abyss shadow"),
    ("鈴蘭", "lily-of-the-valley forest chapel", "lily-of-valley white, forest jade, chapel stone, bell silver, woodland shadow"),
    ("番紅花", "crocus spring thaw meadow", "crocus purple, thaw silver, meadow gold, snow ivory, spring shadow"),
    ("風信子", "hyacinth bluebell grotto", "hyacinth blue, grotto teal, bell cream, moss green, cavern shadow"),
    ("滿天星", "babys breath starlit arbor", "babys breath white, starlit navy, arbor cream, sparkle silver, night shadow"),
    ("虞美人", "corn poppy wheat field altar", "corn poppy red, wheat gold, field green, altar stone, harvest shadow"),
    ("金盞花", "calendula herb apothecary", "calendula orange, apothecary cream, herb green, bottle amber, shelf shadow"),
    ("矢車菊", "cornflower prairie windmill", "cornflower blue, prairie gold, windmill cream, grain green, horizon shadow"),
    ("金雀花", "broom heath lighthouse cliff", "broom yellow, heath slate, lighthouse white, cliff teal, coastal shadow"),
    ("繡線菊", "spirea bridal garden pavilion", "spirea white, bridal blush, pavilion gold, garden green, lace shadow"),
    ("繡球藤", "clematis moon trellis hall", "clematis violet, moon silver, trellis green, hall cream, vine shadow"),
    ("醉魚草", "butterfly bush twilight lane", "butterfly bush purple, twilight amber, lane cream, moth silver, dusk shadow"),
    ("馬鞭草", "verbena star courtyard", "verbena magenta, star navy, courtyard stone, glow cream, night shadow"),
    ("蓮藕", "lotus root zen pond pavilion", "lotus root blush, zen teal, pond jade, pavilion ivory, still-water shadow"),
    ("蒲公英", "dandelion seed wind tower", "dandelion yellow, seed silver, wind cyan, tower cream, sky shadow"),
    ("苔蘚花", "moss bloom cave lantern", "moss bloom green, cave amber, lantern gold, stone gray, cavern shadow"),
    ("冰晶花", "frost crystal winter greenhouse", "frost crystal blue, winter white, greenhouse glass, ice silver, polar shadow"),
    ("火焰花", "flame lily volcanic terrace", "flame lily orange, volcanic charcoal, terrace rust, ember gold, lava shadow"),
    ("月光花", "moonflower night bloom altar", "moonflower ivory, night indigo, altar silver, bloom glow, lunar shadow"),
    ("龍舌蘭", "agave desert prism atelier", "agave teal, desert ochre, prism cyan, atelier cream, arid shadow"),
    ("鳳梨花", "pineapple crown tropical loft", "pineapple gold, tropical green, loft cream, crown bronze, loft shadow"),
    ("石榴花", "pomegranate ruby courtyard", "pomegranate ruby, courtyard terracotta, leaf green, jewel cream, mosaic shadow"),
    ("丁香", "lilac spring rain arcade", "lilac purple, rain silver, arcade cream, spring green, arcade shadow"),
    ("條紋花", "tiger lily bamboo grove stage", "tiger lily orange, bamboo jade, grove mist, stripe gold, grove shadow"),
    ("野玫瑰", "wild rose ruin garden", "wild rose pink, ruin stone, garden moss, thorn silver, ruin shadow"),
    ("雪蓮", "snow lotus glacier sanctuary", "snow lotus white, glacier cyan, sanctuary silver, ice blue, alpine shadow"),
    ("鬼百合", "ghost lily mist memorial", "ghost lily pale, mist silver, memorial stone, spectral cyan, memorial shadow"),
    ("鳳仙花", "balsam rain garden kiosk", "balsam coral, rain teal, kiosk cream, garden green, shower shadow"),
    ("紫茉莉", "four-o-clock dusk clock garden", "four-o-clock magenta, dusk violet, clock bronze, garden cream, twilight shadow"),
    ("金魚草", "snapdragon harbor floral dock", "snapdragon yellow, harbor teal, dock wood, rope cream, maritime shadow"),
    ("荷包牡丹", "bleeding heart shade arbor", "bleeding heart pink, shade emerald, arbor cream, heart silver, shade shadow"),
    ("石竹", "dianthus cottage window", "dianthus carnation pink, cottage cream, window teal, lace white, cottage shadow"),
    ("鶴望蘭", "strelitzia modernist floral atrium", "strelitzia orange, modernist gray, atrium white, leaf teal, gallery shadow"),
    ("朱頂紅", "amaryllis opera floral box", "amaryllis scarlet, opera gold, box velvet, curtain cream, stage shadow"),
    ("白三葉", "clover meadow luck shrine", "clover green, meadow gold, luck ivory, shrine stone, pastoral shadow"),
    ("繡球苔", "moss hydrangea rain temple", "moss hydrangea blue, rain silver, temple stone, moss green, temple shadow"),
    ("琉璃花", "glass bloom prism conservatory", "glass bloom cyan, prism violet, conservatory white, refraction gold, glass shadow"),
    ("星蘭", "star orchid nebula dome", "star orchid lilac, nebula navy, dome silver, cosmic cream, nebula shadow"),
    ("蜜糖花", "honeysuckle twilight trellis", "honeysuckle gold, twilight purple, trellis green, nectar cream, dusk shadow"),
    ("鈴鐺花", "bellflower alpine bell tower", "bellflower blue, alpine snow, bell tower bronze, tower cream, peak shadow"),
    ("火焰樹", "flamboyant tree sunset plaza", "flamboyant red, sunset orange, plaza cream, leaf green, plaza shadow"),
    ("風鈴木", "tabebuia golden avenue", "tabebuia gold, avenue cream, leaf jade, bloom yellow, avenue shadow"),
    ("木棉花", "kapok riverbank bloom pier", "kapok crimson, riverbank teal, pier wood, bloom cream, river shadow"),
    ("紫藤蘿", "wisteria tunnel moon promenade", "wisteria lavender, tunnel navy, moon silver, promenade cream, tunnel shadow"),
    ("水晶蘭", "ghost pipe forest fairy ring", "ghost pipe white, forest emerald, fairy gold, ring silver, enchanted shadow"),
    ("龍膽", "gentian mountain shrine terrace", "gentian blue, mountain slate, shrine stone, terrace cream, alpine shadow"),
    ("金鈴花", "forsythia spring lantern path", "forsythia yellow, spring green, lantern gold, path cream, blossom shadow"),
    ("繡球菊", "globe amaranth festival float", "globe amaranth magenta, festival cyan, float cream, ribbon gold, parade shadow"),
]

def expand_more():
    result = []
    for zh, anchor, colors in MORE:
        c1, c2, c3, c4, c5 = colors.split(", ")
        flower_en = anchor.split()[0] if anchor else "floral"
        result.append((
            zh, anchor,
            f"{c1}, {c2}, {c3}, {c4}, {c5}",
            f"{anchor} editorial shell, botanical fantasy silence, minimal architectural framing",
            f"solid {c1} backdrop, soft atmospheric particles, sparse floral bokeh, clean poster negative space",
            f"{flower_en} couture transparent bodice, themed collar panels, sheer balloon sleeves with floral print, layered petal skirt tiers",
            f"oversized {flower_en} petal butterfly wings, glossy themed panels, glowing edge nodes, petal geometry not insect anatomy",
            f"giant luminous {flower_en} crown with radiating light rays, crystal floral-drop earrings, floating pollen motes, single stem accent",
            f"giant transparent {flower_en} petals, themed architectural silhouettes, floating pollen particles, minimal stem prop",
            f"floral-arc geometry evolves into {anchor} curve language, petal rings echo wing loops, shell panels align with couture seams, graphic fusion only",
            f"high-contrast themed rim light, cool key vs warm accent glow, strong edge separation, glossy highlight bloom",
        ))
    return result

ALL = (VARIANTS + expand_more())[:100]
assert len(ALL) == 100, f"Expected 100 variants, got {len(ALL)}"

def esc(s):
    return s.replace("\\", "\\\\").replace('"', '\\"')

def emit_mutation(v):
    zh, anchor, color, secondary, background, outfit, wing, botanical, thematic, evolution, lighting = v
    return f"""   ((:color-theme "{esc(color)}")
    (:secondary "{esc(secondary)}")
    (:background "{esc(background)}")
    (:outfit-design "{esc(outfit)}")
    (:wing-design "{esc(wing)}")
    (:botanical-accessory "{esc(botanical)}")
    (:thematic-symbol "{esc(thematic)}")
    (:evolution-strategy "{esc(evolution)}")
    (:lighting "{esc(lighting)}"))"""

header = """(in-package #:prompt-universe)

(defexpansion-plan transparent-giant-flower-100
  (:intent "one hundred botanical fantasy editorial poster variants of transparent giant flower couture fairy")
  (:source transparent-giant-flower)
  (:preserve :primary :hair-style :title :subtitle :face-style :facial-expression :quality :negative :camera :typography)
  (:variant-axes
   (:required :color-theme :theme-anchor :accessory-set)
   (:recommended :scene-shell :outfit-design :evolution-strategy :wing-design :lighting :composition)
   (:theme-anchor-keys :secondary :background :evolution-strategy)
   (:accessory-keys :thematic-symbol :botanical-accessory :wing-design))
  (:mutations
"""

footer = "))\n"

mutations = "\n\n".join(emit_mutation(v) for v in ALL)
plan = header + mutations + footer

out_plan = "lisp/generator/plans/transparent-giant-flower-100.lisp"
with open(out_plan, "w", encoding="utf-8") as f:
    f.write(plan)

ANCHOR_ZH = {
    "moonlit crimson rose chapel": "月夜緋玫瑰禮拜堂",
    "moonlit orchid conservatory": "月光蘭花溫室",
    "crystal lotus lagoon shrine": "水晶蓮花潟湖神社",
    "cherry blossom moon gate": "櫻花月門",
    "ivory lily cathedral nave": "象牙百合大教堂中殿",
    "dutch tulip greenhouse dawn": "荷式鬱金香溫室晨曦",
    "imperial peony moon pavilion": "皇家牡丹月亭",
    "rain hydrangea courtyard": "雨繡球庭院",
    "solar sunflower temple terrace": "向日葵神殿露台",
    "meadow daisy windmill dusk": "雛菊風車黃昏草原",
}

def zh_anchor(anchor: str) -> str:
    if anchor in ANCHOR_ZH:
        return ANCHOR_ZH[anchor]
    # heuristic: take last two tokens as scene, first as flower
    parts = anchor.split()
    if len(parts) >= 3:
        return f"{' '.join(parts[:2])} · {' '.join(parts[2:])}"
    return anchor

def zh_summary(i: int, v) -> str:
    zh, anchor, color = v[0], v[1], v[2]
    scene = zh_anchor(anchor)
    palette = color.split(", ")[0]
    return (
        f"V{i:03d} | {zh}系列 | 場景：{scene} | 主色：{palette} | "
        f"保留透明高訂花仙子骨架，換裝翅膀/花冠/符號道具與海報場域；"
        f"控制器注入 prism 材質點綴"
    )

# Chinese summary log
log_lines = [
    "# TRANSPARENT-GIANT-FLOWER 100 變體中文摘要",
    "來源: output/approved/TRANSPARENT-GIANT-FLOWER.md",
    "控制器: config/variant-controller.lisp",
    "  - variant-count: 100 | color-shift: 80 | scene-shift: 85 | accessory-shift: 80",
    "  - evolution-fusion: 75 | material-accent: prism | gender-mode: mutable",
    "計畫: transparent-giant-flower-100",
    "輸出: output/variants/TRANSPARENT-GIANT-FLOWER-2026-06-17/",
    "",
]
for i, v in enumerate(ALL, 1):
    log_lines.append(zh_summary(i, v))

log_path = "output/logs/transparent-giant-flower-100.log"
with open(log_path, "w", encoding="utf-8") as f:
    f.write("\n".join(log_lines) + "\n")

print(f"Wrote {out_plan} ({len(ALL)} mutations)")
print(f"Wrote {log_path}")