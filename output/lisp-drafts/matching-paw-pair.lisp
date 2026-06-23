(in-package #:prompt-universe)

(defprompt matching-paw-pair
  (:intent "owner and dog in identical matching outfit and hat, cute anime lifestyle editorial duo")
  (:semantic-tags :character-design :pet-duo :matching-outfit :lifestyle-editorial :candidate)
  (:risk-tags :photography-drift :pet-anatomy-drift :3d-drift :brand-logo-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 cute anime lifestyle editorial duo portrait composition.")
  (:use-module no-3d no-photography no-realistic-transparent)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY" (param "Matching Paw Pair"))
  (:section "SUBTITLE ONLY" (param "Twin Tail Couture"))

  (:section "COLOR THEME"
    (param "buttercream yellow, sky blue, soft coral pink, clean ivory white"))

  (:section "PRIMARY"
    "strictly 2D anime illustration" "NOT 3D" "NOT photorealistic"
    "NOT realistic pet photography" "stable human anatomy" "stable stylized dog anatomy"
    "correct five-finger hand anatomy" "clean duo silhouette readability"
    "matching outfit symmetry between owner and dog" "large smooth visual regions"
    "low-noise rendering")

  (:section "SECONDARY"
    (param "minimal cozy lifestyle editorial shell, soft domestic negative space, clean duo subject isolation, premium cute-magazine hierarchy, minimal environmental complexity"))

  (:section "TERTIARY"
    "soft knit fabric rendering" "matte cotton trim" "clean stripe pattern regions"
    "broad low-frequency material transitions" "suppressed fabric micro-texture"
    "minimal button ornamentation")

  (:section "QUATERNARY"
    "soft sky-blue ambient glow as secondary accent only"
    "minimal optical shimmer" "controlled beret-rim highlight"
    "suppressed holographic spread")

  (:section "EVOLUTION STRATEGY"
    (param "owner outfit color blocks echo dog costume panels, hat brim silhouette mirrors between human and dog, fabric stripe rhythm aligns across both bodies, leash ribbon repeats stripe direction, graphic twin-costume harmony only, not body mutation, not humanoid dog transformation, not organic fusion"))

  (:section "NEGATIVE-SPACE GUIDANCE"
    "large clean sky region" "minimal background tree density"
    "strong duo silhouette isolation" "dual-subject visual balance"
    "controlled empty-space breathing" "luxury editorial emptiness"
    "low visual noise composition")

  (:section "MATCHING OUTFIT DESIGN"
    (param "matching sailor-stripe knit cardigan and mini skirt set on owner, scaled-down identical sailor-stripe knit dog vest and skirt panel on dog, same button count, same stripe direction, same collar shape language, twin costume reads as one coordinated design system"))

  (:section "MATCHING HAT DESIGN"
    (param "matching navy beret on owner, scaled-down identical navy beret on dog, same tilt angle, same ribbon accent, hat scale adapted to each head size while preserving identical silhouette"))

  (:section "PET DESIGN"
    (param "cute stylized anime corgi, fluffy round silhouette, expressive anime eyes, short legs, readable paw pose, friendly energy, no copyrighted character likeness"))

  (:section "OWNER DESIGN"
    (param "young fictional anime woman, soft friendly smile, casual lifestyle posture, generic non-identifiable face, no brand references, clean readable hand pose"))

  (:section "ACTION"
    (param "owner sitting on park bench with dog on lap, both facing camera, matching hats and outfits clearly visible, relaxed twin-costume pose, gentle eye contact with viewer"))

  (:section "COMPOSITION"
    (param "duo portrait centered, owner upper body and dog full body both readable, matching outfits as focal hierarchy, soft background separation, rule-of-thirds duo balance, hats aligned at similar visual height"))

  (:section "BACKGROUND"
    (param "sunny pastel park bench corner, minimal trees, clean sky negative space, sparse fallen leaves, soft lifestyle editorial atmosphere"))

  (:section "THEMATIC SYMBOL"
    (param "striped ribbon leash, tiny sailor charm tag, single picnic basket accent"))

  (:section "CAMERA"
    "duo portrait framing" "50mm editorial lens" "stable perspective geometry"
    "clean facial and paw proportions")

  (:section "LIGHTING"
    "soft sunny afternoon key light" "gentle sky-blue fill"
    "controlled beret-rim highlight" "clean shadow separation")

  (:section "NEGATIVE"
    "photorealistic" "realistic dog photography" "3D render" "3D character"
    "deformed dog anatomy" "extra dog legs" "humanoid dog body" "mismatched outfits"
    "different hats" "brand logos" "readable text" "watermarks" "recognizable public-figure likeness"
    "crowded props" "distorted hands" "extra fingers" "missing fingers"
    "fused fingers" "high-frequency texture noise"))