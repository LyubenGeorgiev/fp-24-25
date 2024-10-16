#lang racket

#|
Define a recursive and an iterative procedure for
calculating `x` to the power of `n`.

**Acceptance criteria:**

1. All tests pass.
2. `pow-rec` is a linearly recursive procedure.
3. `pow-iter` is a linearly iterative procedure.
|#

(define (pow-rec x n)
  (if (zero? n)
      1
      (* x (pow-rec x (sub1 n)))
   )
  )

(define (pow-iter x n)
  (define (helper n result)
    (if (zero? n)
     result
     (helper (sub1 n) (* result x))
     )
    )
  (helper n 1)
  )

(= (pow-rec 2 5) 32)
(= (pow-rec 15 3) 3375)
(= (pow-rec -2 3) -8)
(= (pow-rec -2 2) 4)
(= (pow-rec 0 2) 0)

(= (pow-iter 2 5) 32)
(= (pow-iter 15 3) 3375)
(= (pow-iter -2 3) -8)
(= (pow-iter -2 2) 4)
(= (pow-iter 0 2) 0)