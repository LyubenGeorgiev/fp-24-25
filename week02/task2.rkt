#lang racket

#|
A number is prime if and only if it is natural,
greater than `1` and its only divisors are `1` and itself.
Define a predicate that checks whether a number is prime.

**Acceptance criteria:**

1. All tests pass.
2. Parameter validation is performed.
|#

(require math/number-theory)

(define (num-prime? n)
  (define (helper x)
    (if (> x 1)
        (or (divides? x n) (helper (sub1 x)))
        #f
     )
    )
  (if (negative? n)
      (error "Negative n")
      (and (> n 1) (not (helper (sub1 n))))
   )
  )

(equal? (num-prime? 1) #f)
(equal? (num-prime? 2) #t)
(equal? (num-prime? 3) #t)
(equal? (num-prime? 6) #f)
(equal? (num-prime? 42) #f)
(equal? (num-prime? 61) #t)