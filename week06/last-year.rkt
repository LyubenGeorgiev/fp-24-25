#lang racket

(define (fib n)
  (define (helper i cur prev)
    (if (< i n)
        (helper (add1 i) (+ cur prev) cur)
        prev
        )
    )
  (helper 0 1 0)
  )

(define (num-to-xs n)
  (define (helper n)
    (if (< n 10)
        (list n)
        (cons (remainder n 10) (helper (quotient n 10)))
        )
    )
  (reverse (helper n))
  )

(define (group xs k)
  ;(if (<= (length xs) k)
      ;(list xs)
      ;(cons (take xs k) (group (drop xs k) k))
      ;)
  (map (curry map car) (group-by (λ (p) (quotient (cdr p) k)) (map cons xs (range (length xs)))))
  )


;(define (transpose xss)
;  (apply map list xss)
;  )

;(transpose '((1 2 3) (4 5 6) (7 8 9)))


(define (map-count xs)
  (map (λ (x) (cons x (count (curry eq? x) xs))) xs)
  )

(define (filter-max-count xs)
  (let* ([max-count (cdr (argmax cdr xs))] [double-count (* 2 max-count)])
    (remove-duplicates (filter (λ (x) (eq? max-count (cdr x))) xs))
    )
  )

(define (around-fib n)
  (λ (k)
    (map (λ (gr) (argmin car (filter-max-count (map-count gr)))) (group (num-to-xs (fib n)) k))
    )
  )

((around-fib 100) 25) ;→ '((1 . 3))
((around-fib 180) 25) ;→ '((1 . 5) (7 . 3))
((around-fib 1700) 25) ;→ '((1 . 4) (2 . 5) (0 . 6) (4 . 5) (5 . 7)
;(2 . 4) (6 . 7) (3 . 5) (0 . 4) (8 . 5) (4 . 5) (4 . 4) (7 . 7)
;(7 . 6) (2 . 2))
((around-fib 500) 42) ;→ '((0 . 6) (2 . 7) (2 . 6))
((around-fib 6000) 242) ;→ '((5 . 31) (8 . 33) (8 . 31) (7 . 35) (7 . 31) (4 . 7))