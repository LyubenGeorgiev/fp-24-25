#lang racket

#|
Define a predicate `(inc-digits? n)` that checks
whether the digits of the non-negative `n` are ordered
in an ascending order.

**Acceptance criteria:**

1. All tests pass.
|#

(define (inc-digits? n)
  (if (>= (abs n) 10) ; >= 2 digits in n
      (and
       (<
        (remainder (abs (quotient n 10)) 10) ; |(n / 10)| % 10
        (remainder (abs n) 10) ; |n| % 10
        )
       (inc-digits? (quotient n 10))
       )
      #t
   )
  )

(equal? (inc-digits? 124589) #t)
(equal? (inc-digits? 12443) #f)