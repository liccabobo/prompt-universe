(in-package #:prompt-universe)

(load-draft-file :moon-jade-lotus-observatory)

(defparameter *moon-jade-lotus-observatory-plants*
  '((:plant "white magnolia" :shell "moonlit magnolia glasshouse"
     :palette "magnolia ivory, moon sage, porcelain blue, soft charcoal, pearl silver"
     :botanical "oversized white magnolia shields, smooth wax-petal panels, matte sage stems, broad pearl mist sheets, low-frequency flower silhouettes"
     :symbol "single magnolia shield bloom, jade hairpin disk, smooth porcelain moon dial"
     :outfit "magnolia-shield cape couture, broad ivory shoulder panels, soft sage inner dress, smooth sleeve blocks, minimal ornament"
     :lighting "porcelain moonlight, sage rim glow, pearl-white face priority, clean matte shadows")
    (:plant "blue lotus" :shell "deep blue lotus astrolabe hall"
     :palette "deep lotus blue, mineral cyan, moon ivory, ink shadow, quiet silver"
     :botanical "oversized blue lotus disks, smooth astrolabe petal panels, matte mineral surfaces, low-frequency aquatic silhouettes, broad mist planes"
     :symbol "blue lotus astrolabe disk, simple silver wrist ring, mineral bead pair"
     :outfit "blue-lotus mantle couture, large curved collar, smooth ink-blue panels, simple ivory underlayer, restrained metallic edging"
     :lighting "cool cyan moonlight, blue lotus rim light, clean facial visibility, restrained bloom")
    (:plant "red camellia" :shell "silent camellia moon pavilion"
     :palette "camellia red, warm ivory, muted moss, moon graphite, soft rose shadow"
     :botanical "large red camellia medallions, smooth rounded petal plates, matte moss planes, warm ivory mist, restrained botanical masses"
     :symbol "single camellia medallion, smooth red lacquer comb, round moon seal"
     :outfit "camellia medallion jacket couture, broad red panels, warm ivory sleeves, smooth waist sash, no tiny trim"
     :lighting "warm overcast moon glow, rose edge light, ivory skin priority, quiet matte highlights")
    (:plant "black iris" :shell "black iris mirror observatory"
     :palette "black iris violet, moon pearl, dark jade, smoked lavender, silver ash"
     :botanical "oversized black iris fan panels, smooth mirrored jade arcs, smoked lavender mist, low-frequency petal architecture"
     :symbol "black iris fan, pearl mirror disk, dark jade pendant"
     :outfit "black-iris fan couture, broad violet cape panels, pearl inner collar, smooth dark-jade sleeves, minimal ornament"
     :lighting "smoked violet moonlight, pearl rim light, clean shadow separation, low-noise editorial glow")
    (:plant "gold osmanthus" :shell "quiet osmanthus moon archive"
     :palette "soft osmanthus gold, cream ivory, moon celadon, warm gray, pale amber"
     :botanical "large osmanthus cloud masses, smooth golden botanical panels, matte celadon shelves, broad amber mist, simplified flower clusters"
     :symbol "single osmanthus cloud brooch, smooth amber page marker, round celadon charm"
     :outfit "osmanthus archive robe couture, broad cream-gold panels, smooth celadon collar, simple sleeve volumes, no micro embroidery"
     :lighting "soft amber moonlight, celadon bounce light, warm ivory face priority, controlled glow")
    (:plant "silver fern" :shell "silver fern lunar cloister"
     :palette "silver fern green, mist white, pale eucalyptus, graphite gray, moon pearl"
     :botanical "oversized silver fern fans, broad simplified frond silhouettes, matte eucalyptus walls, pearl mist sheets, low-detail botanical arches"
     :symbol "single silver fern fan, pearl clasp, smooth graphite crescent pin"
     :outfit "silver-fern cloak couture, large fan-shaped collar, mist-white dress panels, smooth eucalyptus sleeves, restrained clasp"
     :lighting "misty pearl moonlight, eucalyptus rim light, soft graphite shadows, clean matte highlights")
    (:plant "snow hydrangea" :shell "snow hydrangea dome chamber"
     :palette "snow hydrangea white, pale blue, silk lavender, moon gray, pearl mint"
     :botanical "large hydrangea cloud forms, smooth rounded bloom masses, pale blue dome panels, low-frequency floral silhouettes, pearl mist"
     :symbol "single hydrangea cloud ornament, silk lavender hair disk, pearl mint ring"
     :outfit "hydrangea cloud capelet, broad rounded white panels, pale blue inner dress, smooth lavender sash, minimal seam lines"
     :lighting "frosted moonlight, pale blue rim glow, pearl-white face priority, restrained bloom")
    (:plant "jade bamboo" :shell "jade bamboo moon corridor"
     :palette "jade bamboo green, moon ivory, shadow teal, pearl gray, soft gold"
     :botanical "large bamboo screen planes, smooth vertical jade panels, sparse broad leaves, pearl-gray mist, clean corridor silhouettes"
     :symbol "single jade bamboo screen, soft gold cord ring, smooth ivory hair clasp"
     :outfit "jade-bamboo screen coat, broad vertical panels, moon-ivory collar, smooth teal sleeves, no woven micro-detail"
     :lighting "jade corridor moonlight, soft gold edge accents, ivory face priority, clean shadow lanes")
    (:plant "violet wisteria" :shell "violet wisteria lunar theater"
     :palette "violet wisteria, moon ivory, pale lilac, silver blue, soft plum"
     :botanical "large wisteria curtain masses, simplified hanging bloom sheets, smooth silver-blue stage arcs, low-frequency floral drapery"
     :symbol "single wisteria curtain loop, smooth plum ribbon disk, silver-blue moon token"
     :outfit "wisteria theater cape couture, broad violet drape panels, moon-ivory bodice, smooth lilac sleeves, no thin tassels"
     :lighting "soft lilac moonlight, silver-blue rim glow, ivory face priority, controlled bloom")
    (:plant "pearl lily" :shell "pearl lily tidal observatory"
     :palette "pearl lily white, tide mint, moon blue, shell gray, pale champagne"
     :botanical "oversized pearl lily bowls, smooth tidal petal basins, matte shell-gray arcs, tide-mint mist, low-frequency aquatic forms"
     :symbol "single pearl lily bowl, shell-gray moon ring, pale champagne clasp"
     :outfit "pearl-lily basin couture, broad white collar bowl, tide-mint dress panels, smooth moon-blue sleeves, minimal ornament"
     :lighting "tidal moonlight, mint rim light, pearl skin priority, soft champagne highlights")))

