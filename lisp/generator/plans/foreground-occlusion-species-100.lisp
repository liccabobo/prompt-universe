(in-package #:prompt-universe)

(defparameter *foreground-occlusion-species*
  '(("orchid mantis" "petal-like forelegs, folded orchid wing planes, porcelain insect elegance")
    ("ruby-throated hummingbird" "rapid wing fan blur, jewel throat flare, needle-beak diagonal rhythm")
    ("glasswing dragonfly" "transparent veined wing panes, long body line, quick diagonal flight rhythm")
    ("lotus petal cluster" "overlapping petal shields, radial bloom geometry, luminous soft edges")
    ("peacock feather fan" "eye-spotted feather arcs, emerald sapphire shimmer, ornamental curve rhythm")
    ("moon jellyfish bell" "soft translucent bell rim, trailing tendril lines, milky aquatic glow")
    ("crystal fern frond" "repeating fern leaflets, botanical lace shadow, prism dew edges")
    ("opal betta fish" "flowing fin veil, watery fan curves, pearlescent fin translucency")
    ("translucent luna moth" "long crescent wing arcs, pale green veil texture, soft tail filaments")
    ("scarlet maple leaf spray" "layered serrated leaves, crimson translucent veins, wind-swept fan shape")
    ("blue morpho butterfly" "electric blue wing plane, black velvet rim, single luminous wing edge")
    ("white egret wing" "clean feather fan, long white plume curve, quiet marsh elegance")
    ("golden koi fin" "silk-like fin membrane, amber scale glints, rippling waterline curve")
    ("jade leaf insect" "leaf-mimic body silhouette, crisp green veins, delicate camouflage geometry")
    ("coral sea fan" "branching lace silhouette, reef-pink translucent edges, fan-like organic screen")
    ("violet iris petals" "folded iris planes, violet-gold throat marks, soft botanical overlap")
    ("cicada wing" "clear veined membrane, amber body kept outside frame, summer-glass translucency")
    ("snow owl feather" "broad white feather edge, charcoal speckle rhythm, silent winter softness")
    ("tiger lily stamen cluster" "orange petal flare, dark freckle pattern, arcing pollen filaments")
    ("emerald swallowtail wing" "green-black wing window, tapered tail curve, jewel insect elegance")))

(defparameter *foreground-occlusion-subtitle-species*
  '("ORCHID MANTIS"
    "HUMMINGBIRD"
    "GLASSWING DRAGONFLY"
    "LOTUS PETAL"
    "PEACOCK FAN"
    "MOON JELLYFISH"
    "CRYSTAL FERN"
    "OPAL BETTA"
    "LUNA MOTH"
    "SCARLET MAPLE"
    "BLUE MORPHO"
    "WHITE EGRET"
    "GOLDEN KOI"
    "JADE LEAF"
    "CORAL SEA FAN"
    "VIOLET IRIS"
    "CICADA WING"
    "SNOW OWL"
    "TIGER LILY"
    "EMERALD SWALLOWTAIL"))

(defparameter *foreground-occlusion-palettes*
  '("coral rose, deep teal, pearl white, soft gold, ink shadow"
    "imperial violet, pale lime, champagne cream, dusk indigo, warm ivory"
    "jade green, rose quartz, porcelain white, graphite grey, mist silver"
    "cobalt blue, apricot orange, moon ivory, soft charcoal, pale cyan"
    "magenta orchid, mint glow, blue-black velvet, crystal white, blush gold"
    "sapphire blue, amber honey, cream silk, moss black, translucent aqua"
    "plum wine, celadon green, pearl beige, antique gold, smoky lavender"
    "turquoise lagoon, cherry red, shell pink, deep navy, silver mist"
    "butter yellow, iris violet, milk white, olive shadow, pale lilac"
    "emerald teal, peach bloom, porcelain blue, dark umber, prism white"))

(defparameter *foreground-occlusion-scenes*
  '("minimal jade window chamber, quiet carved screen hints, soft negative space, restrained museum calm"
    "moonlit glass conservatory, blurred botanical panels, clean air volume, poetic editorial stillness"
    "lacquered rain veranda, wet wooden rail glow, distant garden shadow, elegant open space"
    "porcelain bathhouse alcove, pale tile reflection, soft steam veil, sparse luxury atmosphere"
    "silk curtain studio, translucent drapery planes, quiet shadow folds, premium magazine restraint"
    "antique mirror pavilion, muted reflective panels, delicate depth, calm ceremonial symmetry"
    "misty lotus reading room, low shelves dissolving into haze, pale paper glow, clean composition"
    "velvet dusk theater box, dark proscenium curve, warm rim glow, minimal dramatic void"
    "sunlit bamboo corridor, vertical green rhythm, warm floor reflection, airy negative space"
    "pearl rain greenhouse, glass roof blur, silver droplets, gentle botanical depth"))

