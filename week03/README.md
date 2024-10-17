# Lambdas and higher order functions. Types of evaluation.

## Task 1

**Description:**

Define a higher order procedure that:

- is called `my-identity` and simulates the `identity` procedure;
- accepts a procedure and returns a lambda that accepts an argument and applies that procedure to it;
- accepts a predicate and returns a lambda that accepts an argument and applies the negated predicate to it;
- accepts two procedures and returns their composition over an argument of a lambda procedure;
- returns a procedure that is the partial application of f over x.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
; write 2 tests for subtask 1

(= ((my-lambda identity) 5) 5)
(equal? ((my-lambda identity) "Tensorflow") "Tensorflow")
(= ((my-lambda string-length) "Tensorflow") 10)

(equal? ((negate-pred even?) 6) #f)

(equal? ((my-compose even? string-length) "Tensorflow") #t)
(equal? ((my-compose (λ (x) (- x 5)) (λ (y) (+ y 25))) 5) 25)

(= ((partially-apply (λ (x y) (+ x y)) 5) 10) 15)
```

## Task 2

**Description:**

Define a higher order procedure that accepts an unary procedure - *f*, and returns a lambda of two real numbers - *x*, *y*, that subtracts f(x) from f(y).

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
(= ((difference (λ (x) (* 2 x))) 15.16 15.20) 0.0799999999999983)
(= ((difference (λ (x) (* 2 x))) 8.5 8) -1)
```

## Task 3

**Description:**

Define a higher-order procedure that takes a unary procedure `f` and a binary procedure `g` and returns a binary procedure that evaluates the expression `g(f(x), f(y))`.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
(= ((higher-composed-eval (λ (x) (* x 2)) (λ (x y) (+ x y))) 5 8) 26)
```

## Task 4

**Description:**

Define a procedure *switch-sum f g n* (*f*, *g* - procedures, *n* - number) that returns an unary procedure that for every x returns this sum: *f(x) + g(f(x)) + f(g(f(x))) +  ...* (containing *n* elements).

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 1) 2) 3)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 2) 2) 9)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 3) 2) 16)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 4) 2) 30)
```

## Task 5

**Description:**

Define an iterative `folding` procedure. A `folding` procedure is a procedure that accepts:

- `f`: A binary procedure.
- `acc`: The accumulated result. This is the `result` variable we use in our linearly iterative procedures.
- `start`: The starting value of the range.
- `end`: The ending value of the range.
- `transform`: Unary procedure to transform the current value.
- `next`: Unary procedure to generate the next value in the range.

and calculates the expression

`(f (transform start) (f (transform (next start)) ... (f (transform start) acc)))`

Use it to evaluate the following expressions:

- `1 + 2 + 3 + ... + 100`
- `1 - (2 - (3 - (4 - 5)))`
- `1 * 2 * 3 * ... * 10`
- `1 * 3 * 5 * ... * 10`
- `1^2 + 3^2 + 5^2 + ... + 100^2`

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
; 1 + 2 + 3 + ... + 100
(= (accumulate ???) 5050)

; 1 - (2 - (3 - (4 - 5)))
(= (accumulate ???) 3)

; 1 * 2 * 3 * ... * 10
(= (accumulate ???) 3628800)

; 1 * 3 * 5 * ... * 10
(= (accumulate ???) 945)

; 1^2 + 3^2 + 5^2 + ... + 100^2
(= (accumulate ???) 166650)
```

## Task 6

**Description:**

Using `accumulate` define a procedure that:

- checks whether all numbers in an interval pass a predicate `p?`;
- returns the local minimum for the unary function `f` in the interval `[start, end]`.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```lisp
(equal? (all? 100 999 (λ (x) (< x 1000))) #t)
(equal? (all? 1 100 odd?) #f)
(equal? (all? 1042 524 odd?) #f)

(define (mod7 x) (remainder x 7))
(= (argmin mod7 45 50) 49)
```