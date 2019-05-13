#lang racket
(define pow
  (lambda (x)
    (lambda (y)
      (if (= y 0)
          1
          (* x ((pow x) (- y 1)))))))
(define three-to-the (pow 3))
(define eightyone (three-to-the 4))
(print eightyone)

(define (fact x)
(if (= x 0)
    1
    (* x (fact(- x 1)))))
(fact 3)
(fact 4)

(define aString "hello world")
(print aString)

(define (formatStrTest x) (printf "the parameter was ~a" x))
(formatStrTest "qwerty")

(define (add_up x)
  (if (= x 0)
      0
      (+ x (add_up(- x 1)))))

(add_up 5)
(add_up 100)