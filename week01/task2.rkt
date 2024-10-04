#lang racket

#|
Define two functions - `fact-rec` and `fact-iter`,
that return the factorial of a `non-negative` number.

**Acceptance criteria:**

1. All tests pass.
2. Parameter validation is performed.
3. `fact-rec` creates a linearly recursive process.
4. `fact-iter` creates a linearly iterative process.
|#

(define (fact-rec n)
  (cond
    [(negative? n) (error "N is negative")]
    [(zero? n) 1]
    [else (* n (fact-rec (sub1 n)))]
   )
  )

(define (fact-iter n)
  (define (fact-helper n res)
    (if (zero? n)
        res
        (fact-helper (- n 1) (* n res))
        )
    )
  (if (negative? n)
      (error "N is negative")
      (fact-helper n 1)
      )
  )



; (fact-iter -1)
(= (fact-rec 0) 1)
(= (fact-rec 1) 1)
(= (fact-rec 11) 39916800)

(= (fact-iter 0) 1)
(= (fact-iter 1) 1)
(= (fact-iter 11) 39916800)