(defparameter *foreground-occlusion-subtitle-scenes*
  '("JADE WINDOW"
    "GLASS CONSERVATORY"
    "RAIN VERANDA"
    "PORCELAIN ALCOVE"
    "SILK CURTAIN"
    "MIRROR PAVILION"
    "LOTUS READING ROOM"
    "VELVET THEATER"
    "BAMBOO CORRIDOR"
    "RAIN GREENHOUSE"))

(defparameter *foreground-occlusion-actions*
  '("upper torso portrait, body turned three-quarters, face looking directly toward the camera, one hand lightly touching the collarbone, relaxed fingers, poised intimate stillness"
    "upper torso portrait, shoulders angled away, face turning back toward the lens, one hand hovering near the cheek without touching the foreground species, elegant wrist line"
    "upper torso portrait, chin slightly lowered, visible eye locked on the camera, one hand softly lifting a sleeve edge, calm graceful tension"
    "upper torso portrait, body leaning subtly toward the window light, one hand resting near the jawline, relaxed fingertips, refined cinematic quiet"
    "upper torso portrait, face framed by a lifted sleeve, one hand near the temple, fingers naturally separated, quiet seductive editorial gaze"
    "upper torso portrait, neck elongated, shoulders relaxed, one hand touching a hair ornament, delicate finger anatomy, composed romantic pause"
    "upper torso portrait, body turned sideways, face calmly returning to camera, one hand near the lips in a restrained thinking gesture, soft emotional intimacy"
    "upper torso portrait, head tilted slightly under transmitted light, one hand placed over the upper chest, relaxed palm, elegant vulnerable stillness"
    "upper torso portrait, face close to the foreground occlusion plane, one hand gently holding the robe edge, clean silhouette, calm magnetic gaze"
    "upper torso portrait, body in a soft diagonal pose, visible hand extended slightly forward but behind the foreground blur, graceful non-contact gesture"))

