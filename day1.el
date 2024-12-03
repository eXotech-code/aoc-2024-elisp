(provide 'day1)


;; (setq input "3   4
;; 4   3
;; 2   5
;; 1   3
;; 3   9
;; 3   3")

(setq input (with-temp-buffer
  (insert-file-contents "input.txt")
  (buffer-string)))


(defun zip (list1 list2) (if (or (null list1) (null list2)) nil (cons (list (car list1) (car list2)) (zip (cdr list1) (cdr list2)))))

(let* ((numbers (mapcar (lambda (str) (mapcar (lambda (s) (string-to-number s)) (split-string str "   "))) (split-string input "\n")))
  (combined (apply 'zip (mapcar (lambda (x) (sort x '<)) (list (mapcar 'car numbers) (mapcar 'cadr numbers))))))
  (message "%S" (apply '+ (mapcar (lambda (x) (abs (apply '- x))) combined))))

;;; day1.el ends here
