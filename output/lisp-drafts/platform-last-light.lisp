(in-package #:prompt-universe)

(defprompt platform-last-light
  (:intent "cinematic photorealistic school-uniform girl at vintage platform blue hour")
  (:semantic-tags :character-design :cinematic :photorealistic :school-uniform :editorial :candidate)
  (:risk-tags :photography-drift :anime-drift :3d-drift :likeness-drift)
  (:preface
   "Give me a picture."
   "Vertical 9:16 cinematic film-still composition.")
  (:section "TITLE ONLY" (param "Platform Last Light"))
  (:section "SUBTITLE ONLY" (param "Licca Bobo"))

  (:section "COLOR THEME"
    (param "navy uniform blue, amber platform lamp glow, dusty rose twilight sky, cool slate platform stone, warm white train headlight"))

  (:section "PRIMARY"
    "cinematic photorealistic film still" "natural human skin texture"
    "realistic fabric rendering" "realistic hair strand detail"
    "subtle 35mm film grain" "editorial fashion-photography realism"
    "NOT 2D anime illustration" "NOT cel-shaded" "NOT illustrated character"
    "NOT manga style" "NOT 3D game CG" "NOT doll-like proportions"
    "stable anatomy" "correct five-finger hand anatomy" "natural body proportions")

  (:section "SECONDARY"
    "empty vintage train platform interior" "sparse timetable architecture"
    "large atmospheric negative space" "clean environmental isolation"
    "cinematic depth layering" "premium visual hierarchy"
    "minimal platform clutter" "strong subject isolation")

  (:section "TERTIARY"
    "pressed wool-blend blazer fabric" "matte pleated skirt folds"
    "weathered platform stone texture" "aged metal timetable frame"
    "broad low-frequency material transitions" "suppressed micro-noise"
    "natural fabric crease behavior" "realistic ribbon silk sheen")

  (:section "QUATERNARY"
    "distant train headlight bloom as secondary accent only"
    "soft amber platform-lamp rim glow" "subtle twilight haze"
    "minimal lens flare" "controlled atmospheric diffusion")

  (:section "NEGATIVE-SPACE GUIDANCE"
    "large open sky and track corridor region" "minimal platform furniture density"
    "strong silhouette isolation" "single-subject visual dominance"
    "controlled empty-space breathing" "cinematic editorial emptiness"
    "clean spatial separation" "low visual noise composition")

  (:section "STORY BACKGROUND"
    (param "a young woman in school uniform stands alone on an empty vintage train platform at blue hour, the last train departing in the far distance, wind lifting her ribbon and skirt hem, a quiet farewell suspended in twilight"))

  (:section "THEMATIC SYMBOL"
    (param "vintage timetable board, empty platform bench, distant train headlight glow, wind-lifted ribbon accent, worn platform edge line"))

  (:section "FACIAL TRAITS"
    "natural skin pores at readable scale" "soft realistic eye moisture"
    "subtle cheek contour" "refined nose bridge" "editorial beauty restraint"
    "photorealistic facial harmony")

  (:section "EMOTIONAL STATE"
    (param "quiet farewell, restrained melancholy, calm attentiveness, distant longing"))

  (:section "HAIR PARAMETER"
    (param "straight dark-brown hair with natural shine, shoulder-length with soft breeze lift, clean natural strand grouping, subtle wind displacement at ribbon level"))

  (:section "OUTFIT DESIGN"
    (param "classic japanese school blazer uniform, navy pleated skirt, white ribbon necktie, clean pressed fabric, modest silhouette, polished black loafers, structured shoulder line"))

  (:section "ACCESSORY DESIGN"
    (param "simple leather school bag held at side, minimal ribbon movement, no logo markings, understated student accessories"))

  (:section "ACTION"
    (param "standing still on platform edge, one hand gripping bag strap, gaze directed toward departing train light, natural relaxed posture, wind-responsive skirt and hair motion"))

  (:section "COMPOSITION"
    (param "rule-of-thirds layout, character in left third, empty track corridor and sky occupying center and right thirds, distant headlight anchor at far depth, long vertical negative space above, balanced asymmetry, cinematic film-still framing"))

  (:section "BACKGROUND"
    (param "weathered vintage railway platform, faded timetable board, empty bench, receding tracks into twilight haze, cool blue-hour sky gradient, sparse amber platform lamps"))

  (:section "TYPOGRAPHY"
    "no visible text in scene" "no signage lettering" "no watermark typography")

  (:section "QUALITY"
    "natural color grading" "controlled film grain" "large smooth sky regions"
    "suppressed texture fragmentation" "clean shadow separation"
    "realistic atmospheric perspective" "editorial clarity")

  (:section "CAMERA"
    "35mm cinematic lens" "shallow depth of field" "natural perspective geometry"
    "three-quarter body composition" "face occupying 30-35% of frame"
    "slight off-center framing" "film-still documentary distance")

  (:section "LIGHTING"
    "blue-hour ambient skylight" "warm amber platform-lamp accent"
    "distant train headlight rim glow on hair and blazer edge"
    "soft shadow falloff" "natural skin-light separation"
    "controlled twilight contrast")

  (:section "NEGATIVE"
    "2D anime" "anime illustration" "cel-shading" "manga style" "cartoon"
    "3D render" "game CG" "doll-like face" "plastic skin"
    "oversaturated anime eyes" "deformed anatomy" "extra fingers" "missing fingers"
    "fused fingers" "crowded platform clutter" "brand logos" "readable signage text"
    "watermarks" "identifiable public-figure resemblance" "identifiable individual resemblance"
    "sexualized posing" "excessive lens flare" "HDR overcook"))