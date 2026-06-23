(in-package #:prompt-universe)

(defprompt cherry-jelly
  (:intent "wild cherry anime prop jelly, luxury dessert presentation")
  (:semantic-tags :prop-design :candidate :dessert)
  (:risk-tags :photography-drift :realistic-refraction-drift)
  (:preface
   "Give me a picture."
   "Horizontal 16:9 anime key visual composition.")
  (:use-module anime-prop-base no-3d no-photography no-realistic-transparent)
  (:use-method anime-material-override negative-space-guidance noise-reduction-ladder)
  (:section "TITLE ONLY" (param "Licca Bobo"))
  (:section "SUBTITLE ONLY" (param "Cherry Jelly"))
  (:section "COLOR THEME" (param "deep cherry red, warm ivory, soft rose pink, champagne gold"))
  (:section "FLAVOR" (param "Wild Cherry"))
  (:section "OBJECT DESIGN" (param "small cherry halves suspended inside cloudy translucent cherry jelly"))
  (:section "TOP GARNISH" (param "single cherry blossom, one mint leaf, casual asymmetrical placement"))
  (:section "NEGATIVE"
            "watermark" "brand logo" "text artifacts"))