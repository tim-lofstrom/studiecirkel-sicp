#lang racket

(define (timlist . xs)
  (if (null? xs)
      null
      (cons (car xs)
            (apply timlist (cdr xs)))))


(define x (timlist 1 2 3 4))

(car x)
(cdr x)