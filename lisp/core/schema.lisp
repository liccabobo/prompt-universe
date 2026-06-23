(in-package #:prompt-universe)

(defun param (value)
  "Mark VALUE as a replaceable prompt parameter."
  (make-prompt-param :value value))

(defun parse-entry (entry)
  (cond
    ((and (consp entry) (eq (first entry) 'param))
     (param (second entry)))
    (t entry)))

(defun parse-section-entries (entries)
  (mapcar #'parse-entry entries))

(defun parse-injection-forms (forms)
  (loop for form in forms
        when (and (consp form) (keywordp (first form)))
        collect (let ((key (first form))
                      (entries (parse-section-entries (rest form))))
                  (cons key entries))))

(defun parse-module-forms (name forms)
  (let ((intent nil)
        (semantic-tags nil)
        (injections nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid module form in ~A: ~S" name form))
      (case (first form)
        (:intent
         (setf intent (second form)))
        (:semantic-tags
         (setf semantic-tags (normalize-tags (rest form))))
        (otherwise
         (when (keywordp (first form))
           (push (cons (first form) (parse-section-entries (rest form)))
                 injections)))))
    (make-prompt-module
     :name name
     :intent intent
     :semantic-tags (nreverse semantic-tags)
     :injections (nreverse injections))))

(defun parse-method-forms (name forms)
  (let ((intent nil)
        (semantic-tags nil)
        (injections nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid method form in ~A: ~S" name form))
      (case (first form)
        (:intent
         (setf intent (second form)))
        (:semantic-tags
         (setf semantic-tags (normalize-tags (rest form))))
        (:inject
         (setf injections (append injections (parse-injection-forms (rest form)))))
        (otherwise
         (when (keywordp (first form))
           (setf injections
                 (append injections
                         (list (cons (first form)
                                     (parse-section-entries (rest form))))))))))
    (make-prompt-method
     :name name
     :intent intent
     :semantic-tags (normalize-tags semantic-tags)
     :injections injections)))

(defun parse-prompt-forms (name forms)
  (let ((intent nil)
        (semantic-tags nil)
        (risk-tags nil)
        (preface nil)
        (sections nil)
        (module-refs nil)
        (method-refs nil))
    (dolist (form forms)
      (unless (consp form)
        (error "Invalid prompt form in ~A: ~S" name form))
      (case (first form)
        (:intent
         (setf intent (second form)))
        (:semantic-tags
         (setf semantic-tags (normalize-tags (rest form))))
        (:risk-tags
         (setf risk-tags (normalize-tags (rest form))))
        (:preface
         (setf preface (rest form)))
        (:section
         (destructuring-bind (_ heading &rest entries) form
           (declare (ignore _))
           (push (make-prompt-section
                  :heading (normalize-heading heading)
                  :entries (parse-section-entries entries))
                 sections)))
        (:use-module
         (setf module-refs (append module-refs (rest form))))
        (:use-method
         (setf method-refs (append method-refs (rest form))))
        (otherwise
         (error "Unknown prompt form in ~A: ~S" name form))))
    (expand-prompt-structure
     name intent semantic-tags risk-tags preface
     (nreverse sections) module-refs method-refs)))

(defmacro defmodule (name &body forms)
  `(register-module ',name (parse-module-forms ',name ',forms)))

(defmacro defprompt-method (name &body forms)
  `(register-method ',name (parse-method-forms ',name ',forms)))

(defmacro defprompt (name &body forms)
  `(register-prompt ',name (parse-prompt-forms ',name ',forms)))