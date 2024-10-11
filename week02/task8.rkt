#lang racket

#|
Define the procedure that accepts a whole number - n,
and a real number (representing radians) - x,
and returns the nth partial sum of sin(x).

**Acceptance criteria:**

1. All tests pass.
|#

(require math/number-theory)
(require math)

(define (my-sin-rec n x)
  (if (negative? n)
      0
      (+
       (my-sin-rec (sub1 n) x)
       (/
        (*
         (expt -1 n)
         (expt x (add1 (* n 2)))
         )
        (factorial (add1 (* n 2))) ; divisor
        )
       )
   )
  )

(define (my-sin-iter n x)
  (define (helper i result)
    (if (<= i n)
        (helper
         (add1 i)
         (+
          result
          (/
           (*
            (expt -1 i)
            (expt x (add1 (* i 2)))
            )
           (factorial (add1 (* i 2))) ; divisor
           )
          )
         )
        result
     )
    )
  (helper 0 0)
  )


(= (my-sin-rec 100 (/ pi 2)) 1.0000000000000002) ; 90 degrees =>  1.0000000000000002
(= (my-sin-rec 100 (/ pi 6)) 0.49999999999999994) ; 30 degrees => 0.49999999999999994
(= (my-sin-iter 100 (/ pi 2)) 1.0000000000000002) ; 90 degrees =>  1.0000000000000002
(= (my-sin-iter 100 (/ pi 6)) 0.49999999999999994) ; 30 degrees => 0.49999999999999994