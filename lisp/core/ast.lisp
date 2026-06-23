(in-package #:prompt-universe)

(defstruct prompt-param
  value)

(defstruct prompt-section
  heading
  entries)

(defstruct prompt
  name
  intent
  semantic-tags
  risk-tags
  preface
  sections)

(defstruct prompt-module
  name
  intent
  semantic-tags
  injections)

(defstruct prompt-method
  name
  intent
  semantic-tags
  injections)

(defun normalize-tag (tag)
  (if (keywordp tag)
      tag
      (intern (string-upcase (string tag)) :keyword)))

(defun normalize-tags (tags)
  (mapcar #'normalize-tag (ensure-list tags)))

(defun ensure-list (value)
  (if (listp value) value (list value)))