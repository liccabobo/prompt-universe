(in-package #:prompt-universe)

(defcomposition-tree colossal-ice-cream-carnival-tree
  (:intent "keep the rare small animal readable against a colossal ice-cream amusement park")
  (:canvas "vertical 9:16 illustrated amusement-park poster")
  (:focal-order special-species-hero colossal-ice-cream-landmark themed-rides distant-park)
  (primary special-species-hero
    :priority :highest
    :preserve t
    :position "lower-center foreground"
    :details ("one clearly readable full-body special-species animal"
              "face and distinctive species traits unobstructed"
              "small scale established by nearby ride details"))
  (scale-anchor colossal-ice-cream-landmark
    :priority :high
    :preserve t
    :position "center and upper background"
    :details ("towering berry-mint soft-serve landmark"
              "visible tiny windows and tracks establish immense scale"
              "silhouette remains separate from the animal"))
  (secondary themed-rides
    :priority :medium
    :mutable t
    :position "middle ground around the landmark"
    :details ("waffle-cone ferris wheel"
              "popsicle rail cars"
              "sundae-cup carousel"))
  (negative-space open-color-pocket
    :priority :high
    :preserve t
    :position "around the animal head and landmark rim"
    :details ("clean contrasting fields"
              "no ride crossing the face"
              "controlled breathing room")))

(defprompt colossal-ice-cream-carnival
  (:intent "whimsical 2d anime illustration of a tiny special-species animal exploring a colossal ice-cream amusement park with heightened color contrast")
  (:semantic-tags
   :illustration :2d-anime :amusement-park :colossal-object
   :ice-cream :special-species :axolotl :high-color-contrast :candidate)
  (:risk-tags
   :scale-confusion :subject-occlusion :palette-overload
   :photography-drift :3d-drift :visual-clutter)

  (:preface
   "Give me a picture."
   "Vertical 9:16 whimsical 2D anime amusement-park key visual.")

  (:use-module anime-prop-base no-3d no-photography no-realistic-transparent)
  (:use-method anime-material-override negative-space-guidance noise-reduction-ladder)
  (:use-composition colossal-ice-cream-carnival-tree)

  (:section "TITLE ONLY"
    (param "COLOSSAL SCOOP CARNIVAL"))

  (:section "SUBTITLE ONLY"
    (param "AXOLOTL AFTERGLOW"))

  (:section "DESCRIPTION DESIGN"
    (param "a tiny Mexican axolotl exploring a colossal berry-mint ice-cream amusement park"))

  (:section "COLOR THEME"
    (param "electric cyan, berry magenta, saturated lemon yellow, creamy vanilla white, deep midnight indigo"))

  (:section "PRIMARY"
    "whimsical 2d anime environment illustration"
    "one tiny special-species animal as the emotional hero"
    "recognizable species anatomy defined by creature direction"
    "distinctive face, ears, tail, coat, feathers, scales, or gills remain unobstructed as applicable"
    "emotion and action remain clearly readable"
    "full-body silhouette readability"
    "extreme small-animal versus giant-landmark scale contrast")

  (:section "SECONDARY"
    (param "colossal berry-mint soft-serve tower as the park landmark, spiral scoop rising beyond the ferris wheel, tiny windows and ride tracks embedded in the cone"))

  (:section "SCENE DESIGN"
    (param "fantasy amusement park built from giant edible shapes, waffle-cone ferris wheel, popsicle rail cars, sundae-cup carousel, candy-ticket gates, open paths and clean skyline"))

  (:section "CREATURE DIRECTION"
    (param "single Mexican axolotl wearing a miniature lemon-yellow carnival neckerchief and carrying a tiny berry ticket pouch, species traits remain visible, no costume covering the external gills"))

  (:section "OUTFIT DESIGN"
    (param "miniature lemon-yellow carnival neckerchief and berry ticket pouch, fitted below the external gills, species anatomy unobstructed"))

  (:section "ACTION"
    (param "curious joyful pause at the park entrance, head lifted toward the colossal soft-serve tower, tiny forefeet planted clearly on the path"))

  (:section "EMOTION"
    (param "curious joy"))

  (:section "WEATHER"
    (param "crisp electric-cyan daylight with a clear sky"))

  (:section "BACKGROUND"
    (param "open berry-mint amusement-park skyline under crisp electric-cyan daylight, deep indigo distance, clean weather visibility"))

  (:section "EVOLUTION STRATEGY"
    (param "axolotl gill curves echo the berry-mint soft-serve spiral and rounded ride geometry through graphic motifs only, no body mutation"))

  (:section "OBJECT DESIGN"
    (param "monumental soft-serve landmark with broad berry-magenta and electric-cyan ribbons, graphic illustrated melting edges, waffle cone architecture, bold iconic silhouette"))

  (:section "ACCESSORY DESIGN"
    (param "lemon neckerchief, berry ticket pouch, striped admission ticket, three oversized star-shaped sugar sprinkles near the path"))

  (:section "RENDERING STYLE"
    "bright storybook anime key visual"
    "large graphic color shapes"
    "clean cel-shaded separation"
    "expressive hand-painted edges"
    "illustration-first edible materials"
    "low micro-detail density")

  (:section "CAMERA"
    "low near-ground viewpoint at the animal's eye level"
    "wide-angle scale exaggeration"
    "foreground hero remains large enough to identify"
    "towering landmark rises into the upper frame"
    "clean depth layers without fisheye distortion")

  (:section "LIGHTING"
    (param "electric-cyan daylight against deep indigo shadow pockets, hot magenta rim accents, lemon-yellow ride lights, strong cool-warm separation, crisp readable silhouettes"))

  (:section "QUATERNARY"
    "localized edible-glaze shimmer only"
    "controlled secondary material accent"
    "no full-surface sparkle spread")

  (:section "QUALITY"
    "clear species anatomy"
    "clear amusement-park geography"
    "giant scale cues repeated at three depths"
    "maximum focal contrast around the animal"
    "limited five-color hierarchy"
    "controlled saturation outside focal areas")

  (:section "NEGATIVE"
    "multiple animals"
    "generic species design"
    "missing distinctive species traits"
    "costume covering species traits"
    "animal hidden by rides"
    "landmark cropped beyond recognition"
    "ordinary-size ice cream"
    "flat scale relationship"
    "muddy low-contrast palette"
    "pastel wash"
    "uncontrolled rainbow colors"
    "crowded ride overlap"
    "body distortion"
    "extra limbs"
    "horror anatomy"
    "brand logo"
    "copyrighted character"
    "photorealism"
    "watermark"
    "extra text"))

(defseed-control colossal-ice-cream-carnival-control
  (:intent "protect canonical identity while exposing the three required variant axes")
  (:source colossal-ice-cream-carnival)
  (:preserve
   :special-species-readability
   :colossal-scale-contrast
   :ice-cream-identity
   :amusement-park-identity
   :single-animal-focus)
  (:mutate
   :color-theme
   :theme-anchor
   :accessory-set
   :special-species
   :ice-cream-flavor
   :amusement-ride)
  (:forbid
   :brand-names
   :copyrighted-characters
   :public-figure-likeness
   :body-horror
   :muddy-low-contrast
   :subject-occlusion)
  (:locked-sections :primary :rendering-style :camera :quality :negative)
  (:parameterized-sections
   :title :subtitle :description-design :color-theme :secondary
   :scene-design :creature-direction :outfit-design :action :emotion :weather :background
   :evolution-strategy :object-design :accessory-design :lighting)
  (:variant-axes
   (:required :color-theme :theme-anchor :accessory-set)
   (:recommended :scene-shell :composition :lighting)
   (:theme-anchor-keys :secondary :scene-design :object-design)
   (:accessory-keys :accessory-design)))
