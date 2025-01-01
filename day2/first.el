(provide 'first)

(setq input (with-temp-buffer
  (insert-file-contents "test.txt")
  (buffer-string)))

(let* ((reports (mapcar (lambda (str) (mapcar #'string-to-number (split-string str " "))) (butlast (split-string input "\n"))))
      (indices (number-sequence 0 (- (length (car reports)) 1)))
      (diffs (mapcar (lambda (report) (mapcar (lambda (i) (- (nth i report) (if (equal i 0) (nth i report) (nth (- i 1) report)))) indices)) reports)))
      (message "%S" diffs))

;;; first.el ends here
