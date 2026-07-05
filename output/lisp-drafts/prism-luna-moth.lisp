(in-package #:prompt-universe)

(defprompt prism-luna-moth
  (:intent "controlled 2D anime editorial variant derived from PRISM-GOLDFISH, preserving character design while changing creature, scene, composition, camera angle, and palette")
  (:semantic-tags :character-editorial :2d-anime :prism-couture :creature-variant :candidate)
  (:risk-tags :source-seed-derived :identity-drift :photorealism-drift :visual-clutter)
  (:preface
   "Give me a picture."
   "Vertical 9:16 luxury Japanese editorial poster.")
  (:use-module no-3d no-photography)
  (:use-method negative-space-guidance noise-reduction-ladder)

  (:section "TITLE ONLY"
    (param "LICCA BOBO"))

  (:section "SUBTITLE ONLY"
    (param "BEYOND THE VISIBLE"))

  (:section "DESCRIPTION DESIGN"
    (param "prism luna moth"))

  (:section "COLOR THEME"
    (param "pale jade, moonlit ivory, powder blue, soft silver"))

  (:section "HAIR STYLE"
    (param "goldfish-orange roots, transitioning into vermilion-red highlights, double space-buns, long twin braids, smooth gradient transitions, large clean color regions, minimal strand fragmentation"))

  (:section "FACE STYLE"
    (param "large almond-shaped eyes, refined eye geometry, high facial symmetry, elegant nose bridge, soft cheek contour, editorial anime beauty, dreamlike elegance, sculptural facial harmony"))

  (:section "FACIAL EXPRESSION"
    (param "gentle serenity, quiet happiness, soft curiosity, peaceful confidence, warm emotional presence"))

  (:section "GENDER PRESENTATION"
    (param "feminine editorial anime styling, elegant young adult presence, refined couture posture"))

  (:section "BODY PROPORTION"
    (param "slender tall fashion-illustration proportion, long limbs, narrow shoulder line, clean readable anatomy, non-realistic anime stylization"))

  (:section "OUTFIT DESIGN"
    (param "white prism couture, transparent crystal fabric, glass-layered fashion design, flowing translucent panels, high-fashion elegance, minimal geometric silhouette"))

  (:section "SCENE"
    (param "moonlit glass conservatory, quiet botanical silhouettes, tall arched greenhouse architecture, cool nocturne atmosphere, large calm interior space, editorial garden aesthetics, minimal environmental complexity"))

  (:section "CREATURE"
    (param "luna moths, translucent pale wings, powder-blue wing edges, soft jade wing bodies, large elegant silhouettes, floating around the character, integrated into composition"))

  (:section "EVOLUTION STRATEGY"
    (param "geometric wing simplification, single dominant crescent-wing gesture, transparent glass architecture replacing visual effects, luna moths integrated into composition rather than decoration, editorial design first, special effects second, museum-grade poster aesthetics, large shape hierarchy, low-frequency visual language, quiet luxury design language, negative-space driven composition"))

  (:section "ACTION"
    (param "standing quietly inside the conservatory, slight upward gaze, one hand relaxed near a glass railing, calm interaction with orbiting luna moths, strong silhouette readability"))

  (:section "COMPOSITION"
    (param "low-angle vertical editorial composition, character anchored in the lower foreground, glass conservatory arch rising behind the character, luna moth silhouettes orbiting the upper frame, single dominant upward diagonal structure, large visual breathing room, balanced asymmetry"))

  (:section "CAMERA"
    (param "low-angle editorial camera, slight upward perspective, vertical 9:16 poster crop, calm cinematic distance, architectural depth visible above the character"))

  (:section "GLASS STRUCTURE"
    (param "massive transparent conservatory arch, crystal-clear glass ribs, optical distortion, volumetric refraction, moonlight bending through glass, architectural glass design, museum-grade transparency"))

  (:section "LIGHTING"
    (param "cool moonlight, soft silver highlights, pale jade refractions, powder-blue rim light, clean shadow separation, natural nocturne editorial lighting"))

  (:section "BACKGROUND"
    (param "minimal glass conservatory interior, moonlit botanical silhouettes, large quiet negative space, clean architectural depth, restrained garden shapes"))

  (:section "TYPOGRAPHY"
    (param "oversized white serif typography, title behind character, luxury editorial layout, clean spacing, strong readability"))

  (:section "PRIMARY"
    "strictly 2D anime illustration" "NOT a 3D character" "NOT a realistic human"
    "NOT photorealistic" "Japanese editorial illustration" "shape-driven visual language"
    "same character design as PRISM-GOLDFISH")

  (:section "QUALITY"
    "frequency-compressed rendering" "large smooth regions" "reduced high-frequency edge density"
    "suppressed texture fragmentation" "ultra-clean anime rendering" "poster-grade readability")

  (:section "NEGATIVE"
    "goldfish" "sunlit meadow" "3D render" "photorealistic skin" "busy background"
    "insect swarm clutter" "particle overload" "glass shards" "rainbow clutter"
    "tiny details" "visual noise" "extra fingers" "missing fingers" "deformed anatomy"))
