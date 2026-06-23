#!/usr/bin/env python3
"""Generate matching-paw-pair-species-100 expansion plan — 100 pet-species duo variants."""

def esc(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"')


PETS = [
    ("corgi", "柯基犬", "dog", "lap"),
    ("shiba inu", "柴犬", "dog", "lap"),
    ("toy poodle", "玩具貴賓犬", "dog", "lap"),
    ("golden retriever", "黃金獵犬", "dog", "side"),
    ("siberian husky", "哈士奇", "dog", "side"),
    ("dachshund", "臘腸犬", "dog", "lap"),
    ("beagle", "米格魯", "dog", "lap"),
    ("french bulldog", "法國鬥牛犬", "dog", "lap"),
    ("pomeranian", "博美犬", "dog", "lap"),
    ("maltese", "瑪爾濟斯", "dog", "lap"),
    ("border collie", "邊境牧羊犬", "dog", "side"),
    ("samoyed", "薩摩耶", "dog", "side"),
    ("chihuahua", "吉娃娃", "dog", "palm"),
    ("australian shepherd", "澳洲牧羊犬", "dog", "side"),
    ("cavalier king charles spaniel", "騎士查理王小獵犬", "dog", "lap"),
    ("bernese mountain dog", "伯恩山犬", "dog", "side"),
    ("greyhound", "靈提犬", "dog", "side"),
    ("boston terrier", "波士頓㹴", "dog", "lap"),
    ("miniature schnauzer", "迷你雪納瑞", "dog", "lap"),
    ("labrador retriever", "拉布拉多", "dog", "side"),
    ("persian cat", "波斯貓", "cat", "lap"),
    ("siamese cat", "暹羅貓", "cat", "lap"),
    ("british shorthair", "英國短毛貓", "cat", "lap"),
    ("ragdoll cat", "布偶貓", "cat", "lap"),
    ("maine coon cat", "緬因貓", "cat", "side"),
    ("scottish fold cat", "蘇格蘭摺耳貓", "cat", "lap"),
    ("abyssinian cat", "阿比西尼亞貓", "cat", "lap"),
    ("russian blue cat", "俄羅斯藍貓", "cat", "lap"),
    ("bengal cat", "孟加拉貓", "cat", "lap"),
    ("sphynx cat", "斯芬克斯貓", "cat", "lap"),
    ("manx cat", "曼島貓", "cat", "lap"),
    ("norwegian forest cat", "挪威森林貓", "cat", "side"),
    ("turkish angora cat", "土耳其安哥拉貓", "cat", "lap"),
    ("munchkin cat", "曼赤肯貓", "cat", "lap"),
    ("calico domestic cat", "三花家貓", "cat", "lap"),
    ("holland lop rabbit", "荷蘭垂耳兔", "rabbit", "lap"),
    ("netherland dwarf rabbit", "荷蘭侏儒兔", "rabbit", "lap"),
    ("lionhead rabbit", "獅子兔", "rabbit", "lap"),
    ("flemish giant rabbit", "巨型花明兔", "rabbit", "side"),
    ("mini rex rabbit", "迷你雷克斯兔", "rabbit", "lap"),
    ("guinea pig", "天竺鼠", "rodent", "palm"),
    ("syrian hamster", "敘利亞倉鼠", "rodent", "palm"),
    ("dwarf hamster", "侏儒倉鼠", "rodent", "palm"),
    ("chinchilla", "龍貓", "rodent", "shoulder"),
    ("ferret", "雪貂", "rodent", "shoulder"),
    ("hedgehog", "刺蝟", "rodent", "palm"),
    ("sugar glider", "蜜袋鼯", "rodent", "shoulder"),
    ("gerbil", "沙鼠", "rodent", "palm"),
    ("fancy rat", "花枝鼠", "rodent", "shoulder"),
    ("degu", "八齒鼠", "rodent", "palm"),
    ("cockatiel", "玄鳳鸚鵡", "bird", "shoulder"),
    ("budgerigar", "虎皮鸚鵡", "bird", "shoulder"),
    ("lovebird", "愛情鳥", "bird", "shoulder"),
    ("african grey parrot", "非洲灰鸚鵡", "bird", "shoulder"),
    ("cockatoo", "葵花鸚鵡", "bird", "shoulder"),
    ("canary", "金絲雀", "bird", "finger"),
    ("zebra finch", "斑胸草雀", "bird", "finger"),
    ("macaw", "金剛鸚鵡", "bird", "shoulder"),
    ("dove", "鴿子", "bird", "shoulder"),
    ("sun conure", "太陽錐尾鸚鵡", "bird", "shoulder"),
    ("bearded dragon", "鬃獅蜥", "reptile", "arm"),
    ("leopard gecko", "豹紋守宮", "reptile", "palm"),
    ("corn snake", "玉米蛇", "reptile", "arm"),
    ("ball python", "球蟒", "reptile", "arm"),
    ("red-eared slider turtle", "巴西龜", "reptile", "lap"),
    ("tree frog", "樹蛙", "reptile", "palm"),
    ("crested gecko", "睫角守宮", "reptile", "shoulder"),
    ("green iguana", "綠鬣蜥", "reptile", "shoulder"),
    ("mini pig", "迷你豬", "farm", "side"),
    ("pygmy goat", "侏儒山羊", "farm", "side"),
    ("alpaca", "羊駝", "farm", "side"),
    ("llama", "駱馬", "farm", "side"),
    ("miniature horse", "迷你馬", "farm", "side"),
    ("shetland pony", "設得蘭矮馬", "farm", "side"),
    ("capybara", "水豚", "exotic", "side"),
    ("red panda", "小熊貓", "exotic", "lap"),
    ("river otter", "水獺", "exotic", "lap"),
    ("fennec fox", "耳廓狐", "exotic", "lap"),
    ("arctic fox", "北極狐", "exotic", "lap"),
    ("domestic duck", "家鴨", "bird-ground", "side"),
    ("silkie chicken", "絲羽雞", "bird-ground", "side"),
    ("goose", "鵝", "bird-ground", "side"),
    ("peacock", "孔雀", "bird-ground", "side"),
    ("homing pigeon", "信鴿", "bird", "shoulder"),
    ("axolotl", "墨西哥鈍口螈", "aquatic", "aquarium"),
    ("goldfish", "金魚", "aquatic", "aquarium"),
    ("betta fish", "鬥魚", "aquatic", "aquarium"),
    ("koi fish", "錦鯉", "aquatic", "pond"),
    ("seahorse", "海馬", "aquatic", "aquarium"),
    ("hermit crab", "寄居蟹", "aquatic", "palm"),
    ("tarantula", "狼蛛", "exotic", "palm"),
    ("snail", "蝸牛", "exotic", "palm"),
    ("squirrel", "松鼠", "wild", "shoulder"),
    ("chipmunk", "花栗鼠", "wild", "shoulder"),
    ("prairie dog", "草原犬鼠", "wild", "lap"),
    ("raccoon", "浣熊", "wild", "lap"),
    ("skunk", "臭鼬", "wild", "side"),
    ("deer fawn", "小鹿", "wild", "side"),
    ("flamingo", "紅鶴", "bird-ground", "side"),
    ("owl", "貓頭鷹", "bird", "shoulder"),
]

assert len(PETS) == 100, f"expected 100 pets, got {len(PETS)}"

PALETTES = [
    "buttercream yellow, sky blue, soft coral pink, clean ivory white",
    "navy stripe white, cherry red accent, rope cream, deck grey",
    "emerald green, golden yellow, rain-slicker cream, storm grey",
    "cranberry red, snow white, pine green, warm wool beige",
    "cocoa brown, latte cream, caramel gold, soft mocha shadow",
    "lavender mist, lilac petal, pearl white, twilight violet",
    "sunset orange, peach cream, coral blush, warm sand gold",
    "mint sage, eucalyptus green, soft linen, pale jade",
    "denim blue, chambray white, brass button gold, faded indigo",
    "mustard yellow, charcoal grey, cream canvas, rust accent",
]

SCENE_SHELLS = [
    "minimal cozy park bench lifestyle shell",
    "pastel cafe window corner lifestyle shell",
    "sunny garden path lifestyle shell",
    "soft living-room sofa lifestyle shell",
    "rooftop terrace breeze lifestyle shell",
    "farm meadow fence lifestyle shell",
    "bookstore reading nook lifestyle shell",
    "beach boardwalk morning lifestyle shell",
    "autumn leaf trail lifestyle shell",
    "winter window-seat lifestyle shell",
]

OUTFIT_THEMES = [
    ("sailor-stripe knit cardigan and mini skirt", "navy beret", "sailor"),
    ("yellow rain slicker and matching rain boots", "transparent rain hood", "rain"),
    ("cozy holiday knit sweater and plaid skirt", "pom-pom beanie", "holiday"),
    ("bakery apron over puff-sleeve blouse", "tall chef toque", "bakery"),
    ("camping vest over striped tee", "olive bucket hat", "camping"),
    ("preppy blazer and pleated skirt", "newsboy cap", "preppy"),
    ("denim overalls over striped shirt", "straw sun hat", "denim"),
    ("pastel hoodie and jogger set", "knit beanie", "street"),
    ("floral sundress with puff sleeves", "wide-brim straw hat", "garden"),
    ("quilted puffer vest and corduroy skirt", "earflap trapper hat", "winter"),
]

POSE = {
    "lap": "owner sitting with pet on lap, both facing camera, matching outfits clearly visible",
    "side": "owner standing with pet at side, leash or ribbon lead visible, both facing camera",
    "palm": "owner holding small pet in both palms at chest height, matching micro-outfit visible",
    "shoulder": "pet perched on owner shoulder, both facing camera, matching hat and outfit readable",
    "finger": "tiny pet perched on owner finger near face, matching micro-hat visible",
    "arm": "pet resting along owner forearm, matching scaled costume visible",
    "aquarium": "owner kneeling beside glass aquarium, pet visible inside wearing matching micro-costume reflection",
    "pond": "owner at koi pond edge, pet in shallow water with matching scaled vest and hat",
}


def pet_design(species_en: str, category: str) -> str:
    return (
        f"cute stylized anime {species_en}, species-accurate silhouette, expressive anime eyes, "
        f"readable {category} anatomy, friendly energy, no copyrighted character likeness"
    )


def outfit_block(theme: tuple, species_en: str) -> tuple[str, str]:
    outfit, hat, _ = theme
    return (
        f"matching {outfit} on owner, scaled-down identical {outfit} on {species_en}, "
        f"same trim direction, same button or seam logic, twin costume reads as one coordinated design system",
        f"matching {hat} on owner, scaled-down identical {hat} on {species_en}, "
        f"same tilt angle, hat scale adapted to species head while preserving identical silhouette",
    )


def mutation_block(i: int, pet: tuple) -> str:
    species_en, species_zh, category, pose_key = pet
    palette = PALETTES[i % len(PALETTES)]
    shell = SCENE_SHELLS[i % len(SCENE_SHELLS)]
    theme = OUTFIT_THEMES[i % len(OUTFIT_THEMES)]
    outfit, hat, theme_tag = theme
    bg = (
        f"{shell.replace(' lifestyle shell', '')} scene, soft lifestyle editorial atmosphere, "
        f"clean negative space, sparse themed accents for {theme_tag} duo styling"
    )
    outfit_txt, hat_txt = outfit_block(theme, species_en)
    secondary = (
        f"{shell}, soft domestic negative space, clean duo subject isolation, "
        f"premium cute-magazine hierarchy themed for {species_en} pairing"
    )
    evolution = (
        f"owner outfit panels echo {species_en} costume geometry, hat brim rhythm mirrors across species scale, "
        f"{theme_tag} fabric logic aligns on both bodies, graphic twin-costume harmony only, "
        f"not body mutation, not humanoid pet transformation"
    )
    thematic = (
        f"themed ribbon lead for {species_en}, tiny {theme_tag} charm tag, "
        f"single lifestyle prop matching {theme_tag} anchor"
    )
    action = (
        f"{POSE[pose_key]}, relaxed twin-costume pose, gentle eye contact with viewer, "
        f"species-appropriate scale maintained"
    )
    composition = (
        f"duo portrait centered, owner and {species_en} both readable, matching outfits as focal hierarchy, "
        f"soft background separation, hats aligned for visual rhyme"
    )
    lighting = (
        f"soft lifestyle key light with {palette.split(',')[0].strip()} accent fill, "
        f"controlled hat-rim highlight, clean shadow separation"
    )
    subtitle = f"Twin Tail Couture — {species_zh}"

    lines = [
        f"   ((:subtitle \"{esc(subtitle)}\")",
        f"    (:color-theme \"{esc(palette)}\")",
        f"    (:secondary \"{esc(secondary)}\")",
        f"    (:background \"{esc(bg)}\")",
        f"    (:pet-design \"{esc(pet_design(species_en, category))}\")",
        f"    (:matching-outfit-design \"{esc(outfit_txt)}\")",
        f"    (:matching-hat-design \"{esc(hat_txt)}\")",
        f"    (:evolution-strategy \"{esc(evolution)}\")",
        f"    (:thematic-symbol \"{esc(thematic)}\")",
        f"    (:action \"{esc(action)}\")",
        f"    (:composition \"{esc(composition)}\")",
        f"    (:lighting \"{esc(lighting)}\"))",
    ]
    return "\n".join(lines)


mutations = "\n\n".join(mutation_block(i, pet) for i, pet in enumerate(PETS))

plan = f"""(in-package #:prompt-universe)

(defexpansion-plan matching-paw-pair-species-100
  (:intent "one hundred matching-outfit duo variants swapping pet species while preserving twin-costume premise")
  (:source matching-paw-pair)
  (:preserve :primary :title :owner-design :negative :camera :quality :negative-space-guidance)
  (:variant-axes
   (:required :color-theme :theme-anchor :accessory-set)
   (:recommended :scene-shell :outfit-design :evolution-strategy :action :composition)
   (:theme-anchor-keys :secondary :background :evolution-strategy :pet-design :subtitle)
   (:accessory-keys :thematic-symbol))
  (:mutations
{mutations}))
"""

out_path = "lisp/generator/plans/matching-paw-pair-species-100.lisp"
with open(out_path, "w", encoding="utf-8") as f:
    f.write(plan)
print(f"Wrote {out_path} with {len(PETS)} mutations")