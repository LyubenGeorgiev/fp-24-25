#lang racket


(define (sort-list xs)
  (curry sort xs)
  )

((sort-list '("one" "two" "0" "five" "" "one hundred" "onehundred")) (λ (a b) (< (string-length a) (string-length b))))


(define (my-length-rec xs)
  (if (null? xs)
      0
      (add1 (my-length-rec (cdr xs)))
   )
  )

(define (my-length-proc xs)
  (length xs)
  )

; using a recursive procedure
(= (my-length-rec '()) 0)
(= (my-length-rec '(1 2 5 6 4 8)) 6)

; using a predefined procedure
(= (my-length-proc '()) 0)
(= (my-length-proc '(1 2 5 6 4 8)) 6)

(define (elem-rec-without-mc? x xs)
  (and
   (not (null? xs))
   (or
    (eq? x (car xs))
    (elem-rec-without-mc? x (cdr xs))
    )
   )
  )

(define (elem-proc? x xs)
  (list? (member x xs))
  )

; without using a manual check
(equal? (elem-rec-without-mc? 1 '(5 2 1)) #t)
(equal? (elem-rec-without-mc? "str" '()) #f)
(equal? (elem-rec-without-mc? "str" '("str" "len" "pair")) #t)

; using a predefined procedure
(equal? (elem-proc? 1 '(5 2 1)) #t)
(equal? (elem-proc? "str" '()) #f)
(equal? (elem-proc? "str" '("str" "len" "pair")) #t)


(define (get-smallest-fold-proc xs)
  (if (null? xs)
      (error "Empty list")
      (foldr min (car xs) xs)
   )
  )

; using a folding with a predefined procedure
(= (get-smallest-fold-proc '(1 2 5)) 1)
(= (get-smallest-fold-proc '(2 1 5)) 1)
(= (get-smallest-fold-proc '(2 1 -1 5)) -1)


(define (remove-first-proc x xs)
  (remove x xs)
  )

(define (remove-first-no-proc x xs)
  (if (null? xs)
      '()
      (if (equal? x (car xs))
          (cdr xs) ; Removes first occurance
          (cons (car xs) (remove-first-no-proc x (cdr xs)))
       )
   )
  )

; using a predefined procedure
(equal? (remove-first-proc 1 '(1 1 1 2)) '(1 1 2))
(equal? (remove-first-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-first-proc 1 '(1)) '())
(equal? (remove-first-proc 1 '(2 1)) '(2))
(equal? (remove-first-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN" "RNN"))

; without using a predefined procedure
(equal? (remove-first-no-proc 1 '(1 1 1 2)) '(1 1 2))
(equal? (remove-first-no-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-first-no-proc 1 '(1)) '())
(equal? (remove-first-no-proc 1 '(2 1)) '(2))
(equal? (remove-first-no-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN" "RNN"))


(define (get-smallest-proc xs)
  (apply min xs)
  )

; using a folding with a predefined procedure
(= (get-smallest-proc '(1 2 5)) 1)
(= (get-smallest-proc '(2 1 5)) 1)
(= (get-smallest-proc '(2 1 -1 5)) -1)


(define (num-to-xs x)
  (define (helper x)
    (if (< x 10)
      (list x)
      (cons (remainder x 10) (helper (quotient x 10)))
      )
    )
  (reverse (helper x))
  )

(define (xs-to-num xs)
  (foldl (λ (x acc) (+ (* acc 10) x)) 0 xs)
  )

(equal? (num-to-xs 123) '(1 2 3))
(equal? (num-to-xs 123456789) '(1 2 3 4 5 6 7 8 9))

(= (xs-to-num '(1 2 3)) 123)
(= (xs-to-num '(1 2 3 4 5 6 7 8 9)) 123456789)



