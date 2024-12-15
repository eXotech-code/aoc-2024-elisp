(provide 'day1)

(setq input (with-temp-buffer
  (insert-file-contents "test.txt")
  (buffer-string)))

(let* ((numbers (mapcar (lambda (str) (mapcar (lambda (s) (string-to-number s)) (split-string str "   "))) (butlast (split-string input "\n"))))
      (s (mapcar (lambda (x) (sort x '<)) (list (mapcar 'car numbers) (mapcar 'cadr numbers)))))
      (message "%S" (cl-reduce #'+ (cl-mapcar (lambda (x y) (abs (- x y))) (car s) (cadr s)))))

;;; day1.el ends here
