(in-package #:prompt-universe)

(defun parse-mutation-entry (entry)
  (loop for item in entry
        when (and (consp item) (keywordp (first item)))
        collect (cons (first item) (second item))))

(defun parse-expansion-plan-forms (name forms)
  (let ((intent nil)
        (seed-control nil)
        (seed-id nil)
        (source-prompt nil)
        (preserve nil)
        (forbid nil)
        (variant-axes nil)
        (variant-rules nil)
        (mutations nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid expansion-plan form in ~A: ~S" name form))
      (case (first form)
        (:intent (setf intent (second form)))
        (:seed-control (setf seed-control (second form)))
        (:seed (setf seed-id (second form)))
        (:source (setf source-prompt (second form)))
        (:preserve (setf preserve (rest form)))
        (:forbid (setf forbid (rest form)))
        (:variant-axes
         (setf variant-axes (parse-variant-axis-spec (rest form))))
        (:variant-rules (setf variant-rules (rest form)))
        (:mutations
         (setf mutations
               (loop for entry in (rest form)
                     collect (parse-mutation-entry entry))))
        (otherwise
         (error "Unknown expansion-plan form in ~A: ~S" name form))))
    (make-expansion-plan
     :name name
     :intent intent
     :seed-control seed-control
     :seed-id seed-id
     :source-prompt source-prompt
     :preserve preserve
     :forbid forbid
     :variant-axes variant-axes
     :variant-rules variant-rules
     :mutations mutations)))

(defmacro defexpansion-plan (name &body forms)
  `(register-expansion-plan ',name (parse-expansion-plan-forms ',name ',forms)))

(defun plan-base-prompt (plan)
  (cond
    ((expansion-plan-seed-control plan)
     (seed-control-base-prompt (expansion-plan-seed-control-object plan)))
    ((expansion-plan-source-prompt plan)
     (let ((prompt (find-prompt (expansion-plan-source-prompt plan))))
       (unless prompt
         (error "Source prompt not registered: ~A" (expansion-plan-source-prompt plan)))
       prompt))
    ((expansion-plan-seed-id plan)
     (load-seed (expansion-plan-seed-id plan)))
    (t (error "Expansion plan ~A has no :source or :seed" (expansion-plan-name plan)))))
