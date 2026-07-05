(in-package #:prompt-universe)

(defvar *required-prop-sections*
  '("TITLE ONLY" "NEGATIVE")
  "Minimum required headings for prop-design prompts.")

(defvar *title-section-alternatives*
  '("TITLE ONLY" "TITLE MUST & ONLY" "TITLE")
  "Accepted title lock headings across seed eras.")

(defun prompt-has-section-p (prompt heading)
  (some (lambda (section)
          (string= (normalize-heading (prompt-section-heading section))
                   (normalize-heading heading)))
        (prompt-sections prompt)))

(defun validate-schema (prompt)
  (let ((messages nil))
    (unless (prompt-sections prompt)
      (push "prompt has no sections" messages))
    (dolist (required *required-prop-sections*)
      (cond
        ((string= required "TITLE ONLY")
         (unless (some (lambda (heading)
                         (prompt-has-section-p prompt heading))
                       *title-section-alternatives*)
           (push "missing required section: TITLE ONLY" messages)))
        ((not (prompt-has-section-p prompt required))
         (push (format nil "missing required section: ~A" required) messages))))
    (dolist (section (prompt-sections prompt))
      (let ((heading (prompt-section-heading section)))
        (unless (and (stringp heading) (> (length heading) 0))
          (push "section has invalid heading" messages))
        (unless (prompt-section-entries section)
          (push (format nil "section has no entries: ~A" heading) messages))))
    messages))
