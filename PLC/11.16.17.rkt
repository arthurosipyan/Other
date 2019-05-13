#lang racket

;-------------------------------------------------------------------------------
;Exercise 1
;-------------------------------------------------------------------------------
;Write Racket expressions that do the following:
;1. Defines a function compareValue that takes price, shares and threshold as
;   arguments and returns true if price x shares is greater than threshold and
;   false otherwise.
;2. Binds the value 250 to the variable threshold
;3. Binds the value 100 to the variable price
;4. Binds the value 5 to the variable shares
;5. Calls the function compareValue
;-------------------------------------------------------------------------------

(define (compareValue price shares treshold)
  (if (> (* price shares) treshold)
  #t
  #f))
(define threshold 250)
(define price 100)
(define shares 5)
(compareValue threshold price shares)
