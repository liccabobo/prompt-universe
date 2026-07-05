(in-package #:prompt-universe)

(defvar *canonical-section-order*
  '("TITLE ONLY"
    "TITLE MUST & ONLY"
    "SUBTITLE ONLY"
    "SUBTITLE MUST & ONLY"
    "TEXT CONTROL"
    "TYPOGRAPHY DESIGN"
    "COLOR DESIGN"
    "FACE DESIGN"
    "EXPRESSION"
    "HAIR DESIGN"
    "OUTFIT DESIGN"
    "POSE DESIGN"
    "CREATURE DIRECTION"
    "FOREGROUND COMPOSITION"
    "SCENE DESIGN"
    "RENDERING STYLE"
    "DESCRIPTION DESIGN"
    "COLOR THEME"
    "FLAVOR"
    "PRIMARY"
    "DESIGN EVOLUTION STRATEGY"
    "LATENT EXPLORATION"
    "VISUAL SIMPLIFICATION"
    "SECONDARY"
    "TERTIARY"
    "LIGHT TRANSPORT"
    "QUATERNARY"
    "ANIME PROP DESIGN"
    "PROP MATERIAL DESIGN"
    "HAND-PAINTED FINISH"
    "ANIME MATERIAL OVERRIDE"
    "JELLY APPEARANCE"
    "JELLY RELEASE DETAIL"
    "ANIME FLATTENING"
    "QUALITY"
    "NEGATIVE-SPACE GUIDANCE"
    "MOLD GEOMETRY"
    "OBJECT DESIGN"
    "TOP GARNISH"
    "ACCESSORY DESIGN"
    "TABLETOP STYLING"
    "HOLO ACCENTS"
    "TYPOGRAPHY"
    "COMPOSITION"
    "CAMERA"
    "LIGHTING"
    "NEGATIVE")
  "Preferred section order for compiled prop prompts.")

(defvar *section-key->heading*
  '((:title . "TITLE ONLY")
    (:subtitle . "SUBTITLE ONLY")
    (:description-design . "DESCRIPTION DESIGN")
    (:color-theme . "COLOR THEME")
    (:flavor . "FLAVOR")
    (:primary . "PRIMARY")
    (:secondary . "SECONDARY")
    (:tertiary . "TERTIARY")
    (:quaternary . "QUATERNARY")
    (:anime-prop-design . "ANIME PROP DESIGN")
    (:prop-material-design . "PROP MATERIAL DESIGN")
    (:hand-painted-finish . "HAND-PAINTED FINISH")
    (:anime-material-override . "ANIME MATERIAL OVERRIDE")
    (:jelly-appearance . "JELLY APPEARANCE")
    (:jelly-release-detail . "JELLY RELEASE DETAIL")
    (:anime-flattening . "ANIME FLATTENING")
    (:quality . "QUALITY")
    (:negative-space-guidance . "NEGATIVE-SPACE GUIDANCE")
    (:mold-geometry . "MOLD GEOMETRY")
    (:object-design . "OBJECT DESIGN")
    (:top-garnish . "TOP GARNISH")
    (:accessory-design . "ACCESSORY DESIGN")
    (:tabletop-styling . "TABLETOP STYLING")
    (:holo-accents . "HOLO ACCENTS")
    (:typography . "TYPOGRAPHY")
    (:composition . "COMPOSITION")
    (:camera . "CAMERA")
    (:lighting . "LIGHTING")
    (:negative . "NEGATIVE")))

(defun section-key->heading (key)
  (or (cdr (assoc key *section-key->heading*))
      (string-upcase (string key))))

(defun normalize-heading (heading)
  (string-upcase (string heading)))

(defun section-order-index (heading)
  (let ((normalized (normalize-heading heading)))
    (or (position normalized *canonical-section-order* :test #'string=)
        most-positive-fixnum)))

(defun sort-sections (sections)
  (stable-sort (copy-list sections) #'< :key (lambda (section)
                                               (section-order-index
                                                (prompt-section-heading section)))))
