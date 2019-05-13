#lang racket

;-------------------------------------------------------------------------------
;Exercise 1
;-------------------------------------------------------------------------------
;Implement the map function in Racket. It should take a function
;and a list as input, and return the result of applying the function
;to every element of the list.
;-------------------------------------------------------------------------------
(struct card (suit rank) #:transparent)

(define aceOfSpades (card 'spades 'ace))
(define threeOfHearts (card 'hearts 3))
(define alsoThreeOfHearts (card 'hearts 3))
(define jackOfDiamonds (card 'diamonds 'jack))
(define sevenOfClubs (card 'clubs 7))

(define cardList(list aceOfSpades threeOfHearts alsoThreeOfHearts jackOfDiamonds sevenOfClubs))

(define (cardColor c)
  (if (or (eq? (card-suit c) 'hearts)
          (eq? (card-suit c) 'diamonds))
      'red
      'black))

(define (red? c)
  (if (eq? (cardColor c) 'red)
      #t
      #f))

(define (black? c)
  (if (eq? (cardColor c) 'black)
      #f
      #t))

      (define (filter f xs)
        (if (null? xs)
            null
            (if (f (car xs))
                (cons (car xs) (filter f (cdr xs)))
                (filter f (cdr xs)))))

      (filter red? cardList)
      (filter black? cardList)

(define (map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (map f (cdr xs)))))

(map cardColor cardList)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Exercise 2
;-------------------------------------------------------------------------------
;Implement a function called cardValue which takes a card as input
;and returns its value. The value of a numbered card is its number,
;aces have a value of 11, and all other cards have a value of 10.
;-------------------------------------------------------------------------------

(define numList '(1 2 3 4))
(map (lambda(x) (+ x 1)) numList)
(map (lambda (x) (+ x 100)) numList)

(define (cardValue c)
  (cond [(eq? (card-rank c) 'jack) 10]
        [(eq? (card-rank c) 'queen) 10]
        [(eq? (card-rank c) 'king) 10]
        [(eq? (card-rank c) 'ace) 11]
        [#t (card-rank c)]))

(map cardValue cardList)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Exercise 3
;-------------------------------------------------------------------------------
;Implement the fold function in Racket.
;Fold applies a function to a list and returns the
;-------------------------------------------------------------------------------

(define (fold f acc xs)
  (if (null? xs)
      acc
      (fold f (f acc (car xs)) (cdr xs))))

;(define (addOne x)
;  (+ x 1))
;
;(fold addOne 0 numList)

(define (sameColor? c)
    (lambda (acc c2) (and
                      acc
                      (eq? (cardColor c) (cardColor c2)))))

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Exercise 4
;-------------------------------------------------------------------------------
;Use fold to implement a function allSameColor which returns
;whether or not a list contains all red or all black cards.
;-------------------------------------------------------------------------------

(define (allSameColor cs)
  (fold (sameColor? (car cs)) #t cs))

(allSameColor cardList)
