(in-package #:prompt-universe)

(defprompt aware-loop
  (:intent "steampunk submarine editorial character, aware-loop consciousness motif")
  (:semantic-tags :character-design :editorial :steampunk :submarine :candidate)
  (:risk-tags :mechanical-clutter :photography-drift :3d-drift :realistic-underwater-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 luxury steampunk submarine editorial poster composition.")
  (:use-module no-3d no-photography no-realistic-transparent)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY" (param "Aware Loop"))
  (:section "SUBTITLE ONLY" (param "Licca Bobo"))

  (:section "COLOR THEME"
    (param "aged brass, deep ocean teal, violet pressure glow, oxidized copper, pearl silver"))

  (:section "HAIR STYLE"
    (param "silver-white roots transitioning into deep violet-purple lengths, double space-buns, long twin braids, smooth gradient transitions, large low-frequency hair masses, clean braid geometry"))

  (:section "FACE STYLE"
    "large almond-shaped eyes" "refined eye geometry" "high facial symmetry"
    "elegant nose bridge" "soft cheek contour" "editorial anime beauty"
    "dreamlike elegance" "sculptural facial harmony")

  (:section "FACIAL EXPRESSION"
    "calm attentiveness" "focused gaze" "quiet confidence" "controlled serenity")

  (:section "PRIMARY"
    "strictly 2D anime character design" "NOT a 3D character" "NOT a realistic human"
    "NOT photorealistic" "illustrated anime aesthetics only"
    "stable anatomy" "correct five-finger hand anatomy" "clean silhouette readability"
    "large smooth visual regions" "low-noise rendering")

  (:section "SECONDARY"
    "minimal luxury submarine observation dome interior" "sparse brass gauge panels"
    "large environmental silence" "clean negative space" "editorial poster hierarchy"
    "minimal environmental complexity" "strong subject isolation")

  (:section "TERTIARY"
    "aged brass surfaces" "matte copper trim" "pressure-glass panel inserts"
    "broad low-frequency material transitions" "suppressed metallic micro-texture"
    "velvet deep-sea fabric regions" "minimal rivet ornamentation")

  (:section "QUATERNARY"
    "violet bioluminescent glow as secondary accent only"
    "soft sonar pulse rings" "controlled pressure-gauge rim light"
    "minimal optical shimmer" "suppressed holographic spread")

  (:section "EVOLUTION STRATEGY"
    (param "steampunk gear-arc geometry evolves into submarine hull-curve language, brass dial rings echo porthole frames, rivet-row rhythm maps across outfit and cabin panels, background and clothing share the same circular loop motif, the fusion exists in color shape rhythm and composition, graphic design fusion only, not physical mutation, not organic transformation, not machinery melting into flesh, not liquid anatomy"))

  (:section "NEGATIVE-SPACE GUIDANCE"
    "large clean dome viewport region" "minimal gauge-wall density"
    "strong silhouette isolation" "single-subject visual dominance"
    "controlled empty-space breathing" "luxury editorial emptiness"
    "oversized typography area behind character" "low visual noise composition")

  (:section "OUTFIT DESIGN"
    (param "steampunk submarine engineer couture, brass porthole collar panels, copper rivet piping, pressure-glass bodice inserts, deep-sea violet velvet layers, minimal gear trim, high-fashion editorial silhouette"))

  (:section "THEMATIC SYMBOL"
    (param "brass helm wheel, sonar pulse ring, pressure gauge dial, single porthole frame, sparse copper pipe accent"))

  (:section "ACTION"
    (param "standing calmly inside observation dome, one hand resting on brass helm wheel, twin braids framing face, stable readable hand pose"))

  (:section "COMPOSITION"
    (param "strict rule-of-thirds layout, character in left third, giant circular porthole loop in center third, sparse gauge accents in right third, oversized Aware Loop masthead behind character, large upper negative-space breathing, balanced asymmetry"))

  (:section "BACKGROUND"
    (param "curved brass submarine viewport, soft violet bioluminescent deep-sea glow outside, minimal interior gauge wall, clean poster background, large sky-of-water negative space"))

  (:section "TYPOGRAPHY"
    "oversized luxury-serif typography" "large thematic masthead behind character"
    "partial typography hidden by silhouette" "clean premium hierarchy")

  (:section "QUALITY"
    "denoise ladder stage 5" "low-frequency rendering" "large smooth color regions"
    "suppressed texture fragmentation" "suppressed noise" "clean cel-shading"
    "controlled metallic highlights" "graphic poster simplicity")

  (:section "CAMERA"
    "half-body composition" "50mm editorial lens" "face occupying 40-45% of frame"
    "slight diagonal composition" "clean facial proportions")

  (:section "LIGHTING"
    "warm brass interior spotlight" "violet pressure-glow rim light"
    "controlled gauge-panel reflections" "clean shadow separation")

  (:section "NEGATIVE"
    "extra text" "logos" "watermarks" "photorealistic" "realistic human"
    "3D render" "3D character" "crowded machinery" "cluttered gears"
    "body mutation" "deformed anatomy" "extra fingers" "missing fingers"
    "fused fingers" "realistic underwater photography" "grain" "noise"
    "high-frequency metallic texture"))