(in-package #:prompt-universe)

(defvar *composition-tree-registry* (make-hash-table :test #'equal))

(defstruct composition-node
  role
  name
  priority
  preserve
  mutable
  position
  details)

(defstruct composition-tree
  name
  intent
  canvas
  focal-order
  nodes)

(defun register-composition-tree (name tree)
  (let ((key (normalize-name name)))
    (when (gethash key *composition-tree-registry*)
      (warn "Overwriting existing composition tree: ~A" key))
    (setf (gethash key *composition-tree-registry*) tree))
  name)

(defun find-composition-tree (name)
  (gethash (normalize-name name) *composition-tree-registry*))

(defun parse-composition-node-options (options)
  (let ((priority nil)
        (preserve nil)
        (mutable nil)
        (position nil)
        (details nil)
        (tail options))
    (loop while tail
          do (let ((key (pop tail)))
               (unless (keywordp key)
                 (error "Invalid composition node option: ~S" key))
               (unless tail
                 (error "Missing value for composition node option: ~A" key))
               (let ((value (pop tail)))
                 (case key
                   (:priority (setf priority value))
                   (:preserve (setf preserve value))
                   (:mutable (setf mutable value))
                   (:position (setf position value))
                   (:details (setf details (ensure-list value)))
                   (otherwise
                    (push (format nil "~(~A~): ~(~A~)" key value)
                          details))))))
    (values priority preserve mutable position (nreverse details))))

(defun parse-composition-node-form (form)
  (unless (and (consp form) (symbolp (first form)) (second form))
    (error "Invalid composition node form: ~S" form))
  (multiple-value-bind (priority preserve mutable position details)
      (parse-composition-node-options (cddr form))
    (make-composition-node
     :role (first form)
     :name (second form)
     :priority priority
     :preserve preserve
     :mutable mutable
     :position position
     :details details)))

(defun parse-composition-tree-forms (name forms)
  (let ((intent nil)
        (canvas nil)
        (focal-order nil)
        (nodes nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid composition-tree form in ~A: ~S" name form))
      (case (first form)
        (:intent (setf intent (second form)))
        (:canvas (setf canvas (second form)))
        (:focal-order (setf focal-order (rest form)))
        (otherwise
         (push (parse-composition-node-form form) nodes))))
    (make-composition-tree
     :name name
     :intent intent
     :canvas canvas
     :focal-order focal-order
     :nodes (nreverse nodes))))

(defmacro defcomposition-tree (name &body forms)
  `(register-composition-tree ',name
                              (parse-composition-tree-forms ',name ',forms)))

(defun composition-token-text (value)
  (etypecase value
    (null "")
    (string value)
    (symbol (string-downcase (substitute #\space #\- (string value))))
    (number (princ-to-string value))))

(defun composition-list-text (values)
  (format nil "~{~A~^, ~}" (mapcar #'composition-token-text values)))

(defun composition-node-entry (node)
  (let ((parts (list (format nil "~A: ~A"
                             (composition-token-text
                              (composition-node-role node))
                             (composition-token-text
                              (composition-node-name node))))))
    (when (composition-node-priority node)
      (push (format nil "priority ~(~A~)" (composition-node-priority node)) parts))
    (when (composition-node-position node)
      (push (format nil "position ~(~A~)" (composition-node-position node)) parts))
    (when (composition-node-preserve node)
      (push "preserve" parts))
    (when (composition-node-mutable node)
      (push "mutable" parts))
    (dolist (detail (composition-node-details node))
      (push (composition-token-text detail) parts))
    (format nil "~{~A~^, ~}" (nreverse parts))))

(defun composition-tree->sections (tree)
  (let ((composition-entries nil)
        (negative-space-entries nil))
    (when (composition-tree-canvas tree)
      (push (format nil "canvas: ~A"
                    (composition-token-text (composition-tree-canvas tree)))
            composition-entries))
    (when (composition-tree-focal-order tree)
      (push (format nil "focal order: ~A"
                    (composition-list-text (composition-tree-focal-order tree)))
            composition-entries))
    (dolist (node (composition-tree-nodes tree))
      (let ((entry (composition-node-entry node)))
        (if (eq (composition-node-role node) 'negative-space)
            (push entry negative-space-entries)
            (push entry composition-entries))))
    (append
     (when composition-entries
       (list (make-prompt-section
              :heading "COMPOSITION"
              :entries (nreverse composition-entries))))
     (when negative-space-entries
       (list (make-prompt-section
              :heading "NEGATIVE-SPACE GUIDANCE"
              :entries (nreverse negative-space-entries)))))))

(defun resolve-composition-sections (composition-refs)
  (loop for ref in composition-refs
        for tree = (find-composition-tree ref)
        unless tree
          do (error "Composition tree not found: ~A" ref)
        append (composition-tree->sections tree)))
