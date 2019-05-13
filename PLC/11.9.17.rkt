#lang racket

;(define alist(cons 5 (cons 2 (cons 3 null))))
;(define blist(list 5 2 3))
;(car alist)
;(cdr blist)
;(null? list)
;(null? null)
;(car blist)
;(cdr blist)
;(null? blist)
;
;(define (sum xs)
;  (if (null? xs)
;    0
;    (+ (car xs) (sum (cdr xs))))
;)
;
;(sum alist)
;(sum blist)
;
;(define (append list1 list2)
;  (if (null? list1)
;    list2
;      (cons (car list1) (append (cdr list1) list2))))
;
;(append alist blist)
;
;(define alist2 (list 2 (list 4 5) (list (list 1 2)(list 6)) 19(list 14 0)))
;
;(define (sum2 xs)
;  (if (null? xs)
;    0
;    (if (number? (car xs))
;      [+ (car xs) (sum2 (cdr xs))]
;      [+ (sum2 (car xs)) (sum2 (cdr xs))])))
;
;(sum2 alist2)
;
;(define (condsum xs)
;  (condsum [(null? xs) 0]
;    [(number? (car xs)) ((car xs) (condsum (cdr xs)))]
;    [#t (+ (condsum (car xs)) (condsum (cdr xs)))]))
;
;(condsum alist2)




(define (hello_world n)
  (if (= 1 n)
    (printf "hello world~%")
    (begin
      (printf "hello world~%")
      (hello_world(- n 1)))))

(hello_world 50)


(define (printValue symbol price shares)
  (printf "~a: ~a~%" symbol (* price shares)))

(define symbol "APPL")
(define price 100)
(define shares 6)

(printValue symbol price shares)





;(define (not-good-if x y z) (x y z))
;(define (factorial x)
;  (if (= x 0) 1
;  (* x (factorial (- x 1)))))
;(factorial 5)
;
;(define (factorial x)
;  (if (= x 0)
;    1
;    (* x (factorial (= x 1)))))
;
;(factorial 5)

;(define (better-if x y z) (if x (y) (z)))
;
;(define (better-factorial x)
;  (better-if (= x 0)
;    (lambda () 1)
;    (lambda () (* x (better-factorial (- x 1))))))
;
;(better-factorial 5)
