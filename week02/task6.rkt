#lang racket

#|
A narcissistic number is a number which is the sum of
its own digits, each raised to the power of the number
of digits in a given base.

Define a predicate that checks whether a given number
is a narcissistic number.

For example, take `153` (`3` digits):

```text
1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
```

and `1634` (`4` digits):

```text
1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
```

**Acceptance criteria:**

1. All tests pass.
2. Only linearly recursive processes are used.
3. Show how `racket/trace` can help.
|#

(require racket/trace)

(define (num-digits n)
  (if (< n 10) ; single digit number
      1
      (add1 (num-digits (quotient n 10)))
      )
  )

(define (num-digits2 n)
  (if (zero? n)
      1
      (if (< n 1)
          0
          (add1 (num-digits2 (/ n 10)))
       )
   )
  )

(define (narcissistic? n)
  (define (helper len current)
    (if (positive? current)
        (+
         (expt (remainder current 10) len)
         (helper len (quotient current 10))
         )
        0
     )
    )
  (trace helper)
  (= (helper (num-digits n) n) n)
  )

(equal? (num-digits 0) 1)
(equal? (num-digits2 0) 1)
(equal? (num-digits2 1) 1)
(equal? (num-digits2 2) 1)
(equal? (num-digits2 10) 2)
(equal? (num-digits2 11) 2)
(equal? (num-digits2 12) 2)
(equal? (num-digits2 999999999) 9)
(equal? (num-digits2 1000000000) 10)
(equal? (num-digits2 1000000001) 10)

(equal? (narcissistic? 7) #t)
(equal? (narcissistic? 12) #f)
(equal? (narcissistic? 153) #t)
(equal? (narcissistic? 370) #t)
(equal? (narcissistic? 371) #t)
(equal? (narcissistic? 1634) #t)