(defparameter *moon-jade-lotus-observatory-shots*
  '((:shot "half-bust" :action "one hand holding a smooth moon token near the cheek, the other hand resting inside a broad sleeve"
     :camera "tight portrait lens, slight high angle, three-quarter view from left, clean face priority"
     :composition "half-bust vertical portrait, character on the right third, botanical disk behind the left shoulder, large open mist above the head")
    (:shot "full-body" :action "both hands opening a single broad botanical screen in front of the body, calm forward gaze"
     :camera "full-body editorial lens, low angle from below eye level, long vertical crop, clear silhouette priority"
     :composition "full-body vertical portrait, character centered low in frame, tall botanical screen forming a quiet arch, large negative space above")
    (:shot "half-bust" :action "one hand touching a large translucent petal panel, the other hand lowered out of frame, head turned away slightly"
     :camera "medium close lens, side three-quarter angle, shoulder-level camera, soft off-center crop"
     :composition "half-bust asymmetrical portrait, face near upper left third, botanical panel crossing the right background, open mist corridor")
    (:shot "full-body" :action "walking slowly past a large smooth botanical disk, one sleeve lifted gently, gaze angled downward"
     :camera "full-body tracking editorial angle, slight side view, mild low angle, calm motion crop"
     :composition "full-body diagonal composition, character crossing from lower left to upper right, botanical disk anchored behind the torso")
    (:shot "half-bust" :action "hands folded over the chest inside smooth sleeves, quiet direct gaze, shoulders turned in profile"
     :camera "portrait lens, profile-biased three-quarter angle, slight telephoto compression, clean facial readability"
     :composition "half-bust profile composition, character placed on the left third, broad botanical mass balancing the right side")
    (:shot "full-body" :action "standing with one arm extended toward a suspended moon dial, the other arm relaxed along the coat"
     :camera "full-body wide portrait lens, high angle looking slightly downward, clean floor-space geometry"
     :composition "full-body vertical layout, character small but readable in lower third, suspended botanical moon dial above, open central negative space")
    (:shot "half-bust" :action "one hand lifting a broad collar edge, the other hand hidden inside the sleeve, calm sidelong gaze"
     :camera "medium close editorial crop, low angle near shoulder height, subtle upward gaze line"
     :composition "half-bust close-up, collar panels forming a smooth foreground crescent, face isolated by mist negative space")
    (:shot "full-body" :action "kneeling beside a smooth botanical basin, one hand hovering over the surface, head tilted softly"
     :camera "full-body portrait lens, overhead three-quarter angle, gentle top-down editorial framing"
     :composition "full-body kneeling composition, character in lower right, botanical basin as large oval on the left, clean surrounding mist")
    (:shot "half-bust" :action "one hand raised beside the ear near a simple round ornament, the other hand lightly touching the opposite sleeve"
     :camera "tight portrait crop, straight-on camera with slight Dutch tilt, face and hand clarity priority"
     :composition "half-bust graphic composition, character centered slightly high, broad botanical halo offset behind the head")
    (:shot "full-body" :action "turning back over one shoulder while holding a single smooth botanical charm at waist level"
     :camera "full-body rear three-quarter editorial angle, eye-level camera, long clean silhouette"
     :composition "full-body S-curve layout, character on right third, botanical architecture receding into the left mist")))

