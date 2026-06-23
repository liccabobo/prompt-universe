(in-package #:prompt-universe)

(defparameter *variant-controller-path*
  "config/variant-controller.lisp"
  "User-editable variant controller. Only applies to variant batch / evolve runs.")

(defvar *variant-controller* nil
  "Cached controller alist; reload with reload-variant-controller.")

(defvar *variant-controller-keys*
  '(:variant-count :color-shift :gender-mode :scene-shift :accessory-shift
    :evolution-fusion :material-accent :leap-creativity :axis-threshold)
  "Known controller fields.")

(defvar *gender-locked-mutation-keys*
  '(:gender-presentation :body-proportion :face-style :facial-traits)
  "Mutation keys blocked when :gender-mode is :fixed.")

(defun normalize-controller-value (key value)
  (ecase key
    (:color-shift (clamp-controller-slider value))
    (:scene-shift (clamp-controller-slider value))
    (:accessory-shift (clamp-controller-slider value))
    (:evolution-fusion (clamp-controller-slider value))
    (:axis-threshold (clamp-controller-slider value))
    (:gender-mode (if (member value '(:fixed :mutable)) value :fixed))
    (:leap-creativity (not (null value)))
    (:material-accent (if value (string-trim '(#\space) (string value)) ""))
    (:variant-count (max 1 (if (numberp value) (round value) *default-final-variant-count*)))
    (t value)))

(defun clamp-controller-slider (value)
  (max 0 (min 100 (if (numberp value) (round value) 0))))

(defun normalize-controller (alist)
  (loop for key in *variant-controller-keys*
        collect (cons key
                      (normalize-controller-value
                       key (or (cdr (assoc key alist)) (default-controller-value key))))))

(defun default-controller-value (key)
  (ecase key
    (:variant-count *default-final-variant-count*)
    (:color-shift 70)
    (:gender-mode :fixed)
    (:scene-shift 70)
    (:accessory-shift 70)
    (:evolution-fusion 65)
    (:material-accent "")
    (:leap-creativity nil)
    (:axis-threshold 50)))

(defun read-variant-controller-file (path)
  (with-open-file (stream path :direction :input)
    (let ((form (read stream nil)))
      (unless (listp form)
        (error "Variant controller must be an alist in ~A" path))
      form)))

(defun reload-variant-controller (&optional (path *variant-controller-path*))
  (let ((resolved (merge-pathnames path (truename "."))))
    (unless (probe-file resolved)
      (error "Variant controller not found: ~A" resolved))
    (setf *variant-controller* (normalize-controller (read-variant-controller-file resolved)))
    *variant-controller*))

(defun variant-controller ()
  (or *variant-controller* (reload-variant-controller)))

(defun controller-value (key &optional (controller (variant-controller)))
  (cdr (assoc key controller)))

(defun controller-slider-band (value &optional (threshold (controller-value :axis-threshold)))
  (cond
    ((>= value threshold) :hard)
    ((plusp value) :soft)
    (t :off)))

(defun controller-axis-level (axis &optional (controller (variant-controller)))
  (ecase axis
    (:color-theme (controller-value :color-shift controller))
    (:scene-shell (controller-value :scene-shift controller))
    (:theme-anchor (controller-value :scene-shift controller))
    (:accessory-set (controller-value :accessory-shift controller))
    (:evolution-strategy (controller-value :evolution-fusion controller))
    (:outfit-design (controller-value :scene-shift controller))
    (t 0)))

(defun effective-variant-axis-spec (plan &optional (controller (variant-controller)))
  (let* ((base (variant-axis-spec plan))
         (threshold (controller-value :axis-threshold controller))
         (required nil)
         (recommended (copy-list (getf base :recommended))))
    (dolist (axis '(:color-theme :theme-anchor :scene-shell :accessory-set
                                 :evolution-strategy :outfit-design))
      (ecase (controller-slider-band (controller-axis-level axis controller) threshold)
        (:hard (push axis required))
        (:soft (pushnew axis recommended))
        (:off nil)))
    (setf (getf base :required) (remove-duplicates required))
    (setf (getf base :recommended) (remove-duplicates recommended))
    (when (controller-value :leap-creativity controller)
      (setf (getf base :leap-creativity) t))
    base))

(defun resolve-variant-count (requested &optional (controller (variant-controller)))
  "Return explicit REQUESTED count, else :variant-count from controller."
  (or requested (controller-value :variant-count controller)))

(defun variant-controller-summary (&optional (controller (variant-controller)))
  `(:variant-count ,(controller-value :variant-count controller)
    :color-shift ,(controller-value :color-shift controller)
    :gender-mode ,(controller-value :gender-mode controller)
    :scene-shift ,(controller-value :scene-shift controller)
    :accessory-shift ,(controller-value :accessory-shift controller)
    :evolution-fusion ,(controller-value :evolution-fusion controller)
    :material-accent ,(controller-value :material-accent controller)
    :leap-creativity ,(controller-value :leap-creativity controller)
    :axis-threshold ,(controller-value :axis-threshold controller)))

(defun mutation-touches-gender-p (mutation)
  (some (lambda (key) (member key (mutation-keys mutation)))
        *gender-locked-mutation-keys*))

(defun gender-controller-messages (mutation index &optional (controller (variant-controller)))
  (if (and (eq :fixed (controller-value :gender-mode controller))
           (mutation-touches-gender-p mutation))
      (list (format nil "variant ~D violates gender-mode :fixed" index))
      nil))

(defun material-accent-phrase (material)
  (format nil "~A as controlled secondary accent only, localized material accent, suppressed material spread"
          material))

(defun apply-material-accent (prompt &optional (controller (variant-controller)))
  (let ((material (controller-value :material-accent controller)))
    (if (or (null material) (string= material ""))
        prompt
        (append-section-entry prompt "QUATERNARY" (material-accent-phrase material)))))

(defun append-section-entry (prompt heading new-entry)
  (let ((target (normalize-heading heading)))
    (make-prompt
     :name (prompt-name prompt)
     :intent (prompt-intent prompt)
     :semantic-tags (prompt-semantic-tags prompt)
     :risk-tags (prompt-risk-tags prompt)
     :preface (prompt-preface prompt)
     :sections
     (loop for section in (prompt-sections prompt)
           collect
             (if (string= target (normalize-heading (prompt-section-heading section)))
                 (make-prompt-section
                  :heading (prompt-section-heading section)
                  :entries (append (prompt-section-entries section) (list new-entry)))
                 (clone-prompt-section section))))))

(defun apply-variant-controller-effects (prompt &optional (controller (variant-controller)))
  (apply-material-accent prompt controller))