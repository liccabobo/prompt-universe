(in-package #:prompt-universe)

(defparameter *luna-moth-jade-base-palette*
  "pale mint green, soft lime jade, lunar ivory, celadon mist, faint pearl blush, cool silver mist, subtle dark bronze accents")

(defparameter *luna-moth-jade-close-palettes*
  '("pale jade green, soft mint, lunar ivory, celadon haze, pearl blush, silver mist, bronze accents"
    "soft celadon, pale lime jade, lunar ivory, mint cream, light blush, cool silver, dark edge"
    "lunar mint, jade cream, ivory white, haze celadon, subtle rose, mist silver, bronze trim"
    "mint veil green, soft jade, pearl ivory, celadon fog, faint blush, silver light, brown bronze"
    "lime jade, pale mint, lunar ivory, mist celadon, blush pearl, cool silver, accent bronze"
    "celadon green, soft lime, ivory, jade haze, light pearl, silver mist, dark bronze"
    "pale mint, jade silver, lunar cream, celadon, blush mist, cool silver, bronze edge"
    "soft green jade, mint ivory, lunar, celadon pearl, faint blush, silver, bronze"
    "lunar jade, pale mint green, ivory, haze, blush silver, mist, bronze accents"
    "mint celadon, soft jade, lunar ivory, pearl mist, light blush, silver, dark bronze"
    "jade mint, pale celadon, ivory, green haze, blush, cool silver, bronze"
    "pale lime, jade, lunar ivory, celadon, pearl blush, silver mist, bronze"
    "soft mint jade, lunar, ivory cream, haze celadon, blush, silver, bronze trim"
    "celadon jade, pale mint, lunar ivory, mist, light pearl blush, cool silver, dark accent"
    "lunar green, soft jade mint, ivory, celadon fog, blush, silver, bronze"
    "mint jade, pale, lunar ivory, celadon, pearl, silver mist, bronze edge"
    "jade celadon, soft mint, ivory lunar, haze, blush, cool silver, dark bronze"
    "pale green jade, mint, lunar ivory, celadon mist, blush pearl, silver, bronze"
    "soft jade mint, lunar cream, ivory, celadon, light blush, silver, bronze accents"
    "lunar celadon, pale jade, ivory, mint haze, pearl blush, silver mist, bronze"))

(defparameter *luna-moth-jade-poses*
  '("head and upper torso portrait, body turned three-quarters toward the window light while the face looks directly toward the camera, elegant relaxed shoulders, graceful neck line, one hand lightly resting on the collarbone with naturally relaxed and separated fingers, the opposite hand remains completely outside the frame, beautiful feminine finger anatomy, relaxed fingertips, serene intimate elegance with quiet emotional depth"
    "upper torso portrait, shoulders angled softly away, head turning back toward the lens with direct magnetic eye contact, one hand hovering gracefully near the cheek without contact, elegant wrist line, poised intimate stillness"
    "head and upper torso portrait, chin slightly lowered with strong eye lock on the camera, one hand softly lifting the sleeve edge, calm graceful tension, refined cinematic quiet"
    "upper torso portrait, body leaning subtly toward the jade window light, one hand resting near the jawline with relaxed fingertips, elegant neck extension, emotionally engaging presence"
    "portrait, face softly framed by a lifted sleeve, one hand near the temple with fingers naturally separated, quiet serene editorial gaze with subtle longing"
    "upper torso portrait, neck elongated under the cool light, one hand placed gently over the upper chest with relaxed open palm, vulnerable elegant stillness"
    "portrait, body turned sideways toward the window, face calmly returning to camera, one hand near the lips in a restrained thinking gesture, soft emotional intimacy"
    "head and upper torso, head tilted slightly to receive the window glow, one hand resting lightly at the side of the neck, delicate finger anatomy, composed romantic pause"
    "portrait, face close to the light plane, one hand gently holding the robe fold near the shoulder, clean silhouette, calm magnetic gaze"
    "upper torso, body in a soft diagonal pose, one hand extended slightly forward in a graceful non-contact gesture behind the occlusion plane, strong silhouette readability"
    "head and upper torso portrait, elegant relaxed shoulders, one hand raised to lightly touch the hair ornament at the crown with separated fingers, quiet power and direct engagement"
    "portrait, body oriented toward the light source, face to viewer, one hand with fingers softly curled near the ear in a listening contemplative pose, intimate connection"
    "upper torso portrait, one hand lightly tracing the collar line with relaxed elegant fingers, shoulders open to the window glow, serene contemplative expression"
    "portrait, hand placed delicately on the opposite shoulder in a self-embracing refined gesture, direct engaging eyes with emotional depth"
    "head and upper torso, fingers of one hand lightly intertwined in a relaxed clasp at mid chest, graceful and still, poised presence"
    "portrait, head tilted gently back to catch the light, one hand supporting the back of the neck subtly, elongated graceful neck line"
    "upper torso, body softly twisted toward the window, face frontal to viewer, one hand adjusting the outer robe lapel with precise feminine fingers"
    "portrait, one hand open with palm softly oriented toward the window light as if receiving the glow, magnetic eye contact, serene strength"
    "head and upper torso close, hand gently raised with the back of fingers resting near the jaw in elegant profile accent while face remains frontal, quiet intimate atmosphere"
    "upper torso portrait, relaxed and open, one hand resting lightly on an implied low window edge with natural fingers, body leaning softly into the light, peaceful powerful direct gaze"))

