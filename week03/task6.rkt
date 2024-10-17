#lang racket

#|
Using `accumulate` define a procedure that:

- checks whether all numbers in an interval pass a predicate `p?`;
- returns the local minimum for the unary function `f`
  in the interval `[start, end]`.

**Acceptance criteria:**

1. All tests pass.
|#


(define (all? start end p?)
  
  )

(define (argmin f start end)
  
  )

#|
start=45
add_start=46
??? (mod7 46) (mod 45) => 3
(mod7 3)
|#

(equal? (all? 100 999 (λ (x) (< x 1000))) #t)
(equal? (all? 1 100 odd?) #f)
(equal? (all? 1042 524 odd?) #f)

(define (mod7 x) (remainder x 7))
(= (argmin mod7 45 50) 49)