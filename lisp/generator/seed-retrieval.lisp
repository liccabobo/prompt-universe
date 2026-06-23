(in-package #:prompt-universe)

(defstruct seed-metadata
  id
  category
  basename
  intent-hint
  semantic-tags
  score)

(defvar *seed-category-tags*
  '(("prop-design" . (:prop-design :object :food :dessert))
    ("character-design" . (:character-design :editorial :cover))
    ("detail-shot" . (:detail-shot :macro :anatomy))
    ("story-illustration" . (:story :illustration))
    ("evolution-strategy" . (:evolution :editorial :poster))
    ("evolution-fusion" . (:fusion :cross-theme))
    ("noise-reduction-ladder" . (:noise-control :character :editorial))))

(defun all-seed-ids ()
  (let ((root-path (truename *seed-root*)))
    (sort
     (loop for file in (directory (merge-pathnames "**/*.md" root-path))
           for rel = (enough-namestring file root-path)
           collect (subseq rel 0 (- (length rel) 3)))
     #'string<)))

(defun seed-category (seed-id)
  (subseq seed-id 0 (position #\/ seed-id)))

(defun seed-basename (seed-id)
  (subseq seed-id (1+ (position #\/ seed-id))))

(defun seed-semantic-tags (seed-id)
  (let ((category (seed-category seed-id)))
    (or (cdr (assoc category *seed-category-tags* :test #'string=))
        (list (intern (string-upcase category) :keyword)))))

(defun seed-intent-hint (seed-id)
  (with-open-file (stream (seed-file-path seed-id) :direction :input)
    (loop for line = (read-line stream nil nil)
          while line
          when (and (> (length line) 0)
                    (not (section-heading-line-p line))
                    (not (char= #\{ (char (string-trim nil line) 0))))
            return line
          finally (return (format nil "curated seed ~A" seed-id)))))

(defun score-seed (seed-id &key intent semantic-tags)
  (let ((score 0)
        (intent-lower (when intent (string-downcase intent)))
        (tags (or semantic-tags (seed-semantic-tags seed-id))))
    (dolist (tag tags)
      (when (member tag (seed-semantic-tags seed-id))
        (incf score 3)))
    (when intent-lower
      (dolist (word (split-words intent-lower))
        (when (and (>= (length word) 3)
                   (or (search word (string-downcase (seed-basename seed-id)))
                       (search word (string-downcase (seed-category seed-id)))
                       (search word (string-downcase (seed-intent-hint seed-id)))))
          (incf score 2))))
    score))

(defun split-words (text)
  (remove-if #'null
             (loop with len = (length text)
                   with start = 0
                   while (< start len)
                   for delim = (position-if (lambda (c) (or (char= c #\space)
                                                            (char= c #\,)
                                                            (char= c #\/)))
                                            text :start start)
                   collect (subseq text start (or delim len))
                   do (setf start (if delim (1+ delim) len)))))

(defun select-seeds (&key intent semantic-tags (limit 5))
  "Return seed metadata sorted by relevance score."
  (let ((results nil))
    (dolist (seed-id (all-seed-ids))
      (let ((score (score-seed seed-id :intent intent :semantic-tags semantic-tags)))
        (when (plusp score)
          (push (make-seed-metadata
                 :id seed-id
                 :category (seed-category seed-id)
                 :basename (seed-basename seed-id)
                 :intent-hint (seed-intent-hint seed-id)
                 :semantic-tags (seed-semantic-tags seed-id)
                 :score score)
                results))))
    (subseq (sort results #'> :key #'seed-metadata-score) 0 (min limit (length results)))))