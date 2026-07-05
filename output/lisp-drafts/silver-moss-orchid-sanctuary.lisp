(in-package #:prompt-universe)

(defprompt silver-moss-orchid-sanctuary
  (:intent "2d anime atmospheric botanical beauty editorial, silver moss orchid sanctuary, soft mist veil couture, calm healing luxury portrait")
  (:semantic-tags :character-editorial :2d-anime :botanical :orchid :moss :mist :quiet-luxury :candidate)
  (:risk-tags :photorealism-drift :3d-drift :visual-clutter :anatomy-drift :overexposure-risk)
  (:preface
   "Give me a picture."
   "Vertical 9:16 atmospheric-beauty editorial anime composition.")
  (:use-module no-3d no-photography)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY"
    (param "LICCA BOBO"))

  (:section "SUBTITLE ONLY"
    (param "SILVER MOSS ORCHID"))

  (:section "COLOR THEME"
    (param "silver moss green, orchid ivory, pale celadon, dew blue, mist gray, soft pearl white"))

  (:section "PRIMARY"
    "2d anime feminine editorial identity"
    "elegant adult anime beauty"
    "stable anime anatomy"
    "correct natural proportions"
    "luxury botanical editorial styling"
    "face-and-bust dominant composition"
    "ultra-clean silhouette readability"
    "large smooth visual regions"
    "ultra low-noise rendering")

  (:section "SECONDARY REFERENCE FUSION"
    "silver moss botanical texture"
    "translucent orchid petals"
    "quiet luxury beauty editorial"
    "minimal botanical sanctuary"
    "soft natural diffusion"
    "atmospheric nature portraiture")

  (:section "TERTIARY EVOLUTION STRATEGY"
    (param "fashion evolves toward orchid-mist softness, botanical atmosphere becomes protective couture, translucent petal veils create elegant coverage, silver moss structures become calm architectural masses, luxurious simplicity replaces ornament, beauty emerges through quiet botanical diffusion"))

  (:section "QUATERNARY ATMOSPHERE"
    "large translucent mist planes"
    "soft visibility gradients"
    "broad optical diffusion sheets"
    "low-frequency botanical atmosphere"
    "subtle dew-light interference"
    "gentle light architecture"
    "minimal shimmer density"
    "soft optical layering")

  (:section "BOTANICAL SYSTEM"
    (param "oversized silver moss cushions, translucent orchid petals, rounded botanical masses, matte dew surfaces, soft layered sanctuary foliage, low-frequency plant silhouettes"))

  (:section "SCENE"
    (param "standing quietly inside a vast orchid sanctuary, silver moss platforms surrounding the environment, translucent orchid petals forming soft overhead canopies, distant botanical layers fading into mist gradients, clean breathing space, quiet healing stillness"))

  (:section "OUTFIT DESIGN"
    (param "orchid-mist veil couture, soft layered botanical fabric, translucent petal-like coverage, elegant modest silhouette, atmosphere acting as garment structure, minimal ornament, calm luxury environmental fashion"))

  (:section "COMPOSITION"
    (param "face-and-bust dominant vertical portrait, character centered slightly below the upper third, oversized orchid canopy framing the head, silver moss masses forming large quiet shapes, open mist negative space around the face"))

  (:section "LIGHTING"
    (param "soft diffused morning light, dew-filtered illumination, pale celadon rim light, gentle matte highlights, controlled bloom, luminous skin priority"))

  (:section "QUALITY"
    "denoise ladder stage 5"
    "large smooth color regions"
    "reduced high-frequency edge density"
    "suppressed texture fragmentation"
    "premium anime illustration quality"
    "quiet dreamlike botanical clarity")

  (:section "NEGATIVE"
    "bad hands"
    "extra fingers"
    "missing fingers"
    "duplicate limbs"
    "body distortion"
    "anatomical corruption"
    "photorealism"
    "3d rendering"
    "dense foliage detail"
    "busy leaves"
    "tiny leaf clusters"
    "noisy vegetation"
    "sharp grass"
    "thorn overload"
    "crystal clutter"
    "fragmented prism effects"
    "sparkle overload"
    "texture chaos"
    "oversharpening"
    "film grain"
    "image noise"
    "visual clutter"
    "watermark"
    "logo"
    "text artifacts"))
