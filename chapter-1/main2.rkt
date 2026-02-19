#lang racket

(define sq (lambda (x)(* x x)))

(define biggest (lambda (x y)(if (> x y) x y)))

(define sos (lambda (x y z)
              (if (> x y)
                  (+ (sq x) (sq (biggest z y)))
                  (+ (sq y) (sq (biggest z x))))))


(sos 7 5 6)