(defparameter *foreground-occlusion-species-catalog*
  '(("orchid mantis" "ORCHID MANTIS" "petal-like forelegs, folded orchid wing planes, porcelain insect elegance")
    ("ruby-throated hummingbird" "RUBY HUMMINGBIRD" "rapid wing fan blur, jewel throat flare, needle-beak diagonal rhythm")
    ("glasswing dragonfly" "GLASSWING DRAGONFLY" "transparent veined wing panes, long body line, quick diagonal flight rhythm")
    ("lotus petal cluster" "LOTUS PETAL" "overlapping petal shields, radial bloom geometry, luminous soft edges")
    ("peacock feather fan" "PEACOCK FEATHER" "eye-spotted feather arcs, emerald sapphire shimmer, ornamental curve rhythm")
    ("moon jellyfish bell" "MOON JELLYFISH" "soft translucent bell rim, trailing tendril lines, milky aquatic glow")
    ("crystal fern frond" "CRYSTAL FERN" "repeating fern leaflets, botanical lace shadow, prism dew edges")
    ("opal betta fish" "OPAL BETTA" "flowing fin veil, watery fan curves, pearlescent fin translucency")
    ("translucent luna moth" "LUNA MOTH" "long crescent wing arcs, pale green veil texture, soft tail filaments")
    ("scarlet maple leaf spray" "SCARLET MAPLE" "layered serrated leaves, crimson translucent veins, wind-swept fan shape")
    ("blue morpho butterfly" "BLUE MORPHO" "electric blue wing plane, black velvet rim, single luminous wing edge")
    ("white egret" "WHITE EGRET" "clean feather fan, long white plume curve, quiet marsh elegance")
    ("golden koi" "GOLDEN KOI" "silk-like fin membrane, amber scale glints, rippling waterline curve")
    ("jade leaf insect" "JADE LEAF INSECT" "leaf-mimic body silhouette, crisp green veins, delicate camouflage geometry")
    ("coral sea fan" "CORAL SEA FAN" "branching lace silhouette, reef-pink translucent edges, fan-like organic screen")
    ("violet iris blossom" "VIOLET IRIS" "folded iris planes, violet-gold throat marks, soft botanical overlap")
    ("amber cicada" "AMBER CICADA" "clear veined membrane, amber body kept outside frame, summer-glass translucency")
    ("snow owl" "SNOW OWL" "broad white feather edge, charcoal speckle rhythm, silent winter softness")
    ("tiger lily" "TIGER LILY" "orange petal flare, dark freckle pattern, arcing pollen filaments")
    ("emerald swallowtail butterfly" "EMERALD SWALLOWTAIL" "green-black wing window, tapered tail curve, jewel insect elegance")
    ("monarch butterfly" "MONARCH BUTTERFLY" "ember-orange wing cells, black lattice rim, warm translucent glow")
    ("atlas moth" "ATLAS MOTH" "large russet wing map, triangular window marks, velvet nocturne scale")
    ("damselfly" "DAMSELFLY" "thin paired wings, delicate blue body line, vertical hovering stillness")
    ("green lacewing" "GREEN LACEWING" "pale netted wings, fine antenna curves, fragile glass-green shimmer")
    ("firefly" "FIREFLY" "small lantern abdomen, soft dotted glow, disciplined nocturne spacing")
    ("ladybird beetle" "LADYBIRD BEETLE" "red shell curve, black dot rhythm, glossy miniature shield")
    ("jewel beetle" "JEWEL BEETLE" "metallic wing covers, emerald copper flash, hard oval silhouette")
    ("scarab beetle" "SCARAB BEETLE" "polished shell plates, ceremonial wing cover geometry, compact emblematic form")
    ("orchid bee" "ORCHID BEE" "turquoise metallic body, transparent wing flicker, pollen-spark softness")
    ("paper wasp" "PAPER WASP" "amber wing membrane, narrow waist silhouette, graphic stripe rhythm")
    ("black swan" "BLACK SWAN" "dark feather arc, ivory highlight rim, elegant curved neck shadow")
    ("red-crowned crane" "RED-CROWNED CRANE" "white wing plane, black feather tips, red crown accent")
    ("kingfisher" "KINGFISHER" "cobalt orange flash, compact wing blur, river-jewel color split")
    ("scarlet macaw" "SCARLET MACAW" "red yellow blue feather bands, tropical fan rhythm, glossy plume edge")
    ("mandarin duck" "MANDARIN DUCK" "layered sail feathers, orange teal accents, ornamental waterfowl curve")
    ("silver pheasant" "SILVER PHEASANT" "striped tail fan, pale feather shimmer, long ornamental sweep")
    ("flamingo" "FLAMINGO" "coral plume mass, slender neck curve, soft pink feather veil")
    ("raven" "RAVEN" "black wing fan, blue-violet feather sheen, sharp shadow contour")
    ("barn owl" "BARN OWL" "heart-face pale feathers, speckled wing veil, quiet nocturnal softness")
    ("quail" "QUAIL" "small mottled feather cluster, warm earth speckles, soft round silhouette")
    ("seahorse" "SEAHORSE" "curled tail geometry, translucent fin crest, floating aquarium grace")
    ("lionfish" "LIONFISH" "striped fin spines, radial fan silhouette, dramatic reef elegance")
    ("manta ray" "MANTA RAY" "wide wing-like fins, slow gliding curve, undersea shadow plane")
    ("nautilus" "NAUTILUS" "spiral shell chamber, cream amber shell bands, mathematical ocean geometry")
    ("scallop shell" "SCALLOP SHELL" "ribbed shell fan, pearl edge glow, symmetrical coastal arc")
    ("sea anemone" "SEA ANEMONE" "soft tentacle bloom, aquatic radial fringe, gentle reef motion")
    ("starfish" "STARFISH" "five-arm coral silhouette, sand-textured dots, calm tidepool geometry")
    ("sea slug" "SEA SLUG" "ruffled mantle edge, neon soft body color, flowing ribbon frill")
    ("flying fish" "FLYING FISH" "transparent side fins, silver body streak, wave-leap diagonal")
    ("glass shrimp" "GLASS SHRIMP" "clear tail fan, fine antenna lines, watery prism transparency")
    ("cherry blossom branch" "CHERRY BLOSSOM" "pale pink petal clusters, slender dark branch, spring veil overlap")
    ("wisteria cascade" "WISTERIA CASCADE" "hanging violet flower chains, soft pendulum rhythm, fragrant vertical veil")
    ("camellia blossom" "CAMELLIA BLOSSOM" "rounded wax petals, deep red-pink center, polished botanical mass")
    ("magnolia blossom" "MAGNOLIA BLOSSOM" "large ivory petals, sculptural cup form, clean spring silhouette")
    ("lotus leaf" "LOTUS LEAF" "round green shield, radial vein map, dew-lit botanical disk")
    ("ginkgo leaves" "GINKGO LEAVES" "fan-shaped yellow leaves, forked vein pattern, autumn graphic rhythm")
    ("bamboo leaves" "BAMBOO LEAVES" "slender green blades, diagonal brush rhythm, airy linear screen")
    ("eucalyptus sprig" "EUCALYPTUS SPRIG" "round silver-green leaves, matte herbal softness, calm repeating discs")
    ("maple samara" "MAPLE SAMARA" "paired wing seeds, amber translucent veins, spinning autumn motion")
    ("silver grass plume" "SILVER GRASS" "soft feathery seed heads, pale moonlit fibers, wind-swept haze")
    ("monstera leaf" "MONSTERA LEAF" "large cut leaf silhouette, tropical window holes, glossy green plane")
    ("fern fiddlehead" "FERN FIDDLEHEAD" "spiral young frond, moss-green curl, botanical coil rhythm")
    ("pine needles" "PINE NEEDLES" "thin evergreen clusters, resin-dark points, winter graphic fan")
    ("moss cushion" "MOSS CUSHION" "velvet green micro-mass, soft rounded texture, quiet forest edge")
    ("mushroom cap" "MUSHROOM CAP" "rounded cap rim, ivory gill shadow, forest fairy silhouette")
    ("dandelion seed head" "DANDELION SEED" "transparent seed sphere, fine parachute filaments, airy white halo")
    ("hydrangea cluster" "HYDRANGEA CLUSTER" "small petal discs, blue violet massing, soft garden cloud")
    ("peony blossom" "PEONY BLOSSOM" "dense layered petals, blush rose folds, luxurious floral volume")
    ("chrysanthemum blossom" "CHRYSANTHEMUM" "many narrow petals, radial gold-white burst, ceremonial flower geometry")
    ("willow branch" "WILLOW BRANCH" "long hanging leaves, soft green curtain, melancholy vertical flow")
    ("butterfly pea blossom" "BUTTERFLY PEA" "deep blue folded petals, pale throat accent, small botanical wing shape")
    ("agate snail" "AGATE SNAIL" "spiral striped shell, slow antenna curve, glossy earth-toned body")
    ("panther chameleon" "PANTHER CHAMELEON" "curled tail, color-banded body, sculptural reptile silhouette")
    ("day gecko" "DAY GECKO" "tiny toe pads, green body curve, red speckled back pattern")
    ("axolotl" "AXOLOTL" "soft external gill frills, pale aquatic body, gentle amphibian halo")
    ("fire salamander" "FIRE SALAMANDER" "black yellow body marks, curved tail line, glossy forest contrast")
    ("tree frog" "TREE FROG" "rounded toe pads, bright green limb curve, soft amphibian perch")
    ("silver fox tail" "SILVER FOX" "fluffy silver tail edge, dark guard hair gradient, elegant mammal sweep")
    ("arctic hare ear" "ARCTIC HARE" "long white ear plane, soft fur rim, winter animal gentleness")
    ("sika deer antler" "SIKA DEER" "branching antler arc, spotted deer coat hint, woodland ceremonial shape")
    ("red squirrel tail" "RED SQUIRREL" "warm russet tail plume, curled fur rhythm, playful woodland curve")
    ("flying squirrel membrane" "FLYING SQUIRREL" "soft gliding membrane, round eye hint, stretched crescent silhouette")
    ("ring-tailed lemur tail" "RING-TAILED LEMUR" "black white tail bands, curved graphic stripe rhythm, playful diagonal arc")
    ("fennec fox ear" "FENNEC FOX" "large sandy ear plane, pale fur glow, desert-soft triangular shape")
    ("lynx tufted ear" "LYNX" "pointed ear tuft, spotted fur edge, quiet wildcat silhouette")
    ("red panda tail" "RED PANDA" "striped russet tail, soft rounded fur, warm forest charm")
    ("ermine winter coat" "ERMINE" "white fur ribbon, black tail tip, crisp winter contrast")
    ("copper maple moth" "COPPER MAPLE MOTH" "copper wing dust, leaf-like moth shape, warm nocturne shimmer")
    ("pearl orchid spider" "PEARL ORCHID SPIDER" "petal-like leg arcs, pearl abdomen, non-horror lace geometry")
    ("blue emperor dragonfly" "BLUE EMPEROR DRAGONFLY" "long blue body, glass wing cross, fast pond-flight angle")
    ("golden stag beetle" "GOLDEN STAG BEETLE" "arched mandible silhouette, metallic shell, emblematic beetle profile")
    ("rosy maple moth" "ROSY MAPLE MOTH" "pink yellow fuzzy wing mass, candy-soft nocturnal palette, plush antennae")
    ("paper kite butterfly" "PAPER KITE BUTTERFLY" "black white translucent wing pattern, slow floating fan, clean tropical graphic")
    ("orchid cactus flower" "ORCHID CACTUS" "long satin petals, hot pink throat, dramatic night-bloom curve")
    ("queen protea blossom" "QUEEN PROTEA" "large crown petals, dusty rose bracts, sculptural botanical shield")
    ("banksia cone" "BANKSIA CONE" "cylindrical seed cone, fine golden bristles, dry botanical texture")
    ("passionflower vine" "PASSIONFLOWER" "radial purple filaments, curling vine tendrils, complex floral clock")
    ("water lily pad" "WATER LILY PAD" "floating round leaf, notched edge, glossy pond reflection")
    ("bleeding heart flower" "BLEEDING HEART" "hanging heart-shaped blossoms, pink white droplets, tender chain rhythm")
    ("ghost orchid" "GHOST ORCHID" "pale floating petals, delicate root tendrils, spectral botanical grace")))

