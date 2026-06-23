(in-package #:prompt-universe)

(defun injections->sections (injections)
  (loop for injection in injections
        for key = (car injection)
        for entries = (cdr injection)
        collect (make-prompt-section
                 :heading (section-key->heading key)
                 :entries entries)))

(defun module->sections (module)
  (injections->sections (prompt-module-injections module)))

(defun method->sections (method)
  (injections->sections (prompt-method-injections method)))

(defun resolve-module-sections (module-refs)
  (loop for ref in module-refs
        for module = (find-module ref)
        unless module
          do (error "Module not found: ~A" ref)
        append (module->sections module)))

(defun resolve-method-sections (method-refs)
  (loop for ref in method-refs
        for method = (find-prompt-method ref)
        unless method
          do (error "Method not found: ~A" ref)
        append (method->sections method)))

(defun merge-sections (section-lists)
  (let ((order 0)
        (table (make-hash-table :test #'equal)))
    (flet ((note-section (section)
             (let* ((heading (normalize-heading (prompt-section-heading section)))
                    (cell (gethash heading table)))
               (unless cell
                 (incf order)
                 (setf cell (list order nil))
                 (setf (gethash heading table) cell))
               (setf (second cell)
                     (append (second cell) (prompt-section-entries section))))))
      (loop for sections in section-lists
            do (dolist (section sections)
                 (note-section section)))
      (loop for heading being the hash-keys of table using (hash-value cell)
            collect (make-prompt-section
                     :heading heading
                     :entries (second cell))
            into merged
            finally (return (stable-sort merged #'< :key (lambda (section)
                                                            (first (gethash
                                                                    (prompt-section-heading section)
                                                                    table)))))))))

(defun expand-prompt-structure (name intent semantic-tags risk-tags preface
                                direct-sections module-refs method-refs)
  (let* ((expanded-sections
          (merge-sections
           (list (resolve-module-sections module-refs)
                 (resolve-method-sections method-refs)
                 direct-sections))))
    (make-prompt
     :name name
     :intent intent
     :semantic-tags semantic-tags
     :risk-tags risk-tags
     :preface preface
     :sections (sort-sections expanded-sections))))