(defparameter *moon-jade-lotus-observatory-characters*
  '((:character "elegant adult woman, long smooth black hair in one heavy ribbon-tied fall, broad side bang, calm mature expression, pearl moon earrings, no thin loose strands")
    (:character "elegant adult man, short smooth silver undercut, clean side part, composed gaze, simple jade ear cuff, sharp but soft facial lines")
    (:character "androgynous adult character, chin-length smooth ash bob, blunt curved fringe, quiet distant gaze, single round moon clasp at the collar")
    (:character "elegant adult woman, high smooth chestnut bun with one large curved hair loop, open forehead, calm confident expression, simple mineral hairpin")
    (:character "elegant adult man, long smooth midnight hair tied low behind the shoulder, broad front lock, serene profile, minimal silver brow accent")
    (:character "elegant adult woman, short smooth ivory pixie cut, rounded silhouette, gentle direct gaze, small jade stud earrings")
    (:character "androgynous adult character, long smooth pale-lilac straight hair falling as two broad sheets, centered part, soft unreadable expression")
    (:character "elegant adult man, medium-length smooth dark teal hair swept back, no strand detail, calm half-smile, simple pearl collar pin")
    (:character "elegant adult woman, shoulder-length smooth rose-brown wave mass, single broad S-shaped bang, warm quiet gaze, round moon pendant")
    (:character "androgynous adult character, short geometric graphite bob, clean blunt edges, cool observatory gaze, paired mineral earrings")))

(defun moon-jade-lotus-observatory-mutation (index)
  (let* ((plant-data (nth (mod index 10) *moon-jade-lotus-observatory-plants*))
         (shot-data (nth (mod (+ (* 7 index) (floor index 10)) 10)
                         *moon-jade-lotus-observatory-shots*))
         (character-data (nth (mod (+ (* 3 index) (floor index 10)) 10)
                              *moon-jade-lotus-observatory-characters*))
         (variant-number (1+ index))
         (plant (getf plant-data :plant))
         (shell (getf plant-data :shell))
         (shot (getf shot-data :shot)))
    `((:subtitle . ,(format nil "~A ~A ~3,'0D" plant shot variant-number))
      (:color-theme . ,(getf plant-data :palette))
      (:secondary . ,(format nil "~A beauty editorial, ~A, quiet luxury botanical-celestial portrait, large calm negative space, soft natural diffusion"
                             plant shell))
      (:scene . ,(format nil "inside a ~A, oversized ~A forms surrounding the environment, distant botanical architecture dissolving into moon mist, clean breathing space, calm celestial stillness"
                         shell plant))
      (:botanical-system . ,(getf plant-data :botanical))
      (:thematic-symbol . ,(getf plant-data :symbol))
      (:character-design . ,(getf character-data :character))
      (:outfit-design . ,(getf plant-data :outfit))
      (:action . ,(getf shot-data :action))
      (:camera . ,(getf shot-data :camera))
      (:composition . ,(getf shot-data :composition))
      (:tertiary-evolution-strategy . ,(format nil "fashion evolves toward ~A calm, the ~A becomes protective botanical couture, plant forms become broad readable panels instead of tiny detail clusters, hair and clothing remain smooth low-fragmentation shapes, beauty emerges through quiet moonlit diffusion"
                                               plant shell))
      (:quaternary . "localized prism accent only, controlled secondary material shimmer, suppressed prism spread, no glitter accumulation")
      (:quaternary-atmosphere . ,(format nil "large translucent ~A moon-mist planes, soft visibility gradients, broad optical diffusion sheets, localized silver rim shimmer only, minimal sparkle density, controlled glow spread"
                                         plant))
      (:lighting . ,(getf plant-data :lighting)))))

(defun moon-jade-lotus-observatory-mutations ()
  (loop for i from 0 below 100
        collect (moon-jade-lotus-observatory-mutation i)))

(register-expansion-plan
 'moon-jade-lotus-observatory-100
 (make-expansion-plan
  :name 'moon-jade-lotus-observatory-100
  :intent "one hundred botanical-celestial portrait variants derived from MOON-JADE-LOTUS-OBSERVATORY using the variant controller"
  :source-prompt 'moon-jade-lotus-observatory
  :preserve '(:title :primary :quality :negative :negative-space-guidance :noise-reduction-ladder)
  :variant-axes
  (parse-variant-axis-spec
   '((:required :color-theme :theme-anchor :accessory-set :action :composition)
     (:recommended :scene-shell :outfit-design :evolution-strategy :camera)
     (:theme-anchor-keys :secondary :scene :botanical-system :tertiary-evolution-strategy)
     (:accessory-keys :botanical-system :thematic-symbol :outfit-design :action)
     (:camera-keys :camera)))
  :mutations (moon-jade-lotus-observatory-mutations)))
