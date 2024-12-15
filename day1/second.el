(provide 'day2)

(setq input (with-temp-buffer
  (insert-file-contents "test.txt")
  (buffer-string)))

(let* ((numbers (mapcar (lambda (x) (mapcar #'string-to-number (split-string x "   "))) (butlast (split-string input "\n"))))
  (s (list (mapcar 'car numbers) (mapcar 'cadr numbers)))
  (occurs (cl-reduce #'+ (mapcar (lambda (x) (cl-reduce #'* (list x (length (remove nil (mapcar (lambda (y) (eq x y)) (cadr s))))))) (car s)))))
  (message "%S" occurs))

;;; day2.el ends here
