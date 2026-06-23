(in-package #:prompt-universe)

(defprompt transparent-giant-flower
  (:intent "3D fantasy transparent couture fairy, giant floral butterfly wings, high-contrast cool-warm palette")
  (:semantic-tags :character-design :3d :transparent-couture :botanical :fantasy :candidate)
  (:risk-tags :photography-drift :realistic-likeness-drift :sexualized-framing-drift)
  (:preface
   "Give me a picture."
   "refer to the attached image for character appearance features."
   "Vertical 9:16 stylized 3D fantasy character editorial poster composition.")
  (:use-module stylized-3d-character-base no-photography no-realistic-transparent)
  (:use-method negative-space-guidance)

  (:section "TITLE ONLY" (param "Licca Bobo"))
  (:section "SUBTITLE ONLY" (param "Transparent Giant Flower Set"))

  (:section "COLOR THEME"
    (param "deep electric blue, arctic cyan, hot bubblegum pink, lemon yellow glow, clean ivory white, near-black shadow accents"))

  (:section "HAIR STYLE"
    (param "platinum blonde double space-buns, straight blunt bangs, few loose face-framing strands, golden bun ornaments, silky doll-like hair masses"))

  (:section "FACE STYLE"
    "large round blue eyes" "long soft lashes" "small refined nose"
    "full pink lips slightly parted" "fair smooth skin with soft glow"
    "doll-like youthful proportions" "high facial symmetry")

  (:section "FACIAL EXPRESSION"
    "innocent calm" "gentle neutral gaze" "fantasy editorial poise")

  (:section "SECONDARY"
    "fantasy couture editorial hierarchy" "single-subject visual dominance"
    "clean environmental isolation" "premium poster readability"
    "minimal prop density" "luxury fantasy-cover atmosphere")

  (:section "TERTIARY"
    "glossy vinyl-acrylic transparent fabric panels" "soft stylized sheen"
    "large low-frequency material regions" "controlled highlight hierarchy"
    "airy layered petal trim" "fantasy fabric separation")

  (:section "QUATERNARY"
    "localized neon bloom on wing edges" "floating pollen light dots"
    "subtle bokeh particles" "compressed holographic accent only")

  (:section "OUTFIT DESIGN"
    (param "cool breezy fantasy transparent couture, sheer glossy vinyl bodice with central zipper, puffy balloon transparent sleeves with pink floral print, high white choker collar, silver chain necklace, layered petal skirt panels, lightweight fairy silhouette, airy exposed-shoulder structure, couture fantasy coverage"))

  (:section "WING DESIGN"
    (param "oversized transparent butterfly-flower hybrid wings, blue-tinted glossy petal panels, glowing pink and yellow edge nodes, petal geometry reads as wings not insect anatomy"))

  (:section "BOTANICAL ACCESSORY"
    (param "giant luminous flower crown headpiece with radiating light rays, oversized clear flower-crystal drop earrings, large floating yellow pollen dots, single green stem accent behind shoulders"))

  (:section "THEMATIC SYMBOL"
    (param "giant transparent flower petals, butterfly wing silhouettes, floating botanical pollen particles, minimal stem prop"))

  (:section "COMPOSITION"
    (param "centered bust portrait, massive wing structures framing head, giant flower crown dominating upper frame, strong silhouette isolation, editorial poster hierarchy, large negative-space breathing"))

  (:section "BACKGROUND"
    (param "solid deep electric-blue backdrop, minimal environmental clutter, subtle bokeh light particles, clean fantasy poster background"))

  (:section "TYPOGRAPHY"
    "oversized luxury-serif typography" "large thematic masthead behind character"
    "partial typography hidden by silhouette" "clean premium hierarchy")

  (:section "CAMERA"
    "bust portrait framing" "50mm editorial lens" "face occupying 40-45% of frame"
    "slight diagonal composition" "clean facial proportions")

  (:section "LIGHTING"
    (param "high-contrast neon rim light, cool blue key light vs warm pink-yellow accent glow, strong edge separation, glossy highlight bloom, deep shadow pockets for contrast lift"))

  (:section "QUALITY"
    "polished 3D commercial illustration" "glossy wet-look surfaces"
    "denoise ladder stage 5" "controlled bloom" "low micro-noise" "clean material separation")

  (:section "NEGATIVE"
    "2D flat illustration" "cel-shading poster" "photorealistic human" "realistic photography"
    "swimwear" "beachwear" "bikini" "realistic glass refraction" "crystal sculpture armor"
    "real insect anatomy" "crowded botanical clutter" "low contrast muddy palette"
    "washed-out colors" "explicit nudity" "pornographic framing"
    "deformed anatomy" "extra fingers" "missing fingers" "fused fingers"
    "watermark" "brand logo clutter" "product cans" "extra text"))