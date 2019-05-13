#lang racket

;Exercise 1
;Implement findMaxValue in Racket.
;It should take a list of stocks as input and return the stock
;with the highest value. Represent your stocks with a new struct, i.e.,
;(define googleStock (stock "GOOG" 70 15))
;(define facebookStock (stock "FB" 20 8))
;(define ibmStock (stock "IBM" 2 15))
;(define stockList (list googleStock facebookStock ibmStock))

(define (findMaxValue stocks)
  (if (null? (cdr stocks))
    (car stocks)
    (let ([s1 (car stocks)]
          [maxTail (findMaxValue (cdr stocks))])
      (if (compareValue s1 maxTail)
        s1
        maxTail))))

(struct stock (symbol shares value) #:transparent)

(define (value aStock)
  (* (stock-shares aStock) (stock-value aStock)))

(define (compareValueToThreshold aStock threshold)
  (> (value aStock) threshold))

(define (compareValue aStock bStock)
  (> (value aStock) (value bStock)))

(define (my-delay f)
  (mcons #f f))

(define (my-force th)
  (if (mcar th)
      (mcdr th)
      (begins (set-mcar! th #t)
              (set-mcdr! th ((mcdr th)))
              (mcdr th))))

(define googleStock (stock "GOOG" 70 15))
(define facebookStock (stock "FB" 20 8))
(define ibmStock (stock "IBM" 2 15))
(define stockList (list googleStock facebookStock ibmStock))
(findMaxValue stockList)

;Exercise 2
;Reimplement compareValue using thunks, delay, and force.

(define (compareValueThunk s1Value s2Value)
  (> (my-force s1Value) (my-force s2Value)))

(define googleValue (my-delay (lambda () (value googleStock))))
;(define facebookStock (my-delay (lambda () (value facebookStock))))
(define ibmStock (my-delay (lambda () (value ibmStock))))

(my-force googleValue)
(my-force googleValue)
(my-force googleValue)
(my-force googleValue)
(my-force facebookStock)
(my-force facebookStock)
(my-force facebookStock)
(my-force facebookStock)
(my-force ibmStock)
(my-force ibmStock)
(my-force ibmStock)
(my-force ibmStock)

(findMaxValue stockList)

;Exercise 3
;Reimplement findMaxValue using thunks, delay, and force.

(define (findMaxValueThunk stocks)
  (if (null? (cdr stocks))
  (car stocks)
  (let* ([s1 (car stocks)]
         [s1Value (my-delay (lambda () (value s1)))]
         [maxTail (findMaxValueThunk (cdr stocks))]
         [maxTailValue (my-delay (lambda () (valye maxTail)))]
         (if (compareValueThunk s1Value maxTailValue)
          s1
          maxTail)))))
