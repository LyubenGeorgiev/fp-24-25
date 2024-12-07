#lang racket

#|
Define a procedure that finds the maximum digit in a number.

**Acceptance criteria:**

1. All tests pass.
|#

(define (find-max n)
  (if (< (abs n) 10)
      (abs n)
      (max (remainder (abs n) 10) (find-max (quotient (abs n) 10)))
      )
  )

(= (find-max 55345) 5)
(= (find-max 14752) 7)
(= (find-max 329450) 9)
(= (find-max 9521) 9)
(= (find-max -55345) 5)
(= (find-max -14752) 7)
(= (find-max -329450) 9)
(= (find-max -9521) 9)