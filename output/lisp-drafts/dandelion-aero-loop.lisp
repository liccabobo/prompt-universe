(in-package #:prompt-universe)

(defprompt dandelion-aero-loop
  (:intent "2d anime close-up dandelion editorial cover, wind aerodynamics evolution, sunlit grassland, no characters")
  (:semantic-tags :botanical :2d-anime :editorial :dandelion :wind :aerodynamics :candidate)
  (:risk-tags :photography-drift :3d-drift :character-drift :holo-noise-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 2D anime botanical magazine cover composition.")
  (:use-module no-3d no-photography)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY" (param "Aware Loop"))
  (:section "SUBTITLE ONLY" (param "Dandelion Aerodynamics"))

  (:section "COLOR THEME"
    (param "sunlit meadow green, warm dandelion white, pale straw yellow, clear sky cyan, soft holo pearl accent"))

  (:section "PRIMARY"
    "strictly 2d anime botanical illustration"
    "single close-up dandelion seed head"
    "no human character"
    "no face"
    "no body"
    "no hands"
    "anime magazine cover object focus"
    "clean silhouette readability")

  (:section "SECONDARY"
    "sunlit grassland background"
    "wind-swept meadow air"
    "soft grass bokeh translated into anime shapes"
    "large negative-space editorial layout"
    "calm bright outdoor atmosphere")

  (:section "TERTIARY"
    "fine dandelion seed filaments"
    "soft white seed parachutes"
    "thin stem silhouette"
    "controlled seed spacing"
    "low-frequency meadow shapes"
    "clean botanical detail hierarchy")

  (:section "QUATERNARY"
    "holo reflection as fourth-layer accent only"
    "pearl-cyan holo glints on selected seed filaments"
    "subtle rainbow edge reflection"
    "compressed holographic shimmer"
    "no full-surface holo coating"
    "no noisy sparkle field")

  (:section "EVOLUTION STRATEGY"
    (param "wind vector flow evolves the dandelion seed arrangement, seed parachutes arc along aerodynamic streamlines, grass blades lean with the same airflow direction, negative space follows the wind corridor, motion is graphic and botanical only, no character transformation, no creature formation, no mechanical mutation"))

  (:section "NEGATIVE-SPACE GUIDANCE"
    "large clean sky-side breathing room"
    "wind corridor left open for typography"
    "single botanical focal point"
    "minimal meadow clutter"
    "premium magazine cover hierarchy")

  (:section "COMPOSITION"
    (param "extreme close-up dandelion in lower-left third, seed filaments reaching toward upper-right airflow, oversized Aware Loop masthead in clean sky negative space, diagonal wind path, balanced asymmetry"))

  (:section "CAMERA"
    "close-up botanical framing"
    "macro-like anime illustration view"
    "shallow depth translated into flat anime layers"
    "single dandelion head as focal anchor")

  (:section "LIGHTING"
    "warm morning sunlight"
    "soft backlit seed edges"
    "clear grassland glow"
    "gentle rim light on floating seeds"
    "controlled holo highlights only in fourth layer")

  (:section "QUALITY"
    "denoise ladder stage 5"
    "large smooth color regions"
    "controlled filament detail"
    "suppressed micro-noise"
    "clean cel-shading"
    "illustration-first finish")

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
    "3d render"
    "cgi"
    "crowded meadow"
    "extra text"
    "logos"
    "watermarks"
    "high-frequency sparkle noise"
    "messy seed cloud"))
