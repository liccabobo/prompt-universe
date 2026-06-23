;;;; Template for AI-authored drafts (MVP-2.5)
;;;; Copy to output/lisp-drafts/<your-name>.lisp and edit.
(in-package #:prompt-universe)

(defprompt your-prompt-name
  (:intent "describe the spell intent here")
  (:semantic-tags :prop-design :candidate)
  (:risk-tags :photography-drift :realistic-refraction-drift)
  (:preface
   "Give me a picture."
   "Horizontal 16:9 anime key visual composition.")
  (:use-module anime-prop-base no-3d no-photography no-realistic-transparent)
  (:use-method anime-material-override negative-space-guidance noise-reduction-ladder)
  (:section "TITLE ONLY" (param "Licca Bobo"))
  (:section "SUBTITLE ONLY" (param "Your Subtitle"))
  (:section "COLOR THEME" (param "your palette here"))
  (:section "FLAVOR" (param "Your Flavor"))
  (:section "OBJECT DESIGN" (param "your object description"))
  (:section "NEGATIVE"
            "watermark" "brand logo" "text artifacts"))