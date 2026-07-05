(in-package #:prompt-universe)

(defprompt fairyglass-dandelion-wonderland
  (:intent "2d anime transparent dandelion wonderland, fluffy healing seed filaments, natural wind drift, controlled prism refraction, no characters")
  (:semantic-tags :botanical :2d-anime :transparent-material :dandelion :wonderland :healing :wind-drift :candidate)
  (:risk-tags :photography-drift :3d-drift :glass-sculpture-drift :visual-clutter :rainbow-noise-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 soft 2D anime botanical editorial poster.")
  (:use-module no-3d no-photography no-realistic-transparent)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY"
    (param "DANDELION WONDERLIGHT"))

  (:section "SUBTITLE ONLY"
    (param "SOFT DRIFT FAIRYTALE"))

  (:section "DESCRIPTION DESIGN"
    (param "transparent fluffy dandelion in a gentle wonderland meadow"))

  (:section "COLOR THEME"
    (param "transparent pearl white, warm pollen gold, soft meadow green, misty sky blue, pale prism pink"))

  (:section "PRIMARY"
    "strictly 2d anime botanical illustration"
    "single transparent dandelion seed head as main subject"
    "fluffy healing visual softness"
    "natural wind drift"
    "no human character"
    "no face"
    "clean editorial object focus"
    "high silhouette readability")

  (:section "SECONDARY"
    (param "soft wonderland meadow, tiny distant flower lights, airy pastel sky, calm natural atmosphere, large clean negative space"))

  (:section "MATERIAL DESIGN"
    (param "transparent seed filaments, pearl-soft fluff texture, glass-like but illustrated botanical translucency, soft internal glow, lightweight floating seed parachutes"))

  (:section "MOTION DESIGN"
    (param "dandelion seeds naturally drifting in a gentle curved breeze, loose airy spacing, slow floating rhythm, soft upward motion, calm healing movement"))

  (:section "WONDERLAND ACCENT"
    (param "tiny fairy-light pollen dots, miniature glowing dew beads, soft magical meadow haze, subtle storybook botanical atmosphere"))

  (:section "PRISM CONTROL"
    "prism refraction as localized edge accent only"
    "small pale cyan-pink spectral splits on selected seed filaments"
    "controlled transparent rim highlights"
    "no noisy rainbow scatter"
    "no full crystal sculpture look")

  (:section "COMPOSITION"
    (param "large transparent dandelion anchored in the lower-left third, drifting seeds floating toward upper-right open sky, diagonal wind-path composition, soft meadow depth, elegant asymmetry, large breathing room"))

  (:section "CAMERA"
    "close-up botanical editorial framing"
    "macro-like anime illustration view"
    "flat anime depth layers"
    "single dandelion head as focal anchor"
    "soft foreground-background separation")

  (:section "LIGHTING"
    (param "warm backlit sunset glow, pearl-white seed edges, soft pollen-gold highlights, pale prism rim light, clean gentle shadow separation"))

  (:section "QUALITY"
    "denoise ladder stage 5"
    "large smooth color regions"
    "controlled transparent edge detail"
    "suppressed micro-noise"
    "clean cel-shading"
    "illustration-first transparent material"
    "soft fluffy readability")

  (:section "NEGATIVE"
    "human"
    "person"
    "girl"
    "boy"
    "character"
    "face"
    "eyes"
    "hands"
    "body"
    "animal"
    "photorealistic"
    "macro photography"
    "real glass sculpture"
    "crystal sculpture"
    "3d render"
    "cgi"
    "overly realistic refraction"
    "crowded meadow"
    "messy seed cloud"
    "rainbow noise"
    "sparkle overload"
    "visual clutter"
    "watermark"
    "logo"
    "extra text"))
