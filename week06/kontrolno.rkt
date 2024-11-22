#lang racket

(define (find-start player-map)
  (findf
   cdr
   (map
    (λ (xs row) (cons row (index-of xs "S")))
    player-map
    (range (length player-map))
    )
   )
)

(equal? (find-start '(("." "." ".") ("." "." ".") ("." "S" ".") ("." "." "."))) '(2 . 1))
(equal? (find-start '(("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" "."))) '(1 . 0))

(define (up coord) (cons (sub1 (car coord)) (cdr coord)))
(define (down coord) (cons (add1 (car coord)) (cdr coord)))
(define (left coord) (cons (car coord) (sub1 (cdr coord))))
(define (right coord) (cons (car coord) (add1 (cdr coord))))

(define (steps s)
  (cond
    [(equal? s "|") (list up down)]
    [(equal? s "-") (list left right)]
    [(equal? s "L") (list up right)]
    [(equal? s "J") (list up left)]
    [(equal? s "7") (list left down)]
    [(equal? s "F") (list right down)]
    [(equal? s ".") '()]
    [(equal? s "S") (list up down right left)]
    [else (error "Unknown cell value")]
    )
  )

(define (get-next-steps player-map current-position)
  (let* ([move-fs (steps (list-ref (list-ref player-map (car current-position)) (cdr current-position)))]
         [all-moves (map apply move-fs (make-list (length move-fs) (list current-position)))]
         [rows (length player-map)]
         [cols (length (car player-map))]
         )
    (filter (λ (coord) (let ([row (car coord)] [col (cdr coord)]) (and (>= row 0) (>= col 0) (< row rows) (< col cols)))) all-moves)
    )
  )

(equal? (get-next-steps '(("." "." ".") ("." "." ".") ("." "S" ".") ("." "." ".")) '(2 . 1)) '((1 . 1) (3 . 1) (2 . 2) (2 . 0)))
(equal? (get-next-steps '(("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" ".")) '(1 . 2)) '((0 . 2) (2 . 2)))
(equal? (get-next-steps '(("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" ".")) '(0 . 3)) '((0 . 2)))

(define (num-steps-farthest player-map)
  (define (solve used current-position)
    (apply max 0 (filter-map (λ (x) (and (not (member x used)) (add1 (solve (cons current-position used) x)))) (get-next-steps player-map current-position)))
    )
  (solve '() (find-start player-map))
  )

(eq? (num-steps-farthest '(("." ".") ("S" ".") ("." "."))) 1)
(eq? (num-steps-farthest '(("." "." ".") ("S" "-" "|") ("." "." "."))) 3)
(eq? (num-steps-farthest '(("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" "."))) 4)
(eq? (num-steps-farthest '(("." "." "." ".") ("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" "."))) 5)
(eq? (num-steps-farthest '(("." "." "." "|") ("." "." "F" "J") ("S" "-" "|" ".") ("." "." "J" "."))) 5)
(eq? (num-steps-farthest '(("F" "-" "7" "." "." "|") ("|" "." "|" "." "F" "J") ("|" "." "S" "-" "|" ".") ("|" "." "." "." "|" ".") ("L" "-" "-" "." "J" "."))) 11)
