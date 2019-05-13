#lang racket

;Exercise 1
;Use the struct keyword to define a card datatype consisting of a
;suit and rank in Racket. Then write a function cardColor which returns
;red for red suits and black for black suits.

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


(cardColor aceOfSpades)
(cardColor threeOfHearts)
(cardColor jackOfDiamonds)
(cardColor sevenOfClubs)

(red? aceOfSpades)
(red? threeOfHearts)
(red? jackOfDiamonds)
(red? sevenOfClubs)

;Exercise 2
;Implement the filter function in Racket. It should take a function
;and a list as input, and return the result of applying the function
;to every element of the list.

(define (filter f xs)
  (if (null? xs)
      null
      (if (f (car xs))
          (cons (car xs) (filter f (cdr xs)))
          (filter f (cdr xs)))))

(filter red? cardList)
(filter black? cardList)
