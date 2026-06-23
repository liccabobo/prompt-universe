(in-package #:prompt-universe)

(defvar *evolution-registry* (make-hash-table :test #'equal))

(defstruct evolution-rule
  name
  intent
  seed-id
  source-prompt
  preserve
  forbid
  mutations)

(defun register-evolution (name rule)
  (setf (gethash (normalize-name name) *evolution-registry*) rule)
  name)

(defun find-evolution (name)
  (gethash (normalize-name name) *evolution-registry*))

(defun parse-evolution-forms (name forms)
  (let ((intent nil)
        (seed-id nil)
        (source-prompt nil)
        (preserve nil)
        (forbid nil)
        (mutations nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid evolution form in ~A: ~S" name form))
      (case (first form)
        (:intent (setf intent (second form)))
        (:seed (setf seed-id (second form)))
        (:source (setf source-prompt (second form)))
        (:preserve (setf preserve (rest form)))
        (:forbid (setf forbid (rest form)))
        (:mutations
         (setf mutations
               (loop for entry in (rest form)
                     collect (parse-mutation-entry entry))))
        (otherwise
         (error "Unknown evolution form in ~A: ~S" name form))))
    (make-evolution-rule
     :name name
     :intent intent
     :seed-id seed-id
     :source-prompt source-prompt
     :preserve preserve
     :forbid forbid
     :mutations mutations)))

(defmacro defevolution (name &body forms)
  `(register-evolution ',name (parse-evolution-forms ',name ',forms)))

(defun evolution-base-prompt (rule)
  (cond
    ((evolution-rule-source-prompt rule)
     (or (find-prompt (evolution-rule-source-prompt rule))
         (error "Source prompt not registered: ~A"
                (evolution-rule-source-prompt rule))))
    ((evolution-rule-seed-id rule)
     (load-seed (evolution-rule-seed-id rule)))
    (t (error "Evolution ~A has no :source or :seed" (evolution-rule-name rule)))))

(defun evolve-prompt (source evolution-name &key count)
  (let* ((controller (reload-variant-controller))
         (rule (or (find-evolution evolution-name)
                   (error "Evolution rule not found: ~A" evolution-name)))
         (base (if (prompt-p source)
                   source
                   (or (find-prompt source)
                       (evolution-base-prompt rule))))
         (base-name (prompt-name base))
         (run-date (format-variant-date))
         (run-directory (variant-run-directory base-name run-date))
         (limit (resolve-variant-count count controller))
         (mutations (evolution-rule-mutations rule))
         (paths nil))
    (unless mutations
      (error "Evolution ~A has no :mutations" evolution-name))
    (loop for mutation in mutations
          for i from 1
          while (<= i limit)
          do (let* ((variant (apply-mutation (clone-prompt base) mutation))
                    (variant* (apply-variant-controller-effects variant controller)))
               (push (write-variant-file variant* i
                                         :base-name base-name
                                         :directory run-directory
                                         :run-date run-date)
                     paths)))
    (values (reverse paths) (length paths) run-directory)))