(in-package #:prompt-universe)

(defparameter *silver-moss-orchid-sanctuary-subjects*
  '("moonlit osmanthus"
    "opal fern"
    "pearl lotus"
    "mist camellia"
    "bluebell frost"
    "glass wisteria"
    "cedar dew"
    "snowdrop lantern"
    "jade hellebore"
    "silk hydrangea"))

(defparameter *silver-moss-orchid-sanctuary-shells*
  '("quiet orchid bathhouse"
    "silver moss cloister"
    "mist-window conservatory"
    "dew chapel atrium"
    "botanical mirror pavilion"
    "soft rain greenhouse"
    "pearl-root sanctuary"
    "celadon garden theater"
    "moss-lit reading hall"
    "translucent petal arcade"))

(defparameter *silver-moss-orchid-sanctuary-palettes*
  '("moon ivory, pale osmanthus gold, silver green, fog blue, warm pearl"
    "opal teal, fern gray, milk jade, cool ivory, rain silver"
    "lotus pink, pearl white, river celadon, mist lavender, dew blue"
    "camellia rose, soft moss, cream beige, pale wine, morning gray"
    "bluebell violet, frost white, glacier mint, shadow lilac, silver ash"
    "wisteria mauve, glass cyan, orchid white, muted leaf green, haze violet"
    "cedar green, dew amber, smoke ivory, moss black, pale eucalyptus"
    "snowdrop white, lantern cream, mist sage, moon blue, soft graphite"
    "jade green, hellebore plum, porcelain cream, pale mineral blue, ash gray"
    "hydrangea blue, silk lavender, garden ivory, leaf silver, morning teal"))

(defparameter *silver-moss-orchid-sanctuary-lighting*
  '("soft moon-filtered light, pale gold dew highlights, controlled pearl bloom, low-noise botanical rim light"
    "cool rain-window light, opal edge glow, soft fern bounce light, clean matte shadows"
    "gentle water-reflected light, lotus-pink haze, pearl-white skin priority, calm celadon shadows"
    "warm overcast garden light, rose-tinted diffusion, soft moss bounce, quiet cosmetic highlights"
    "frosted morning light, bluebell-violet rim glow, silver ash shadows, restrained bloom"
    "misty glasshouse light, wisteria mauve diffusion, glass-cyan edge accents, low-frequency glow"
    "deep cedar shade with amber dew points, soft ivory face light, subdued moss-black contrast"
    "lantern-soft moonlight, snowdrop white highlights, sage mist shadows, clean facial visibility"
    "mineral jade underglow, plum orchid shadow, porcelain cream highlights, calm atmospheric depth"
    "hydrangea-blue morning haze, silk lavender rim light, ivory face priority, soft teal diffusion"))

(defun silver-moss-orchid-sanctuary-mutation (index)
  (let* ((subject (nth (mod index 10) *silver-moss-orchid-sanctuary-subjects*))
         (shell (nth (floor index 10) *silver-moss-orchid-sanctuary-shells*))
         (palette (nth (mod (+ index (floor index 10)) 10)
                       *silver-moss-orchid-sanctuary-palettes*))
         (lighting (nth (mod (+ (* 3 index) (floor index 10)) 10)
                        *silver-moss-orchid-sanctuary-lighting*))
         (variant-number (1+ index)))
    `((:subtitle . ,(format nil "BOTANICAL SANCTUARY ~3,'0D" variant-number))
      (:color-theme . ,palette)
      (:secondary . ,(format nil "~A beauty editorial, ~A atmosphere, quiet luxury botanical portrait, large calm negative space, soft natural diffusion"
                             subject shell))
      (:scene . ,(format nil "standing quietly inside a ~A, oversized ~A botanical forms surrounding the environment, distant plant layers dissolving into mist gradients, clean breathing space, calm healing stillness"
                         shell subject))
      (:botanical-system . ,(format nil "oversized ~A masses, translucent orchid companion petals, matte moss surfaces, dew-soft botanical fibers, low-frequency sanctuary silhouettes, restrained symbolic botanical props"
                                    subject))
      (:outfit-design . ,(format nil "~A veil couture, orchid-mist garment structure, soft layered botanical fabric, translucent petal-like coverage, elegant modest silhouette, minimal ornament, calm luxury environmental fashion"
                                 subject))
      (:tertiary-evolution-strategy . ,(format nil "fashion evolves toward ~A softness, the ~A architecture becomes protective botanical couture, translucent petal veils create elegant coverage, large moss and orchid forms replace ornament, beauty emerges through quiet atmospheric diffusion"
                                               subject shell))
      (:quaternary-atmosphere . ,(format nil "large translucent ~A mist planes, soft visibility gradients, broad optical diffusion sheets, low-frequency botanical atmosphere, controlled prism accent as localized edge shimmer only, subtle dew-light interference, soft optical layering"
                                         subject))
      (:composition . ,(format nil "face-and-bust dominant vertical portrait, character centered slightly below the upper third, ~A canopy framing the head, ~A masses forming large quiet shapes, open mist negative space around the face"
                               subject shell))
      (:lighting . ,lighting))))

(defun silver-moss-orchid-sanctuary-mutations ()
  (loop for i from 0 below 100
        collect (silver-moss-orchid-sanctuary-mutation i)))

(register-expansion-plan
 'silver-moss-orchid-sanctuary-100
 (make-expansion-plan
  :name 'silver-moss-orchid-sanctuary-100
  :intent "one hundred controlled botanical sanctuary variants derived from SILVER-MOSS-ORCHID-SANCTUARY using the variant controller"
  :source-prompt 'silver-moss-orchid-sanctuary
  :preserve '(:title :primary :quality :negative :negative-space-guidance)
  :variant-axes
  (parse-variant-axis-spec
   '((:required :color-theme :theme-anchor :accessory-set)
     (:recommended :scene-shell :outfit-design :evolution-strategy :composition)
     (:theme-anchor-keys :secondary :scene :botanical-system :tertiary-evolution-strategy)
     (:accessory-keys :outfit-design :botanical-system)))
  :mutations (silver-moss-orchid-sanctuary-mutations)))
