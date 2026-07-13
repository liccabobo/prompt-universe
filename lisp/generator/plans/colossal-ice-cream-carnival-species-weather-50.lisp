(in-package #:prompt-universe)

;;; A layered expansion macro keeps the 50-item family readable while expanding
;;; to ordinary validator-inspectable defexpansion-plan mutation structures.
(defmacro defcarnival-species-weather-plan (name &body variants)
  `(defexpansion-plan ,name
     (:intent "fifty special-species carnival variants with coordinated palette, emotion, weather, landmark, outfit, and accessory changes")
     (:seed-control colossal-ice-cream-carnival-control)
     (:preserve
      :amusement-park-category :colossal-ice-cream-landmark
      :single-small-animal-focus :species-readability
      :extreme-scale-contrast :2d-anime-rendering
      :negative-space :anti-3d :anti-photography)
     (:forbid
      :repeated-species :generic-animal-anatomy
      :amusement-park-category-drift :subject-occlusion
      :weather-obscuring-subject :muddy-low-contrast
      :body-horror :photorealism :3d-rendering)
     (:variant-axes
      (:required :color-theme :theme-anchor :accessory-set)
      (:recommended :scene-shell :outfit-design :evolution-strategy :action :composition)
      (:theme-anchor-keys :secondary :background :scene-design :object-design)
      (:accessory-keys :accessory-design))
     (:mutations
      ,@(loop for variant in variants
              collect
              (destructuring-bind
                  (subtitle species emotion action weather palette anchor accessories)
                  variant
                `((:subtitle ,subtitle)
                  (:description-design
                   ,(format nil "a tiny ~A exploring a colossal ~A ice-cream amusement park"
                            species anchor))
                  (:creature-direction
                   ,(format nil "single ~A, ~A, ~A, distinctive species anatomy fully readable and unobstructed"
                            species emotion action))
                  (:outfit-design
                   ,(format nil "~A, adapted for ~A, fitted without hiding distinctive species anatomy"
                            accessories weather))
                  (:action ,action)
                  (:emotion ,emotion)
                  (:weather ,weather)
                  (:color-theme ,palette)
                  (:secondary
                   ,(format nil "colossal ~A soft-serve landmark towering above the preserved amusement-park rides, tiny windows and tracks establish immense scale"
                            anchor))
                  (:background
                   ,(format nil "the same fantasy ice-cream amusement park during ~A, open skyline, clear subject visibility, layered ride silhouettes"
                            weather))
                  (:scene-design
                   ,(format nil "fantasy ice-cream amusement park under ~A, waffle-cone ferris wheel, popsicle rail cars, sundae carousel, open paths, weather-responsive decorations"
                            weather))
                  (:object-design
                   ,(format nil "monumental ~A soft-serve tower with matching cone architecture, weather-readable edges, bold iconic silhouette"
                            anchor))
                  (:accessory-design ,accessories)
                  (:evolution-strategy
                   ,(format nil "the silhouette language of the ~A echoes the ~A landmark and ride motifs through graphic fusion only, no body mutation"
                            species anchor))
                  (:lighting
                   ,(format nil "~A translated through ~A, strong cool-warm separation, maximum focal contrast around the animal, crisp weather-readable silhouette"
                            weather palette))))))))

