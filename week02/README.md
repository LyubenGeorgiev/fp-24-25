## New stuff
### ```expt``` - power function
```scheme
(expt 2 10) ; 1024
```
### ```divides?```
```scheme
(require math/number-theory)
(divides? 2 5) ; #f
(divides? 2 6) ; #t
```
### ```divisor-sum```
```scheme
(require math/number-theory)
(divisor-sum 10) ; 18 (1+2+5+10=18)
```
### ```trace``` - useful for debugging
```
(require racket/trace)
```
### ```factorial```
```scheme
(require math/number-theory)
(factorial 6) ; 720
```

## Task 1

**Description:**

Define a recursive and an iterative procedure for calculating `x` to the power of `n`.

**Acceptance criteria:**

1. All tests pass.
2. `pow-rec` is a linearly recursive procedure.
3. `pow-iter` is a linearly iterative procedure.

**Test cases:**

```scheme
(= (pow-rec 2 5) 32)
(= (pow-rec 15 3) 3375)

(= (pow-iter 2 5) 32)
(= (pow-iter 15 3) 3375)
```

## Task 2

**Description:**

A number is prime if and only if it is natural, greater than `1` and its only divisors are `1` and itself. Define a predicate that checks whether a number is prime.

**Acceptance criteria:**

1. All tests pass.
2. Parameter validation is performed.

**Test cases:**

```scheme
(equal? (num-prime? 1) #f)
(equal? (num-prime? 2) #t)
(equal? (num-prime? 3) #t)
(equal? (num-prime? 6) #f)
(equal? (num-prime? 42) #f)
(equal? (num-prime? 61) #t)
```

## Task 3

**Description:**

Define a procedure that returns the sum of all the divisors of a number. For negative numbers return `0`.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```scheme
(= (sum-divs 0) 0)
(= (sum-divs 1) 1)
(= (sum-divs 6) 12) ; 1 + 2 + 3 + 6
(= (sum-divs -6) 0)
(= (sum-divs 12345) 19776)
```

## Task 4

**Description:**

A number is perfect if and only if it is natural and equal to the sum of its divisors, excluding the number itself. Define a predicate that checks whether a number is perfect. Assume correct input.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```scheme
(equal? (perfect? 6) #t)
(equal? (perfect? 33550336) #t)
(equal? (perfect? 495) #f)
(equal? (perfect? 1) #f)
```

## Task 5

**Description:**

Define a predicate `(inc-digits? n)` that checks whether the digits of the non-negative `n` are ordered in an ascending order.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```scheme
(equal? (inc-digits? 1244) #t)
(equal? (inc-digits? 12443) #f)
```

## Task 6

**Description:**

A narcissistic number is a number which is the sum of its own digits, each raised to the power of the number of digits in a given base. Define a predicate that checks whether a given number is a narcissistic number.

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

**Test cases:**

```scheme
(equal? (narcissistic? 7) #t)
(equal? (narcissistic? 12) #f)
(equal? (narcissistic? 153) #t)
(equal? (narcissistic? 370) #t)
(equal? (narcissistic? 371) #t)
(equal? (narcissistic? 1634) #t)
```

## Task 7

**Description:**

Define a procedure that finds the maximum digit in a number.

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```scheme
(= (find-max 55345) 5)
(= (find-max 14752) 7)
(= (find-max 329450) 9)
(= (find-max 9521) 9)
```

## Task 8

**Description:**

Define the procedure that accepts a whole number - $n$, and a real number (representing radians) - $x$, and returns the $n^{th}$ partial sum of $sin(x)$.

Here's the formula for calculating $sin(x)$ around the origin:

![Alt text](./assets/sine.png?raw=true "Task8")

**Acceptance criteria:**

1. All tests pass.

**Test cases:**

```scheme
(= (my-sin 100 1.570796) 0.9999999999999465) ; 90 degrees => 0.9999999999999465
(= (my-sin 100 0.5235988) 0.5000000211324931) ; 30 degrees => 0.5000000211324931
```