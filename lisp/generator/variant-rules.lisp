(in-package #:prompt-universe)

(defvar *default-variant-axis-spec*
  '(:required (:color-theme :theme-anchor :accessory-set)
    :recommended (:scene-shell :outfit-design :evolution-strategy :action :composition)
    :theme-anchor-keys (:secondary :background :evolution-strategy :object-design
                                    :flavor :story-background)
    :accessory-keys (:thematic-symbol :accessory-design :top-garnish))
  "Default semantic axes for variant expansion plans.")

(defvar *variant-axis->mutation-keys*
  '((:color-theme . (:color-theme :color-design :lighting))
    (:theme-anchor . (:secondary :background :evolution-strategy :object-design
                                 :flavor :story-background))
    (:accessory-set . (:thematic-symbol :accessory-design :top-garnish))
    (:scene-shell . (:background :secondary))
    (:outfit-design . (:outfit-design :matching-outfit-design :matching-hat-design))
    (:evolution-strategy . (:evolution-strategy :design-evolution-strategy
                            :tertiary-evolution-strategy))
    (:action . (:action))
    (:composition . (:composition)))
  "Map semantic axes to concrete mutation keys.")

(defun parse-variant-axis-spec (forms)
  (let ((spec (copy-list *default-variant-axis-spec*)))
    (loop for form in forms
          when (and (consp form) (keywordp (first form)))
          do (setf (getf spec (first form)) (rest form)))
    spec))

(defun variant-axis-spec (plan)
  (or (expansion-plan-variant-axes plan)
      (let ((control (expansion-plan-seed-control-object plan)))
        (and control (seed-control-variant-axes control)))
      *default-variant-axis-spec*))

(defun axis-mutation-keys (axis &optional (spec *default-variant-axis-spec*))
  (let ((defaults (cdr (assoc axis *variant-axis->mutation-keys*)))
        (override-key (cond ((eq axis :theme-anchor) :theme-anchor-keys)
                            ((eq axis :accessory-set) :accessory-keys)
                            (t nil))))
    (or (and override-key (getf spec override-key))
        defaults
        (list axis))))

(defun mutation-keys (mutation)
  (loop for pair in mutation
        when (and (consp pair) (keywordp (car pair)))
        collect (car pair)))

(defun mutation-covers-axis-p (mutation axis &optional spec)
  (let ((keys (axis-mutation-keys axis spec)))
    (some (lambda (key) (member key (mutation-keys mutation))) keys)))

(defun section-entry-text (entry)
  (if (prompt-param-p entry)
      (prompt-param-value entry)
      (string entry)))

(defun prompt-section-text (prompt heading)
  (let ((target (normalize-heading heading)))
    (loop for section in (prompt-sections prompt)
          when (string= target (normalize-heading (prompt-section-heading section)))
          do (return (format nil "~{~A~^, ~}"
                             (mapcar #'section-entry-text
                                     (prompt-section-entries section)))))))

(defun mutation-value-changed-p (base mutation-key mutation)
  (let* ((heading (mutation-key->heading mutation-key))
         (base-text (prompt-section-text base heading))
         (new-value (cdr (assoc mutation-key mutation))))
    (and new-value
         (not (string= (string-downcase (string base-text))
                       (string-downcase (string new-value)))))))

(defun mutation-satisfies-axis-p (base mutation axis spec)
  (let ((keys (axis-mutation-keys axis spec)))
    (some (lambda (key)
            (and (member key (mutation-keys mutation))
                 (mutation-value-changed-p base key mutation)))
          keys)))

(defun validate-variant-mutation (base mutation index spec)
  (let ((messages nil)
        (required (getf spec :required)))
    (dolist (axis required)
      (unless (mutation-satisfies-axis-p base mutation axis spec)
        (push (format nil "variant ~D missing required axis ~A" index axis)
              messages)))
    messages))

(defun parse-expansion-validation-args (args)
  (let ((base nil)
        (controller nil)
        (tail args))
    (when (and tail (not (keywordp (first tail))))
      (setf base (pop tail)))
    (loop while tail
          do (let ((key (pop tail)))
               (unless (and (keywordp key) tail)
                 (error "Invalid validate-expansion-plan-mutations arguments: ~S" args))
               (let ((value (pop tail)))
                 (case key
                   (:base (setf base value))
                   (:controller (setf controller value))
                   (otherwise
                    (error "Unknown validate-expansion-plan-mutations keyword: ~A" key))))))
    (values base controller)))

(defun validate-expansion-plan-mutations (plan &rest args)
  (multiple-value-bind (base controller)
      (parse-expansion-validation-args args)
    (let* ((ctrl (or controller (ignore-errors (variant-controller))))
         (base-prompt (or base (plan-base-prompt plan)))
         (spec (if ctrl
                   (effective-variant-axis-spec plan ctrl)
                   (variant-axis-spec plan)))
         (messages nil))
      (loop for mutation in (expansion-plan-mutations plan)
            for index from 1
            do (setf messages
                     (append messages
                             (validate-variant-mutation base-prompt mutation index spec)
                             (if ctrl
                                 (gender-controller-messages mutation index ctrl)
                                 nil))))
      (values (null messages) messages spec))))

(defun variant-axis-summary (plan)
  (let ((spec (variant-axis-spec plan)))
    (list :required (getf spec :required)
          :recommended (getf spec :recommended)
          :theme-anchor-keys (getf spec :theme-anchor-keys)
          :accessory-keys (getf spec :accessory-keys))))
