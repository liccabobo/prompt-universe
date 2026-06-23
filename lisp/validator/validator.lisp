(in-package #:prompt-universe)

(defun ensure-prompt (name-or-prompt)
  (if (prompt-p name-or-prompt)
      name-or-prompt
      (or (find-prompt name-or-prompt)
          (error "Prompt not found: ~A" name-or-prompt))))

(defun validation-message-text (message)
  (if (consp message) (second message) message))

(defun validation-message-severity (message)
  (if (consp message) (first message) :reject))

(defun merge-validation-messages (&rest message-lists)
  (loop for messages in message-lists
        append messages))

(defun validate-prompt (prompt)
  "Return two values: valid-p and a list of validation messages."
  (unless (prompt-p prompt)
    (return-from validate-prompt (values nil (list "object is not a prompt"))))
  (let* ((schema-messages (validate-schema prompt))
         (rendered (render-prompt prompt))
         (responsible-messages (validate-responsible-rendered rendered))
         (all-messages (merge-validation-messages
                        (mapcar (lambda (text) (list :reject text)) schema-messages)
                        responsible-messages)))
    (values (null all-messages)
            (mapcar #'validation-message-text all-messages))))

(defun validate-prompt-detail (prompt)
  "Return valid-p and structured validation results."
  (unless (prompt-p prompt)
    (return-from validate-prompt-detail
      (values nil (list (list :reject "object is not a prompt")))))
  (let* ((schema-messages (validate-schema prompt))
         (rendered (render-prompt prompt))
         (responsible-messages (validate-responsible-rendered rendered))
         (all-messages (merge-validation-messages
                        (mapcar (lambda (text) (list :reject text)) schema-messages)
                        responsible-messages)))
    (values (null all-messages) all-messages)))