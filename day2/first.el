(provide 'first)

(setq input (with-temp-buffer
  (insert-file-contents "test.txt")
  (buffer-string)))

(let* ((reports (mapcar (lambda (str) (mapcar #'string-to-number (split-string str " "))) (butlast (split-string input "\n"))))
      (diffs (mapcar (lambda (report) (cdr (mapcar (lambda (i) (- (nth i report) (if (equal i 0) (nth i report) (nth (- i 1) report)))) (number-sequence 0 (- (length report) 1))))) reports))
      (is-monotonic (mapcar (lambda (report) (= (length (delete-dups (mapcar (lambda (x) (>= x 0)) report))) 1)) diffs))
      (contained-in-range (mapcar (lambda (report) (and (> (seq-min (mapcar #'abs report)) 0) (<= (seq-max (mapcar #'abs report)) 3))) diffs))
      (safe (mapcar (lambda (i) (and (nth i is-monotonic) (nth i contained-in-range))) (number-sequence 0 (- (length reports) 1)))))
      (message "%S" (length (remove nil safe))))


;;; first.el ends here