(defcarnival-species-weather-plan colossal-ice-cream-carnival-species-weather-50
  ("FENNEC SUNBURST" "fennec fox with enormous upright ears" "wide-eyed excitement"
   "springing beside the ticket gate with both ears lifted toward the rides"
   "clear sunrise with brisk pennant wind"
   "sunflower yellow, electric cobalt, coral red, vanilla white, deep navy"
   "citrus-sherbet sunrise" "cobalt neckerchief, sun-token pouch, pinwheel ticket, citrus-star sprinkles")

  ("SUGAR GLIDER THUNDER" "sugar glider with a visible dark dorsal stripe and folded gliding membrane" "thrilled anticipation"
   "balancing on a low railing while watching distant lightning"
   "violet thunderclouds with dry foreground air"
   "ultraviolet purple, acid lime, silver white, hot pink, charcoal blue"
   "blackberry-lime thunder swirl" "lime rain cape, violet ticket satchel, lightning sugar rods, silver bell charm")

  ("MARMOSET RAINBOW" "pygmy marmoset with a tiny mane and curled tail" "delighted wonder"
   "pointing toward a fresh rainbow while the curled tail frames the pose"
   "sun shower ending in a bright rainbow"
   "turquoise, tangerine, orchid purple, warm cream, storm-gray blue"
   "tangerine-orchid sun-shower" "turquoise hoodlet, orange ticket purse, rainbow wafer flags, orchid candy beads")

  ("JERBOA MOONHOP" "long-eared jerboa with elongated hind legs and tufted tail" "mischievous confidence"
   "caught in a clean mid-hop over one painted path stripe"
   "clear moonlit night with drifting high clouds"
   "lunar silver, neon peach, midnight violet, glacier blue, ink black"
   "peach-moon gelato" "silver ankle ribbons, crescent ticket pouch, star wafer wand, blue sugar comets")

  ("PIKA FIRST SNOW" "American pika with round ears and compact mountain body" "quiet amazement"
   "holding one snowflake-shaped ticket between the forepaws"
   "gentle first snow with high visibility"
   "ice blue, persimmon orange, spruce green, snow white, aubergine shadow"
   "persimmon-snow cream" "spruce scarf, snowflake ticket case, orange wafer mittens, crystal sugar pebbles")

  ("QUOKKA AFTER RAIN" "quokka with rounded ears and a compact smiling muzzle" "radiant happiness"
   "stepping into one reflective puddle with open welcoming paws"
   "golden sunlight immediately after rain"
   "aqua cyan, hibiscus pink, mango gold, cloud white, petrol blue"
   "mango-hibiscus rain gloss" "aqua rain collar, mango ticket pouch, hibiscus umbrella charm, glossy candy droplets")

  ("RED PANDA LEAFWIND" "red panda with ringed tail and white facial markings" "playful curiosity"
   "reaching for a windblown admission ticket with the ringed tail arched"
   "crisp autumn wind with swirling leaves"
   "vermilion, teal green, mustard gold, cream, dark plum"
   "maple-caramel leaf swirl" "teal neckerchief, acorn ticket pouch, maple wafer fan, caramel ribbon curls")

  ("TENREC MISTLIGHT" "lesser hedgehog tenrec with fine golden spines and pointed snout" "cautious fascination"
   "peeking from behind a low candy bollard with spines clearly outlined"
   "pearl morning mist with clear foreground"
   "butter gold, mist lavender, mint cyan, pearl white, deep mulberry"
   "honey-lavender mist cream" "mint shoulder sash, honey ticket capsule, lavender sugar reeds, pearl drop charms")

  ("KINKAJOU STARFALL" "kinkajou with round ears and a prehensile tail" "breathless awe"
   "hanging safely from a low decorative arch while looking upward"
   "warm night with a meteor shower"
   "amber gold, fuchsia, deep teal, starlight white, midnight blue"
   "passionfruit-starlight swirl" "fuchsia waist sash, amber ticket purse, comet wafer streamers, teal star candies")

  ("LORIS FIREFLY HUSH" "slow loris with large round eyes and dark eye patches" "sleepy serenity"
   "sitting beneath a lantern and gently cupping one glowing ticket"
   "humid blue hour filled with sparse fireflies"
   "chartreuse glow, dusty rose, indigo blue, moon cream, near-black green"
   "rose-pandan twilight cream" "indigo capelet, glowing ticket locket, pandan wafer leaves, firefly sugar dots")

  ("PYGMY RABBIT DEW" "pygmy rabbit with tiny upright ears and compact paws" "fresh morning joy"
   "standing on hind paws to inspect a dew-bright ride map"
   "cool dawn with sparkling dew"
   "mint green, raspberry red, pale gold, porcelain white, forest teal"
   "raspberry-mint dew scoop" "raspberry bow collar, map-ticket pouch, mint wafer clovers, gold dew candies")

  ("FLYING SQUIRREL AURORA" "Japanese dwarf flying squirrel with round eyes and visible gliding membrane" "ecstatic freedom"
   "gliding between two very low safe platforms with membrane spread"
   "clear aurora night"
   "aurora green, arctic blue, neon pink, pearl white, polar navy"
   "aurora-soda float" "pink flight scarf, pearl ticket belt, aurora wafer ribbons, blue sugar stars")

  ("FERRET HAIL POP" "black-footed ferret with dark mask and black feet" "bold determination"
   "bracing cheerfully under a tiny striped awning"
   "brief sparkling hail with a bright horizon"
   "cherry red, icy cyan, corn yellow, bright white, dark graphite"
   "cherry-ice pop swirl" "yellow storm vest, cherry ticket case, ice-pop baton, cyan hail candies")

  ("GENET DRIZZLE DASH" "common genet with spotted coat and long banded tail" "focused excitement"
   "trotting along the path as the banded tail curves behind"
   "fine silver drizzle at midday"
   "copper orange, peacock blue, lilac, silver white, espresso brown"
   "copper-mocha drizzle cream" "peacock rain scarf, copper ticket wallet, lilac wafer parasol, silver sugar chains")

  ("MEERKAT HEATWAVE" "meerkat with dark eye patches and upright lookout posture" "alert amusement"
   "standing tall on a cool candy platform to survey the park"
   "shimmering summer heat with clear sky"
   "hot orange, pool cyan, lemon lime, chalk white, deep burgundy"
   "orange-lime heatwave sorbet" "cyan cooling band, lime ticket flask, orange wafer fan, burgundy candy compass")

  ("DIK-DIK BLOSSOM" "dik-dik fawn with oversized eyes and a tiny pointed muzzle" "gentle shyness"
   "taking one delicate step through drifting blossom confetti"
   "soft spring breeze with scattered blossoms"
   "blossom pink, jade green, saffron, ivory, wine red"
   "sakura-saffron cream" "jade flower collar, ivory ticket pouch, saffron wafer petals, pink sugar bells")

  ("PUDU CLOUDBREAK" "pudu fawn with short legs and rounded face" "newfound courage"
   "walking out from a striped canopy as sunlight returns"
   "dramatic cloudbreak after a storm"
   "pine green, flame orange, sky cyan, cream, thunder purple"
   "pineapple-cloudbreak swirl" "orange explorer scarf, cyan ticket pack, cloud wafer badges, purple sugar lantern")

  ("PANGOLIN MONSOON" "pangolin pup with overlapping scales and curled tail" "steadfast calm"
   "crossing a covered candy bridge with the scaled tail visible"
   "warm monsoon rain beyond a protected foreground"
   "emerald, papaya orange, electric violet, rice white, deep teal"
   "papaya-coconut monsoon cream" "violet rain mantle, emerald ticket tube, coconut wafer shield, papaya sugar drops")

  ("ARMADILLO DUSTWIND" "armadillo pup with segmented armor bands and long ears" "scrappy enthusiasm"
   "rolling to a stop beside a route marker and popping upright"
   "sunny dry wind carrying sparse golden dust"
   "desert gold, electric turquoise, cactus green, coral, night brown"
   "salted-caramel cactus scoop" "turquoise route scarf, coral ticket holster, cactus wafer signs, gold candy wheels")

  ("LEMUR SUNSET SPIN" "young ring-tailed lemur with a long black-and-white tail" "giddy delight"
   "turning in a small dance with the ringed tail spiraling clearly"
   "fiery sunset with calm air"
   "sunset orange, royal purple, lagoon cyan, cream, black plum"
   "blood-orange sunset swirl" "cyan dance sash, purple ticket purse, spiral wafer rings, orange sugar suns")

  ("KIWI FOG PARADE" "kiwi chick with a long slender beak and fuzzy round body" "earnest curiosity"
   "leading a tiny one-animal parade along illuminated path dots"
   "low silver fog with a clear foreground corridor"
   "kiwi green, neon coral, fog silver, custard yellow, deep slate"
   "kiwi-custard fog cream" "coral parade sash, yellow ticket drum, green wafer pennants, silver candy lights")

  ("BLUE PENGUIN SLEET" "little blue penguin with slate-blue back and white belly" "cheerful resilience"
   "waddling beneath a tiny clear canopy with flippers spread"
   "light coastal sleet with crisp visibility"
   "marine blue, neon apricot, seafoam, white, dark navy"
   "apricot-sea-salt ice cream" "apricot storm cape, seafoam ticket pouch, wave wafer flags, blue sugar pearls")

  ("BURROWING OWL CROSSWIND" "burrowing owl with long legs and bright round eyes" "comical surprise"
   "leaning into a gust while gripping one ticket with a raised foot"
   "strong crosswind under brilliant sun"
   "cerulean, marigold, magenta, cream, dark olive"
   "marigold-blueberry wind swirl" "magenta flight collar, olive ticket clip, feather wafer arrows, blue candy spirals")

  ("PUFFIN SEA MIST" "Atlantic puffin with colorful triangular bill" "proud delight"
   "posing beside a cone-shaped sign with the bill in clear profile"
   "cool sea mist and intermittent sunlight"
   "puffin orange, ocean teal, violet, white, black blue"
   "orange-saltwater taffy scoop" "violet sailor scarf, teal ticket pouch, sail wafer flags, orange sugar shells")

  ("KAKAPO SUMMER RAIN" "kakapo chick with moss-green plumage and round owl-like face" "bashful happiness"
   "sheltering under a broad wafer leaf while peeking upward"
   "warm summer rain with sunlit droplets"
   "moss green, watermelon pink, lemon, aqua, deep fern"
   "watermelon-lemon rain cream" "pink rain bib, aqua ticket satchel, leaf wafer umbrella, lemon sugar drops")

  ("TARSIER ECLIPSE" "Philippine tarsier with enormous eyes and long fingers" "reverent astonishment"
   "perching on a low padded post while watching the sky"
   "partial solar eclipse with a luminous horizon"
   "eclipse black, solar gold, electric blue, crimson, pale ivory"
   "black-sesame solar swirl" "crimson eclipse cape, gold ticket medallion, crescent wafer discs, blue sugar halos")

  ("MOUSE DEER RAINFALL" "mouse deer with tiny hooves and delicate pointed face" "tender contentment"
   "tiptoeing between shallow puddles beneath hanging lights"
   "steady gentle rainfall at golden hour"
   "rosewood red, aqua blue, honey gold, pale mint, deep cocoa"
   "honey-rose rain sundae" "mint rain collar, honey ticket purse, rose wafer leaves, aqua candy puddles")

  ("CHINCHILLA FROST" "chinchilla with oversized round ears and dense silver fur" "cozy satisfaction"
   "warming the forepaws near a tiny safe lantern"
   "crisp frost at blue dawn"
   "frost silver, raspberry, turquoise, warm amber, midnight gray"
   "raspberry-frost gelato" "amber knit collar, turquoise ticket muff, silver wafer snowbursts, berry sugar buttons")

  ("DEGU SUNSHOWER" "degu with rounded ears and a tufted tail" "busy optimism"
   "carrying a miniature park map while hurrying toward the carousel"
   "bright sunshower with sparkling pavement"
   "chartreuse, cobalt, coral pink, white, burnt umber"
   "coral-citrus sunshower scoop" "cobalt map vest, chartreuse ticket roll, coral wafer compass, white sugar droplets")

  ("DORMOUSE GOLDEN HAZE" "hazel dormouse with golden fur and fluffy tail" "dreamy sleepiness"
   "curling briefly inside a large empty teacup ride seat"
   "warm late-afternoon haze"
   "honey gold, lilac, mint, strawberry red, deep chestnut"
   "honey-lilac dream cream" "mint sleep cape, strawberry ticket pillow, moon wafer charm, honey sugar stars")

  ("HARVEST MOUSE GALE" "harvest mouse with tiny paws and a prehensile tail" "fearless exhilaration"
   "holding a ribbon pole while the tail anchors around its base"
   "lively gale with racing white clouds"
   "poppy red, sky blue, lime, cream, navy black"
   "poppy-lime gale sorbet" "blue wind scarf, red ticket capsule, lime wafer ribbons, cream candy kites")

  ("PYGMY HEDGEHOG RIME" "African pygmy hedgehog with short patterned spines" "soft-spoken wonder"
   "sniffing a rime-covered sugar star beside the path"
   "sparkling rime frost under clear sunlight"
   "icy mint, hot coral, violet blue, snow white, dark pine"
   "coral-mint rime scoop" "violet ear cape, coral ticket pouch, mint wafer stars, white sugar crystals")

  ("STOAT WHITEOUT EDGE" "stoat with white winter coat and black tail tip" "intrepid focus"
   "following luminous path arrows with the black tail tip visible"
   "passing snow squall with a clear protected foreground"
   "signal red, glacier cyan, lemon, white, deep cobalt"
   "lemon-berry snow swirl" "red trail scarf, cobalt ticket pack, arrow wafer markers, cyan sugar beacons")

  ("MOUNTAIN WEASEL DAWN" "mountain weasel with golden coat and pale muzzle" "bright alertness"
   "standing lengthwise on a low cone rail to greet sunrise"
   "cold clear mountain dawn"
   "golden ochre, alpine cyan, plum, ivory, spruce black"
   "plum-alpine sunrise cream" "cyan climbing sash, plum ticket case, peak wafer flags, gold sugar rays")

  ("TAMARIN CLOUDGARDEN" "cotton-top tamarin with a dramatic white crest" "theatrical joy"
   "presenting a ticket with one hand while the white crest catches the breeze"
   "towering fair-weather clouds at noon"
   "cloud white, tropical cyan, guava pink, banana yellow, deep violet"
   "guava-banana cloud cream" "cyan show cape, violet ticket purse, cloud wafer fans, yellow sugar crowns")

  ("SQUIRREL MONKEY STORMGLOW" "squirrel monkey with white facial mask and long tail" "electric excitement"
   "pointing toward illuminated rides as storm clouds part"
   "distant storm with glowing sunset breaks"
   "electric orange, cobalt, lime green, silver, dark indigo"
   "orange-lime storm float" "cobalt storm vest, lime ticket band, silver wafer bolts, orange candy lights")

  ("TREE SHREW HUMID DAWN" "tree shrew with pointed snout and long straight tail" "eager curiosity"
   "sniffing the first open candy-ticket booth of the day"
   "humid tropical dawn with soft rising vapor"
   "papaya orange, rainforest teal, orchid, pale yellow, deep green"
   "papaya-orchid dawn scoop" "teal daybreak scarf, orchid ticket wallet, papaya wafer leaves, yellow sugar dew")

  ("ELEPHANT SHREW DUSTRAIN" "elephant shrew with elongated flexible snout and slender legs" "startled delight"
   "skipping away from the first large raindrop with snout lifted"
   "brief desert rain over warm ground"
   "terracotta, electric aqua, saffron, pearl gray, dark maroon"
   "saffron-aqua desert swirl" "aqua rain collar, terracotta ticket pouch, saffron wafer discs, gray candy droplets")

  ("NUMBAT CLEARSKY" "numbat with white back stripes and bushy tail" "confident cheer"
   "trotting across a striped crosswalk that echoes the coat pattern"
   "brilliant dry-season blue sky"
   "rust red, ultramarine, eucalyptus green, cream, charcoal"
   "eucalyptus-caramel clear-sky cream" "ultramarine neckerchief, rust ticket bag, striped wafer batons, green sugar leaves")

  ("BILBY NIGHT BREEZE" "bilby with very long ears and black-tipped tail" "gentle alertness"
   "listening beside a glowing route sign as both ears turn outward"
   "warm starry night with a soft breeze"
   "moon violet, neon cyan, desert peach, starlight white, ink navy"
   "peach-moonlight gelato" "cyan night cape, violet ticket pouch, star wafer map, peach sugar moons")

  ("BETTONG RAINBOW WIND" "bettong with compact kangaroo-like hind legs and long tail" "bouncy triumph"
   "landing from a small celebratory hop beneath ribbon arches"
   "windy post-rain rainbow weather"
   "emerald, scarlet, sapphire, gold, cloud white"
   "rainbow-jewel fruit swirl" "sapphire victory sash, gold ticket case, emerald wafer ribbons, scarlet candy medals")

  ("WOMBAT DUSTY SUNSET" "wombat joey with sturdy paws and square muzzle" "stubborn contentment"
   "sitting firmly in the path while admiring the glowing tower"
   "dusty rose sunset with calm air"
   "dusty rose, turquoise, amber, cream, deep brown"
   "rose-caramel sunset scoop" "turquoise work scarf, amber ticket pouch, block wafer tokens, rose sugar pebbles")

  ("KOALA EUCALYPTUS RAIN" "koala joey with fluffy ears and broad dark nose" "peaceful curiosity"
   "holding a decorative eucalyptus-shaped park map with both paws"
   "soft eucalyptus-scented rain"
   "eucalyptus green, bubblegum pink, rain blue, ivory, charcoal violet"
   "eucalyptus-berry rain cream" "pink rain cape, blue ticket pouch, leaf wafer map, ivory sugar blossoms")

  ("TASMANIAN DEVIL SQUALL" "Tasmanian devil joey with rounded ears and white chest band" "rowdy delight"
   "cheering into a harmless gust with paws planted wide"
   "fast coastal squall followed by sharp sunlight"
   "black cherry, neon yellow, ocean cyan, white, crimson"
   "black-cherry squall sorbet" "yellow storm band, cyan ticket case, wave wafer horns, crimson sugar sparks")

  ("RACCOON DOG RAINLANTERN" "raccoon dog pup with dark facial mask and fluffy coat" "cozy mischief"
   "peeking around a glowing lantern-shaped ticket machine"
   "evening drizzle with warm lantern reflections"
   "lantern orange, jade, royal blue, cream, dark plum"
   "orange-jade lantern cream" "blue rain hood, jade ticket pouch, lantern wafer charms, orange sugar droplets")

  ("BUSHBABY MOONRAIN" "bushbaby with enormous eyes and long hind legs" "enchanted surprise"
   "making a tiny vertical hop beneath moonlit raindrops"
   "light moonrain beneath broken clouds"
   "moon cyan, neon raspberry, citron, pearl white, deep purple"
   "raspberry-citron moon scoop" "purple moon cape, citron ticket locket, crescent wafer arcs, cyan sugar rain")

  ("SAND CAT MIRAGE" "sand cat kitten with wide-set ears and sandy striped coat" "skeptical curiosity"
   "pawing gently at a harmless reflected ride light on the path"
   "bright desert heat with a graphic mirage"
   "sand gold, electric blue, watermelon red, mint, dark umber"
   "watermelon-mint mirage cream" "blue cooling scarf, red ticket pouch, dune wafer fans, mint sugar gems")

  ("PALLAS CAT BLIZZARD" "Pallas's cat kitten with flat round face and dense gray coat" "grumpy determination"
   "marching through a shallow cleared snow path with tail held low"
   "colorful twilight blizzard beyond a sheltered foreground"
   "magenta, ice turquoise, warm gold, white, slate black"
   "golden-berry blizzard swirl" "turquoise snow mantle, gold ticket case, magenta wafer mitts, white candy drifts")

  ("CLOUDED LEOPARD TEMPEST" "clouded leopard cub with large cloud-shaped coat markings and long tail" "brave amazement"
   "standing on a low platform as illuminated clouds roll behind"
   "dramatic tropical tempest with a clear eye overhead"
   "jungle teal, electric violet, flame orange, pale cream, storm black"
   "orange-violet tempest scoop" "violet storm collar, teal ticket pack, cloud wafer shields, orange sugar bolts")

  ("BINTURONG MONSOON NIGHT" "binturong cub with shaggy black coat, pale whiskers, and prehensile tail" "calm fascination"
   "resting the forepaws on a low rail while lanterns reflect in rain"
   "deep monsoon night with warm sheltered lantern light"
   "near-black indigo, neon teal, ruby red, lantern gold, mist white"
   "ruby-coconut monsoon float" "teal lantern cape, ruby ticket pouch, coconut wafer lanterns, gold sugar rain"))
