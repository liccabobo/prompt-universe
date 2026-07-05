(in-package #:prompt-universe)

(defprompt prism-dandelion-drift
  (:intent "2d anime transparent dandelion close-up, prism refraction, wind drift aerodynamics, sunlit meadow, no characters")
  (:semantic-tags :botanical :2d-anime :editorial :dandelion :prism :transparent-material :wind :candidate)
  (:risk-tags :photography-drift :3d-drift :glass-sculpture-drift :character-drift :rainbow-noise-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 2D anime botanical magazine cover composition.")
  (:use-module no-3d no-photography no-realistic-transparent)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY" (param "Aware Loop"))
  (:section "SUBTITLE ONLY" (param "Prism Dandelion Drift"))

  (:section "COLOR THEME"
    (param "transparent pearl white, sunlit meadow green, pale gold sunlight, prism cyan, prism magenta, soft violet refraction"))

  (:section "PRIMARY"
    "strictly 2d anime botanical illustration"
    "single transparent dandelion seed head"
    "close-up dandelion focus"
    "no human character"
    "no face"
    "no body"
    "no hands"
    "clean anime magazine cover object focus"
    "high silhouette readability")

  (:section "SECONDARY"
    "sunlit grassland background"
    "warm meadow air"
    "wind-bent grass forms"
    "large clean negative space"
    "premium anime editorial layout"
    "calm open-air atmosphere")

  (:section "TERTIARY"
    "transparent dandelion seed filaments"
    "glass-like but illustrated seed parachutes"
    "thin pearl stem silhouette"
    "controlled seed spacing"
    "large low-frequency meadow shapes"
    "soft botanical edge clarity")

  (:section "QUATERNARY"
    "prism refraction as fourth-layer accent only"
    "small cyan-magenta-yellow spectral splits on selected seed edges"
    "transparent pearl highlights"
    "subtle internal light bending"
    "controlled iridescent rim fragments"
    "no noisy rainbow scatter"
    "no full glass sculpture look")

  (:section "EVOLUTION STRATEGY"
    (param "wind flow evolves the transparent dandelion seed geometry into aerodynamic prism paths, floating seed parachutes follow curved air streamlines, prism color splits align with the wind direction, grass blades echo the same drift angle, negative space opens along the airflow corridor, botanical motion only, no character transformation, no creature formation, no mechanical mutation"))

  (:section "NEGATIVE-SPACE GUIDANCE"
    "wide clear sky-side typography zone"
    "open wind corridor"
    "single botanical focal anchor"
    "minimal meadow clutter"
    "premium cover breathing room")

  (:section "COMPOSITION"
    (param "extreme close-up transparent dandelion in lower-left third, drifting seeds arc toward upper-right prism light path, oversized Aware Loop masthead placed in open sky negative space, diagonal airflow composition, elegant asymmetry"))

  (:section "CAMERA"
    "close-up botanical framing"
    "macro-like anime illustration view"
    "flat anime depth layers"
    "single dandelion head as focal anchor"
    "soft foreground-background separation")

  (:section "LIGHTING"
    "warm sunlight through transparent seed filaments"
    "soft backlit pearl edges"
    "gentle prism refraction accents"
    "clean shadow separation"
    "controlled transparent highlights")

  (:section "QUALITY"
    "denoise ladder stage 5"
    "large smooth color regions"
    "controlled transparent edge detail"
    "suppressed micro-noise"
    "clean cel-shading"
    "illustration-first transparent material")

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
    "extra text"
    "logos"
    "watermarks"
    "rainbow noise"
    "messy seed cloud"))
