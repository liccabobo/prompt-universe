(in-package #:prompt-universe)

(defparameter *forbidden-responsible-phrases*
  '("in the style of" "looks like" "celebrity" "real person likeness")
  "Responsible prompt checks for generated prompts.")

(defun string-contains-ci-p (needle haystack)
  (search (string-downcase needle)
          (string-downcase haystack)
          :test #'char=))

(defun allowlisted-term-p (term rendered)
  (string-contains-ci-p term rendered))

(defun validate-responsible-rendered (rendered)
  (let ((messages nil))
    (dolist (phrase *forbidden-responsible-phrases*)
      (when (string-contains-ci-p phrase rendered)
        (push (list :reject
                    (format nil "responsible validator flagged phrase: ~A" phrase))
              messages)))
    messages))