(defparameter *luna-moth-jade-scenes*
  '("serene jade casement alcove, cool mineral light filtering through veined panes, restrained interior with soft green glow, elegant negative space, museum calm"
    "quiet jade lattice window recess, translucent carved frames glowing softly, minimal chamber with refined atmospheric depth, calm editorial stillness"
    "elegant mineral window chamber, jade-toned panes diffusing cool mint light, sparse architectural hints, large breathing negative space"
    "restrained jade framed casement in quiet interior, soft transmitted green light, elegant simple forms, calm museum-like mood"
    "minimal jade window recess with carved translucent green mineral panes, soft cool illumination, elegant negative space, subtle stone texture hints only"))

(defun luna-moth-jade-mutation (i)
  (let* ((pose (nth (mod i (length *luna-moth-jade-poses*)) *luna-moth-jade-poses*))
         (palette (nth (mod i (length *luna-moth-jade-close-palettes*)) *luna-moth-jade-close-palettes*))
         (scene (nth (mod i (length *luna-moth-jade-scenes*)) *luna-moth-jade-scenes*))
         (outfit (format nil "luxury Song Dynasty inspired hanfu adapted to the luna moth palette, flowing pale mint green silk outer robe, lunar ivory and celadon inner garments, soft translucent layers with subtle sheen, broad elegant sleeves, simplified embroidery echoing delicate wing veins and long tail arcs~A, premium woven silk, large coherent fabric surfaces, minimal ornamentation"
                         (case (mod i 4)
                           (0 ", with added silver vein motifs")
                           (1 ", with faint tail arc silver embroidery")
                           (2 ", with subtle celadon thread highlights")
                           (otherwise ", with restrained moth-wing vein patterns"))))
         (lighting (format nil "large jade window as the only primary light source, soft cool mint-tinted window light~A, elegant rim light, cinematic backlighting, creamy editorial illumination, delicate transmitted light through translucent luna moth wings, long tail and translucent hair strands"
                           (if (zerop (mod i 2)) " with subtle blush transmission" "")))
         (evolution (format nil "compress architecture, costume, lighting and composition into one unified visual language, foreground occlusion becomes visual storytelling through the complete accurate luna moth with long tail streamers and distinctive wing structure, use pale mint green veil texture, long crescent tail arcs, eyespot hints and vein details to drive palette, ~A, costume accent, scene shell, foreground blur, transmitted light, and negative-space rhythm, preserve facial beauty, complete moth anatomy, natural lens crop, restrained ornamentation, elegant simplicity" pose))
         (secondary (format nil "large coherent color masses from ~A, simplified portrait composition, restrained decorative density, broad atmospheric perspective, elegant negative space, soft visual rhythm shaped by the complete luna moth wing and tail" palette))
         (tertiary (format nil "cool jade window light~A, luminous skin scattering, creamy indirect illumination, elegant ambient haze, subtle cinematic depth, delicate translucent luna moth wing with accurate tail streamer and eyespot suggestion, softly glowing backlit hair" (if (zerop (mod i 4)) " with blush" ""))))
    `((:pose-design . ,pose)
      (:color-design . ,palette)
      (:scene-design . ,scene)
      (:outfit-design . ,outfit)
      (:lighting . ,lighting)
      (:design-evolution-strategy . ,evolution)
      (:secondary . ,secondary)
      (:tertiary . ,tertiary))))

(defun luna-moth-jade-mutations ()
  (loop for i from 0 below 20
        collect (luna-moth-jade-mutation i)))

(register-expansion-plan
 'luna-moth-jade-action-20
 (make-expansion-plan
  :name 'luna-moth-jade-action-20
  :intent "twenty variants of LUNA-MOTH-JADE-WINDOW keeping the exact same luna moth species with accurate wing and tail structure, using close variations within the pale mint/jade/ivory family for colors, but featuring distinctly different protagonist poses and actions in the foreground occlusion editorial style"
  :source-prompt 'luna-moth-jade-window
  :preserve '(:title :subtitle :text-control :typography-design :face-design :expression :hair-design
              :creature-direction :foreground-composition :rendering-style :primary :camera :quality-design
              :negative :light-transport)
  :variant-axes
  (parse-variant-axis-spec
   '((:required :color-theme :theme-anchor :accessory-set)
     (:recommended :action :scene-shell :outfit-design :evolution-strategy)
     (:theme-anchor-keys :scene-design :design-evolution-strategy :secondary)
     (:accessory-keys :outfit-design)))
  :mutations (luna-moth-jade-mutations)))