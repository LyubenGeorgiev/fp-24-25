# Racket - recursion
- credits to Simo

## General
- Dynamically-Typed
- Every pair of '(' and ')' expects a procedure
- Call-by-Value

## Types
- Numeric
- Strings and characters ("foo" and #\a)
- Booleans (#t and #f)
  - Operators "short circuit"

## Define a procedure
```scheme
#lang racket

; define a function named f with two named arguments x and y
(define (f x y)
  ; body of the function simply returns x
  x
  )

(define x 23) ; can be used as some kind of constant
> x ; -> 23
```

## Invoke a procedure
```scheme
(f 42 "unused")
```

## If statement
```scheme
#lang racket


(define (simple-if-func cond x y)
  (if cond
      x
      y
      )
  )

(simple-if-func #t "true" "false") ; -> true
(simple-if-func #f "true" "false") ; -> false
(simple-if-func (< 3 5) "true" "false") ; -> true
```