(in-package #:prompt-universe)

(defun parse-seed-control-forms (name forms)
  (let ((intent nil)
        (seed-id nil)
        (source-prompt nil)
        (preserve nil)
        (mutate nil)
        (forbid nil)
        (locked-sections nil)
        (parameterized-sections nil)
        (variant-axes nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid seed-control form in ~A: ~S" name form))
      (case (first form)
        (:intent (setf intent (second form)))
        (:seed (setf seed-id (second form)))
        (:source (setf source-prompt (second form)))
        (:preserve (setf preserve (rest form)))
        (:mutate (setf mutate (rest form)))
        (:forbid (setf forbid (rest form)))
        (:locked-sections (setf locked-sections (rest form)))
        (:parameterized-sections (setf parameterized-sections (rest form)))
        (:variant-axes
         (setf variant-axes (parse-variant-axis-spec (rest form))))
        (otherwise
         (error "Unknown seed-control form in ~A: ~S" name form))))
    (make-seed-control
     :name name
     :intent intent
     :seed-id seed-id
     :source-prompt source-prompt
     :preserve preserve
     :mutate mutate
     :forbid forbid
     :locked-sections locked-sections
     :parameterized-sections parameterized-sections
     :variant-axes variant-axes)))

(defmacro defseed-control (name &body forms)
  `(register-seed-control ',name (parse-seed-control-forms ',name ',forms)))

(defun seed-control-base-prompt (control)
  (cond
    ((seed-control-source-prompt control)
     (or (find-prompt (seed-control-source-prompt control))
         (error "Source prompt not registered: ~A"
                (seed-control-source-prompt control))))
    ((seed-control-seed-id control)
     (load-seed (seed-control-seed-id control)))
    (t (error "Seed control ~A has no :source or :seed"
              (seed-control-name control)))))

(defun effective-plan-preserve (plan)
  (or (expansion-plan-preserve plan)
      (let ((control (expansion-plan-seed-control-object plan)))
        (and control (seed-control-preserve control)))))

(defun effective-plan-forbid (plan)
  (or (expansion-plan-forbid plan)
      (let ((control (expansion-plan-seed-control-object plan)))
        (and control (seed-control-forbid control)))))