(defun foreground-occlusion-species-entry (index)
  (or (nth index *foreground-occlusion-species-catalog*)
      (error "Missing foreground occlusion species catalog entry for index ~D" index)))

(defun validate-foreground-occlusion-species-catalog ()
  (let* ((names (mapcar #'first *foreground-occlusion-species-catalog*))
         (duplicates (loop for name in names
                           when (> (count name names :test #'string=) 1)
                             collect name)))
    (unless (= (length *foreground-occlusion-species-catalog*) 100)
      (error "FOREGROUND-OCCLUSION species catalog must contain 100 entries, got ~D"
             (length *foreground-occlusion-species-catalog*)))
    (when duplicates
      (error "FOREGROUND-OCCLUSION species catalog has duplicate entries: ~{~A~^, ~}"
             (remove-duplicates duplicates :test #'string=)))))

(defun foreground-occlusion-subtitle (index)
  (format nil "~A ~A"
          (second (foreground-occlusion-species-entry index))
          (nth (mod (floor index 10)
                    (length *foreground-occlusion-subtitle-scenes*))
               *foreground-occlusion-subtitle-scenes*)))

(defun foreground-occlusion-species-mutation (index)
  (let* ((species-entry (foreground-occlusion-species-entry index))
         (species (first species-entry))
         (motif (third species-entry))
         (palette (nth (mod (+ index (floor index 10))
                            (length *foreground-occlusion-palettes*))
                       *foreground-occlusion-palettes*))
         (scene (nth (mod (floor index 10)
                          (length *foreground-occlusion-scenes*))
                     *foreground-occlusion-scenes*))
         (action (nth (mod (+ (* 3 index) (floor index 10))
                           (length *foreground-occlusion-actions*))
                      *foreground-occlusion-actions*)))
    `((:subtitle-must-only . ,(foreground-occlusion-subtitle index))
      (:color-design . ,palette)
      (:pose-design . ,action)
      (:creature-direction . ,(format nil "a complete normal-sized ~A remains anatomically coherent and mostly outside the camera frame, the lens naturally crops the near foreground edge through perspective only, never severing the body, root, stem, wing base, fin base, feather shaft, petal base, or limb, only one soft translucent edge enters the image as elegant optical occlusion" species))
      (:foreground-composition . ,(format nil "a complete ~A moves extremely close to the camera lens while remaining mostly outside the image boundaries, the visible foreground portion uses ~A, the occluding edge naturally covers about one third of the face including one eye, the opposite eye remains fully visible, elegant foreground blur, cinematic lens occlusion, premium photographic layering, transmitted prism light through the foreground material, the foreground subject reads as one intact living or botanical form rather than a detached fragment" species motif))
      (:scene-design . ,scene)
      (:outfit-design . ,(format nil "luxury Song Dynasty inspired hanfu adapted to the ~A palette, broad coherent silk surfaces, restrained embroidery echoing ~A, translucent accent layers, minimal ornamentation, elegant editorial silhouette" species motif))
      (:design-evolution-strategy . ,(format nil "compress architecture, costume, lighting and composition into one unified visual language, foreground occlusion becomes visual storytelling through the complete ~A, use ~A to drive palette, pose, costume accent, scene shell, foreground blur, transmitted prism light, and negative-space rhythm, preserve facial beauty, complete anatomy, natural lens crop, restrained ornamentation, elegant simplicity" species motif))
      (:latent-exploration . ,(format nil "prioritize artistic photographic composition over literal specimen display, the complete ~A creates emotional foreground storytelling, preserve facial beauty and clear eye contact, allow elegant cinematic framing, refined romantic atmosphere, unexpected but controlled editorial outcome" species))
      (:secondary . ,(format nil "large coherent color masses from ~A, simplified portrait composition, restrained decorative density, broad atmospheric perspective, elegant negative space, foreground rhythm shaped by the complete ~A" palette species))
      (:tertiary . ,(format nil "palette-matched transmitted light from ~A, luminous skin scattering, creamy indirect illumination, elegant ambient haze, subtle cinematic depth, delicate translucent foreground edge from the complete ~A, softly glowing backlit hair" palette species))
      (:light-transport . ,(format nil "soft atmospheric diffusion, creamy global illumination, feathered shadow transitions, natural facial light wrapping, subtle volumetric softness, gentle color bleeding, prism light transmitting through the intact foreground ~A and fine hair strands, elegant subsurface glow" species))
      (:lighting . ,(format nil "beautiful complementary-color lighting based on ~A, soft facial fill light, elegant rim light, cinematic backlighting, creamy editorial illumination, delicate transmitted prism glow through the foreground ~A" palette species))
      (:quality-design . "extremely low-frequency rendering, oversized brush grouping, broad color transitions, grouped hair rendering, grouped fabric rendering, minimal texture fragmentation, nearly invisible contours, smooth painterly gradients, restrained translucent pigment diffusion, restrained prism diffusion, delicate iridescent bloom, subtle spectral highlights, premium museum-quality illustration finish")
      (:negative . ,(format nil "3D, photorealistic, CGI, anime cel shading, comic outlines, manga line art, heavy contour lines, sketch lines, cross hatching, detached foreground part, isolated wing, isolated petal, isolated feather, isolated fin, fragmented animal, fragmented insect, fragmented plant, broken wings, torn petals, cropped anatomy through the body, damaged creature anatomy, severed stem, severed limb, cut-in-half foreground subject, foreground subject attached to the face, oversized foreground subject, swarm, cluttered composition, busy background, excessive ornaments, micro-details, noisy textures, fragmented rendering, broken anatomy, malformed hands, extra fingers, missing fingers, merged fingers, duplicated hands, incorrect thumbs, floating fingers, twisted wrists, distorted eyes, harsh shadows, clipped highlights, muddy colors, oversaturated lighting, watermark, logo, signature, additional text")))))

(defun foreground-occlusion-species-mutations ()
  (validate-foreground-occlusion-species-catalog)
  (loop for i from 0 below 100
        collect (foreground-occlusion-species-mutation i)))

(register-expansion-plan
 'foreground-occlusion-species-100
 (make-expansion-plan
  :name 'foreground-occlusion-species-100
  :intent "one hundred standalone foreground occlusion editorial portrait variants with changed color design, foreground species, action, scene shell, and prism-accented complementary palettes"
  :seed-id "portrait-editorial/FOREGROUND-OCCLUSION"
  :preserve '(:title :text-control :typography-design :face-design :hair-design
              :rendering-style :primary :camera)
  :forbid '("same as original"
            "based on previous"
            "replace original"
            "old prompt"
            "detached foreground part"
            "fragmented animal"
            "fragmented insect"
            "fragmented plant"
            "cropped anatomy"
            "body mutation"
            "swarm clutter")
  :variant-axes
  (parse-variant-axis-spec
   '((:required :color-theme :theme-anchor :accessory-set)
     (:recommended :scene-shell :outfit-design :evolution-strategy :action :composition)
     (:theme-anchor-keys :creature-direction :foreground-composition
                         :scene-design :design-evolution-strategy :secondary)
     (:accessory-keys :creature-direction :foreground-composition :outfit-design)))
  :mutations (foreground-occlusion-species-mutations)))
