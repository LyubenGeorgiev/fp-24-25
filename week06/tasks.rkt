#lang racket


(define (assoc-hop key xs)
  (let ([res (dropf xs (λ (x) (not (equal? (car x) key))))])
    (if (null? res)
        #f
        (cdar res)
        )
    )
  )

(define (assoc-builtin key xs)
  (let ([res (assoc key xs)])
    (if res (cdr res) #f)
    )
  )

; using a higher order procedure
(equal? (assoc-hop 1 (list '(2 . "Two") '(3 . "Three") '(1 . "One"))) "One")
(equal? (assoc-hop 42 (list '(2 . "Two") '(3 . "Three") '(1 . "One"))) #f)

; using a built-in procedure
(equal? (assoc-builtin 1 (list '(2 . "Two") '(3 . "Three") '(1 . "One"))) "One")
(equal? (assoc-builtin 42 (list '(2 . "Two") '(3 . "Three") '(1 . "One"))) #f)

;(ormap (compose (curry eq? 1) car) (list '(2 . "Two") '(3 . "Three") '(1 . "One")))
(ormap (λ (x) (eq? 1 (car x))) (list '(2 . "Two") '(3 . "Three") '(1 . "One")))

(define (replace xs dict)
  (map (λ (x) (if (assoc-builtin x dict) (assoc-builtin x dict) x)) xs)
  )

(equal? (replace '(1 2 3 4) '((1 . 11) (2 . 22))) '(11 22 3 4))

(define (get-sublist start end xs)
       (take (drop xs start) (- end start))
       )

(equal? (get-sublist 2 6 '(1 2 2 3 1 5 6 7 7)) '(2 3 1 5))


(define (ordered xs)
  (λ (p?) (andmap p? (take xs (sub1 (length xs))) (cdr xs)))
  ;(λ (p?) (not (list? (member #f (map p? (take xs (sub1 (length xs))) (cdr xs))))))
  ;(λ (p?) (equal? xs (sort xs p?)))
  )

; with freedom to solve however you like it
(equal? ((ordered '(1 2 3 5)) (λ (x y) (< x y))) #t)
(equal? ((ordered '(1 8 29 92)) (λ (x y) (= y (+ (* x 3) 5)))) #t)
(equal? ((ordered '(1 8 3 14)) (λ (x y) (= y (+ (* x 3) 5)))) #f)

(define (zero-rows xss)
  (map (λ (xs) (if (ormap zero? xs) (make-list (length xs) 0) xs)) xss)
  )

(equal? (zero-rows '((1 2 0) (3 4 1) (0 5 7) (4 2 4))) '((0 0 0) (3 4 1) (0 0 0) (4 2 4)))
(equal? (zero-rows '((2 1 2 4) (0 2 0 1) (4 4 1 4) (4 1 3 1))) '((2 1 2 4) (0 0 0 0) (4 4 1 4) (4 1 3 1)))