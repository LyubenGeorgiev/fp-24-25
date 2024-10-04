#lang racket

#|
The first few numbers of the Fibonacci sequence are:
`0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 ...` and so on.
Define two functions `fib-rec` and `fib-iter`
that return the number at the $i^{th}$ index.

**Acceptance criteria:**

1. All tests pass.
2. Parameter validation is performed.
3. `fib-rec` creates a linearly recursive process.
4. `fib-iter` creates a linearly iterative process.
5. Demonstrate the difference in execution time between iterative and recursive processes.
|#

(define (fib-rec n)
  (cond
    [(negative? n) (error "N is negative")]
    [(< n 2) n]
    [else (+ (fib-rec (sub1 n)) (fib-rec (- n 2)))]
    )
  )

(define (fib-iter n)
  (define (helper n a b)
    (if (zero? n)
        a
        (helper (sub1 n) b (+ a b))
     )
    )
  (if (negative? n)
    (error "N is negative")
    (helper n 0 1)
    )
  )

(fib-iter 50)
;(fib-rec 40)
;(fib-iter 50)

(= (fib-rec 11) 89)
(= (fib-iter 11) 89)